<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonNotificationModel;

/**
 * 通知控制器
 */
class NotificationCon extends BaseCon
{
    /**
     * 通知列表
     */
    public function GetNotificationList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $uid = $this->request->UserID;
        
        $map = ['uid' => $uid];
        
        $list = CommonNotificationModel::PageList($map, '*', (int)$page, (int)$limit, 'is_read asc, create_time desc');
        
        return Show(SUCCESS, $list);
    }
}
