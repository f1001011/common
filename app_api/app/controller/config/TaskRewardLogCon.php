<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonTaskRewardLogModel;

/**
 * 任务奖励记录控制器
 */
class TaskRewardLogCon extends BaseCon
{
    /**
     * 任务奖励记录列表
     */
    public function GetTaskRewardLogList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = ['user_id' => $userId];
        
        $list = CommonTaskRewardLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
