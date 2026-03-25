<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonPayRechargeModel;

/**
 * 充值控制器
 */
class PayRechargeCon extends BaseCon
{
    /**
     * 充值记录
     */
    public function GetRechargeList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $uid = $this->request->UserID;
        
        $map = ['uid' => $uid];
        
        $list = CommonPayRechargeModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
