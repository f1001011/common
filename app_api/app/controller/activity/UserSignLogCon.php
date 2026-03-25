<?php
declare(strict_types=1);

namespace app\controller\activity;

use app\controller\BaseCon;
use app\model\CommonUserSignLogModel;

/**
 * 签到记录控制器
 */
class UserSignLogCon extends BaseCon
{
    /**
     * 签到记录列表
     */
    public function GetSignLogList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $uid = $this->request->UserID;
        
        $map = ['uid' => $uid];
        
        $list = CommonUserSignLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
