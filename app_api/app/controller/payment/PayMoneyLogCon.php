<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonPayMoneyLogModel;

/**
 * 资金流水控制器
 */
class PayMoneyLogCon extends BaseCon
{
    /**
     * 资金流水列表
     */
    public function GetMoneyLogList()
    {
        $postField = 'money_type,page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $moneyType = $post['money_type'] ?? 0;
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $uid = $this->request->UserID;
        
        $map = ['uid' => $uid];
        if ($moneyType) {
            $map['money_type'] = $moneyType;
        }
        
        $list = CommonPayMoneyLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
