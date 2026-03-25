<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonPayCouponModel;

/**
 * 优惠券控制器
 */
class PayCouponCon extends BaseCon
{
    /**
     * 优惠券列表
     */
    public function GetCouponList()
    {
        $postField = 'limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $limit = $post['limit'] ?? 10;
        $uid = $this->request->UserID;
        
        $map = [
            'uid' => $uid,
            'status' => CommonPayCouponModel::STATUS_UNUSED,
            'exp_time' => ['>=', date('Y-m-d H:i:s')],
        ];
        
        $list = CommonPayCouponModel::PageData($map, 'id desc', (int)$limit);
        
        return Show(SUCCESS, $list);
    }
}
