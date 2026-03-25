<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonUserModel;
use app\model\CommonWithdrawShowcaseModel;

/**
 * 后台提现凭证展示控制器
 * 只负责查询展示用户上传的提现凭证，不涉及审核处理。
 */
class WithdrawShowcaseCon extends BaseCon
{
    /**
     * 提现凭证列表接口
     * 支持按用户ID、提现订单ID、状态、创建时间范围筛选。
     *
     * @return mixed
     */
    public function GetShowcaseList()
    {
        $postField = 'user_id,withdraw_id,status,start_time,end_time,page,limit';
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

        $query = CommonWithdrawShowcaseModel::where([]);

        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $query->where('user_id', $userId);
        }

        $withdrawId = (int)($post['withdraw_id'] ?? 0);
        if ($withdrawId > 0) {
            $query->where('withdraw_id', $withdrawId);
        }

        $status = $post['status'] ?? '';
        if ($status !== '' && $status !== null && is_numeric($status)) {
            $query->where('status', (int)$status);
        }

        if (!empty($startTime)) {
            $query->where('create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('create_time', '<=', $endTime);
        }

        $list = $query
            ->order('id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        $result = $list->toArray();
        $items = $result['data'] ?? [];
        if (!empty($items)) {
            $userIds = array_values(array_unique(array_filter(array_column($items, 'user_id'))));
            $userMap = [];
            if (!empty($userIds)) {
                $users = CommonUserModel::whereIn('id', $userIds)
                    ->field('id,user_name,nickname,phone')
                    ->select()
                    ->toArray();

                foreach ($users as $user) {
                    $userMap[(int)$user['id']] = $user;
                }
            }

            foreach ($items as &$item) {
                $userInfo = $userMap[(int)$item['user_id']] ?? [];
                $item['user_name'] = $userInfo['user_name'] ?? '';
                $item['nickname'] = $userInfo['nickname'] ?? '';
                $item['phone'] = $userInfo['phone'] ?? '';
            }

            $result['data'] = $items;
        }

        return Show(SUCCESS, $result);
    }
}
