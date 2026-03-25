<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonPayMoneyLogModel;

/**
 * 后台资金流水控制器
 * 提供资金流水列表查询，支持按用户、时间范围、收支类型、钱包类型、状态类型筛选。
 */
class PayMoneyLogCon extends BaseCon
{
    /**
     * 资金流水列表接口
     * 默认按ID倒序，默认每页20条。
     *
     * @return mixed
     */
    public function GetMoneyLogList()
    {
        $postField = 'user_id,start_time,end_time,type,money_type,status,page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        $startTime = $this->normalizeSearchTime($post['start_time'] ?? null);
        if (($post['start_time'] ?? '') !== '' && $startTime === false) {
            return Show(ERROR, [], 10025);
        }

        $endTime = $this->normalizeSearchTime($post['end_time'] ?? null, true);
        if (($post['end_time'] ?? '') !== '' && $endTime === false) {
            return Show(ERROR, [], 10025);
        }

        [$page, $limit] = $this->getPageLimit($post);

        $map = [];
        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $map['uid'] = $userId;
        }

        $this->appendTimeRange($map, 'create_time', $startTime ?: null, $endTime ?: null);

        $type = (int)($post['type'] ?? 0);
        if (in_array($type, [CommonPayMoneyLogModel::TYPE_INCOME, CommonPayMoneyLogModel::TYPE_EXPEND], true)) {
            $map['type'] = $type;
        }

        $moneyType = (int)($post['money_type'] ?? 0);
        if (in_array($moneyType, [CommonPayMoneyLogModel::MONEY_TYPE_BALANCE, CommonPayMoneyLogModel::MONEY_TYPE_INTEGRAL], true)) {
            $map['money_type'] = $moneyType;
        }

        $status = (int)($post['status'] ?? 0);
        if ($status > 0) {
            $map['status'] = $status;
        }

        $list = CommonPayMoneyLogModel::PageList($map, '*', $page, $limit, 'id desc');
        return Show(SUCCESS, $list);
    }
}
