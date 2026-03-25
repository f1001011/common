<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonTaskConfigModel;
use app\model\CommonUserModel;

/**
 * 任务配置控制器
 */
class TaskConfigCon extends BaseCon
{
    /**
     * 任务配置列表
     */
    public function GetTaskConfigList()
    {
        $userId = $this->request->UserID;
        
        $map = ['status' => CommonTaskConfigModel::STATUS_ENABLE];
        
        $list = CommonTaskConfigModel::PageData($map, 'sort asc, id asc');
        
        if ($userId && $list) {
            $user = CommonUserModel::PageDataOne(['id' => $userId], 'agent_id_1,agent_id_2,agent_id_3,level_vip');
            
            $inviteCount1 = 0;
            $inviteCount2 = 0;
            $inviteCount3 = 0;
            
            if ($user) {
                if ($user['agent_id_1']) {
                    $inviteCount1 = CommonUserModel::where('agent_id', $user['agent_id_1'])
                        ->where('level_vip', '>=', 1)
                        ->count();
                }
                if ($user['agent_id_2']) {
                    $inviteCount2 = CommonUserModel::where('agent_id', $user['agent_id_2'])
                        ->where('level_vip', '>=', 1)
                        ->count();
                }
                if ($user['agent_id_3']) {
                    $inviteCount3 = CommonUserModel::where('agent_id', $user['agent_id_3'])
                        ->where('level_vip', '>=', 1)
                        ->count();
                }
            }
            
            foreach ($list as &$item) {
                $item['invite_count_lv'] = $inviteCount1+$inviteCount2+$inviteCount3;
                $item['invite_count_lv1'] = $inviteCount1;
                $item['invite_count_lv2'] = $inviteCount2;
                $item['invite_count_lv3'] = $inviteCount3;
            }
        }
        
        return Show(SUCCESS, $list);
    }
}
