<?php
declare(strict_types=1);

namespace app\controller\activity;

use app\controller\BaseCon;
use app\model\CommonPrizePoolLogModel;

/**
 * 奖池记录控制器
 */
class PrizePoolLogCon extends BaseCon
{
    /**
     * 奖池获奖记录
     */
    public function GetPrizePoolLogList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 10;
        $userId = $this->request->UserID;
        
        $map = ['user_id' => $userId];
        
        $list = CommonPrizePoolLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
