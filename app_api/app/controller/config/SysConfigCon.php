<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonSysConfigModel;

/**
 * 系统配置控制器
 */
class SysConfigCon extends BaseCon
{
    /**
     * 系统配置列表
     */
    public function GetConfigList()
    {
        $postField = 'name';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $name = $post['name'] ?? '';
        
        $map = [];
        if ($name) {
            $map['name'] = $name;
        }
        
        $list = CommonSysConfigModel::PageData($map);
        
        return Show(SUCCESS, $list);
    }
}
