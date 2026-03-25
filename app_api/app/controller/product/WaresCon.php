<?php
declare(strict_types=1);

namespace app\controller\product;

use app\controller\BaseCon;
use app\model\CommonWaresModel;
use app\model\CommonWaresOrderModel;
use app\model\CommonUserModel;
use app\model\CommonPayMoneyLogModel;
use think\facade\Db;
use think\facade\Cache;

/**
 * 积分商品控制器
 */
class WaresCon extends BaseCon
{
    /**
     * 积分商品列表
     */
    public function GetWaresList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        
        $map = ['status' => CommonWaresModel::STATUS_ONLINE];
        
        $list = CommonWaresModel::PageList($map, '*', (int)$page, (int)$limit, 'sort asc, id desc');
        
        return Show(SUCCESS, $list);
    }
    
    /**
     * 积分商品详情
     */
    public function GetWaresDetail()
    {
        $postField = 'id';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $id = $post['id'] ?? 0;
        
        if (!$id) {
            return Show(ERROR, [], 'id_required');
        }
        
        $map = [
            'id' => $id,
            'status' => CommonWaresModel::STATUS_ONLINE,
        ];
        
        $detail = CommonWaresModel::PageDataOne($map);
        
        if (!$detail) {
            return Show(ERROR, [], 'wares_not_found');
        }
        
        return Show(SUCCESS, $detail);
    }
    
    /**
     * 购买/兑换积分商品
     */
    public function BuyWares()
    {
        $postField = 'wares_id,address,phone';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $waresId = $post['wares_id'] ?? 0;
        $address = trim($post['address'] ?? '');
        $phone = trim($post['phone'] ?? '');
        $userId = $this->request->UserID;
        
        if (!$waresId) {
            return Show(ERROR, [], 10080);
        }
        
        if (empty($address)) {
            return Show(ERROR, [], 10082);
        }
        
        if (empty($phone)) {
            return Show(ERROR, [], 10083);
        }
        
        // 0. 加锁防止并发
        $lockKey = 'buy_wares_lock_' . $userId . '_' . $waresId;
        if (Cache::get($lockKey)) {
            return Show(ERROR, [], 10016);
        }
        Cache::set($lockKey, 1, 5);
        
        // 1. 获取积分商品信息
        $wares = CommonWaresModel::PageDataOne([
            'id' => $waresId,
            'status' => CommonWaresModel::STATUS_ONLINE,
        ]);
        
        if (!$wares) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10080);
        }
        
        // 2. 检查商品是否上架
        if ($wares['status'] != CommonWaresModel::STATUS_ONLINE) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10081);
        }
        
        // 3. 获取用户信息
        $user = CommonUserModel::PageDataOne(['id' => $userId]);
        
        if (!$user) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10017);
        }
        
        // 4. 检查用户积分是否足够
        $integralBefore = $user['money_integral'] ?? 0;
        $waresMoney = $wares['wares_money'];
        
        if ($integralBefore < $waresMoney) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10084);
        }
        
        // 5. 使用事务保存结果
        Db::startTrans();
        try {
            // 5.1 扣除用户积分
            $result = CommonUserModel::decIntegral($userId, $waresMoney);
            if (!$result) {
                throw new \Exception('积分扣除失败');
            }
            
            // 5.2 获取扣除后积分
            $integralEnd = $integralBefore - $waresMoney;
            
            // 5.3 写入资金记录（积分消耗）
            CommonPayMoneyLogModel::recordMoneyLog(
                $userId,
                CommonPayMoneyLogModel::TYPE_EXPEND,
                CommonPayMoneyLogModel::STATUS_BUY_WARES,
                CommonPayMoneyLogModel::MONEY_TYPE_INTEGRAL,
                $waresMoney,
                $integralBefore,
                $integralEnd,
                '兑换积分商品: ' . $wares['wares_name']
            );
            
            // 5.4 创建订单
            $order = CommonWaresOrderModel::createOrder(
                $userId,
                $wares,
                $address,
                $phone
            );
            
            Db::commit();
            Cache::delete($lockKey);
            
            return Show(SUCCESS, $order, 10085);
            
        } catch (\Throwable $e) {
            Db::rollback();
            Cache::delete($lockKey);
            return Show(ERROR, [], 10086);
        }
    }
}
