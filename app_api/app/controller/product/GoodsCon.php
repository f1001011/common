<?php
declare(strict_types=1);

namespace app\controller\product;

use app\controller\BaseCon;
use app\model\CommonGoodsModel;
use app\model\CommonGoodsOrderModel;
use app\model\CommonUserModel;
use app\model\CommonPayMoneyLogModel;
use think\facade\Db;
use think\facade\Cache;

/**
 * 商品控制器
 */
class GoodsCon extends BaseCon
{
    /**
     * 商品列表
     */
    public function GetGoodsList()
    {
        $postField = 'status,page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $status = $post['status'] ?? 0;
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        
        $map = [];
        if ($status == CommonGoodsModel::STATUS_ONLINE || $status == CommonGoodsModel::STATUS_COMING_SOON) {
            $map['status'] = $status;
        }
        
        $map['del'] = CommonGoodsModel::DEL_NO;
        
        $list = CommonGoodsModel::PageList($map, '*', (int)$page, (int)$limit, 'sort asc, id desc');
        
        return Show(SUCCESS, $list);
    }
    
    /**
     * 商品详情
     */
    public function GetGoodsDetail()
    {
        $postField = 'id';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $id = $post['id'] ?? 0;
        
        if (!$id) {
            return Show(ERROR, [], 'id_required');
        }
        
        $map = [
            'id' => $id,
            'status' => CommonGoodsModel::STATUS_ONLINE,
            'del' => CommonGoodsModel::DEL_NO,
        ];
        
        $detail = CommonGoodsModel::PageDataOne($map);
        
        if (!$detail) {
            return Show(ERROR, [], 'goods_not_found');
        }
        
        return Show(SUCCESS, $detail);
    }
    
    /**
     * 购买商品
     */
    public function BuyGoods()
    {
        $postField = 'goods_id,num';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $goodsId = $post['goods_id'] ?? 0;
        $num = $post['num'] ?? 1;
        $userId = $this->request->UserID;
        
        if (!$goodsId) {
            return Show(ERROR, [], 10073);
        }
        
        if ($num <= 0) {
            return Show(ERROR, [], 10075);
        }
        
        // 0. 加锁防止并发
        $lockKey = 'buy_goods_lock_' . $userId . '_' . $goodsId;
        if (Cache::get($lockKey)) {
            return Show(ERROR, [], 10016);
        }
        Cache::set($lockKey, 1, 5);
        
        // 1. 获取商品信息
        $goods = CommonGoodsModel::PageDataOne([
            'id' => $goodsId,
            'status' => CommonGoodsModel::STATUS_ONLINE,
            'del' => CommonGoodsModel::DEL_NO,
        ]);
        
        if (!$goods) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10073);
        }
        
        // 2. 检查商品是否上架
        if ($goods['status'] != CommonGoodsModel::STATUS_ONLINE) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10074);
        }
        
        // 3. 计算订单金额
        $orderMoney = $goods['goods_money'] * $num;
        
        // 4. 获取用户信息
        $user = CommonUserModel::PageDataOne(['id' => $userId]);
        
        if (!$user) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10017);
        }
        
        // 5. 检查用户等级是否满足购买条件
        if ($goods['level_vip'] > 0 && $user['level_vip'] < $goods['level_vip']) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10079);
        }
        
        // 6. 检查用户余额是否足够
        $moneyBefore = $user['money_balance'] ?? 0;
        if ($moneyBefore < $orderMoney) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10076);
        }
        
        // 7. 使用事务保存结果
        Db::startTrans();
        try {
            // 7.1 减少用户余额
            $result = CommonUserModel::decMoney($userId, $orderMoney);
            if (!$result) {
                throw new \Exception('余额扣除失败');
            }
            
            // 7.2 获取扣款后余额
            $moneyEnd = $moneyBefore - $orderMoney;
            
            // 7.3 写入资金记录
            CommonPayMoneyLogModel::recordMoneyLog(
                $userId,
                CommonPayMoneyLogModel::TYPE_EXPEND,
                CommonPayMoneyLogModel::STATUS_BUY_GOODS,
                CommonPayMoneyLogModel::MONEY_TYPE_BALANCE,
                $orderMoney,
                $moneyBefore,
                $moneyEnd,
                '购买商品: ' . $goods['goods_name']
            );
            
            // 7.4 创建订单
            $order = CommonGoodsOrderModel::createOrder(
                $userId,
                $user['user_name'],
                $goods,
                $num
            );
            
            Db::commit();
            Cache::delete($lockKey);
            
            return Show(SUCCESS, $order, 10077);
            
        } catch (\Throwable $e) {
            Db::rollback();
            Cache::delete($lockKey);
            return Show(ERROR, [], 10078);
        }
    }
}
