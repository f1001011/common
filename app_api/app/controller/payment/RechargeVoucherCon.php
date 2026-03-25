<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonRechargeVoucherModel;
use app\model\CommonUserModel;

/**
 * 充值凭证控制器
 */
class RechargeVoucherCon extends BaseCon
{
    /**
     * 充值凭证列表
     */
    public function GetVoucherList()
    {
        $userId = $this->request->UserID;
        
        $map = [
            'user_id' => $userId,
            'status' => CommonRechargeVoucherModel::STATUS_PASS,
        ];
        
        $list = CommonRechargeVoucherModel::PageData($map, 'id desc');
        
        if ($list) {
            foreach ($list as &$item) {
                $userInfo = CommonUserModel::PageDataOne(['id' => $item['user_id']], 'nickname,user_name');
                $item['nickname'] = $userInfo['nickname'] ?? $userInfo['user_name'] ?? '';
            }
        }
        
        return Show(SUCCESS, $list);
    }
}
