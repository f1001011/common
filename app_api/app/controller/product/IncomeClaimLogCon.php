<?php
declare(strict_types=1);

namespace app\controller\product;

use app\controller\BaseCon;
use app\model\CommonIncomeClaimLogModel;
use app\model\CommonGoodsModel;
use app\model\CommonGoodsOrderModel;

/**
 * 收益领取记录控制器
 */
class IncomeClaimLogCon extends BaseCon
{
    /**
     * 待领取收益列表
     */
    public function GetPendingList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = [
            'user_id' => $userId,
            'status' => CommonIncomeClaimLogModel::STATUS_PENDING,
            'expire_time' => ['>=', date('Y-m-d H:i:s')],
        ];
        
        $list = CommonIncomeClaimLogModel::PageList($map, '*', (int)$page, (int)$limit, 'expire_time asc, id desc');
        
        if ($list) {
            foreach ($list as &$item) {
                $goodsInfo = CommonGoodsModel::PageDataOne(
                    ['id' => $item['goods_id']], 
                    'id,goods_name,head_img,goods_money,period,revenue_lv,day_red'
                );
                $orderInfo = CommonGoodsOrderModel::PageDataOne(
                    ['id' => $item['order_id']], 
                    'id,order_no,goods_name,order_money,total_red_money,already_red_money,surplus_red_money'
                );
                $item['goods_info'] = $goodsInfo ?: (object)[];
                $item['order_info'] = $orderInfo ?: (object)[];
            }
        }
        
        return Show(SUCCESS, $list);
    }
}
