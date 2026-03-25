<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonVipModel;

/**
 * VIP控制器
 */
class VipCon extends BaseCon
{
    /**
     * VIP等级列表
     */
    public function GetVipList()
    {
        $list = CommonVipModel::PageData([], 'vip asc, id asc');
        
        return Show(SUCCESS, $list);
    }
}
