<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonVipLogModel;

/**
 * VIP日志控制器
 */
class VipLogCon extends BaseCon
{
    /**
     * VIP日志列表
     */
    public function GetVipLogList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 10;
        
        $list = CommonVipLogModel::PageList([], '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
