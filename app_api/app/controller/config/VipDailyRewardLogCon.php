<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonVipDailyRewardLogModel;

/**
 * VIP每日工资控制器
 */
class VipDailyRewardLogCon extends BaseCon
{
    /**
     * VIP每日工资列表
     */
    public function GetVipDailyRewardLogList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = ['user_id' => $userId];
        
        $list = CommonVipDailyRewardLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
