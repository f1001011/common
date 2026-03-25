<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonVipModel;

/**
 * VIP控制器
 * 负责处理VIP等级配置相关的业务逻辑
 * 提供VIP等级列表查询，用于用户查看各VIP等级权益和升级要求
 */
class VipCon extends BaseCon
{
    /**
     * VIP等级列表接口
     * 获取所有VIP等级配置信息，按VIP等级正序排列
     * 用于用户中心展示VIP等级体系，了解各等级权益和升级所需条件
     * 
     * @return mixed 返回VIP等级列表数据，包含等级、所需经验、每日奖励等信息
     */
    public function GetVipList()
    {
        // 调用模型的不分页查询方法，按VIP等级正序、ID正序排列
        $list = CommonVipModel::PageData([], 'vip asc, id asc');
        
        // 返回成功数据
        return Show(SUCCESS, $list);
    }
}
