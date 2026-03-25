<?php
declare(strict_types=1);

namespace app\controller\logger;

use app\controller\BaseCon;
use app\model\MoneyFanyongLogModel;

/**
 * 返佣记录控制器
 */
class MoneyFanyongLogCon extends BaseCon
{
    /**
     * 返佣记录列表
     */
    public function GetFanyongLogList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = ['user_id' => $userId];
        
        $list = MoneyFanyongLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
