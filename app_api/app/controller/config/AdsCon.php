<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonAdsModel;

/**
 * Banner/广告控制器
 */
class AdsCon extends BaseCon
{
    /**
     * Banner列表
     */
    public function GetBannerList()
    {
        $map = [
            'status' => CommonAdsModel::STATUS_SHOW,
        ];
        
        $list = CommonAdsModel::PageData($map, 'sort asc');
        
        return Show(SUCCESS, $list);
    }
}
