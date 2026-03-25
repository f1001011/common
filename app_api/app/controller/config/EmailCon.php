<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonEmailModel;

/**
 * 邮件控制器
 */
class EmailCon extends BaseCon
{
    /**
     * 邮件列表
     */
    public function GetEmailList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = [
            'is_send' => CommonEmailModel::IS_SEND_YES,
            'user_id' => $userId,
        ];
        
        $list = CommonEmailModel::PageList($map, '*', (int)$page, (int)$limit, 'is_read asc, id desc');
        
        return Show(SUCCESS, $list);
    }
}
