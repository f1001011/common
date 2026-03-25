<?php
declare(strict_types=1);

namespace app\controller\product;

use app\controller\BaseCon;
use app\model\CommonGoodsOrderModel;
use app\model\CommonGoodsModel;
use app\model\CommonIncomeClaimLogModel;

/**
 * 商品订单控制器
 */
class GoodsOrderCon extends BaseCon
{
    /**
     * 订单列表（含待领取数量）
     */
    public function GetOrderList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = [
            'user_id' => $userId,
            'status' => CommonGoodsOrderModel::STATUS_NORMAL,
        ];
        
        $list = CommonGoodsOrderModel::PageList($map, '*', (int)$page, (int)$limit, 'status asc, id desc');
        
        if ($list) {
            foreach ($list as &$item) {
                // 商品信息
                $goodsInfo = CommonGoodsModel::PageDataOne(['id' => $item['goods_id']], 'id,goods_name,head_img,goods_money,period,revenue_lv,day_red');
                $item['goods_info'] = $goodsInfo ?: (object)[];
                
                // 待领取数量（未过期、待领取）
                $pendingCount = CommonIncomeClaimLogModel::getPendingCount($item['id']);
                $item['pending_claim_count'] = $pendingCount;
            }
        }
        
        return Show(SUCCESS, $list);
    }
}
