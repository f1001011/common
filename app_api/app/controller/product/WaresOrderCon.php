<?php
declare(strict_types=1);

namespace app\controller\product;

use app\controller\BaseCon;
use app\model\CommonWaresOrderModel;

/**
 * 积分商品订单控制器
 */
class WaresOrderCon extends BaseCon
{
    /**
     * 积分商品订单列表
     */
    public function GetWaresOrderList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 10;
        $uid = $this->request->UserID;
        
        $map = ['uid' => $uid];
        
        $list = CommonWaresOrderModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
