<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonPayCashModel;

/**
 * 提现控制器
 */
class PayCashCon extends BaseCon
{
    /**
     * 提现记录
     */
    public function GetCashList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $uId = $this->request->UserID;
        
        $map = ['u_id' => $uId];
        
        $list = CommonPayCashModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
