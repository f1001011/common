<?php
declare(strict_types=1);

namespace app\controller\report;

use app\controller\BaseCon;
use think\facade\Db;

class RecordCon extends BaseCon
{
    public function GetSignLogList()
    {
        $postField = 'user_id,start_time,end_time,page,limit';
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
        $query = $this->buildSignLogQuery($post, $startTime, $endTime);

        $list = $query
            ->order('log.id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        return Show(SUCCESS, $list);
    }

    public function GetSignStats()
    {
        $postField = 'user_id,start_time,end_time';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        $startTime = $this->normalizeSearchTime($post['start_time'] ?? null);
        if (($post['start_time'] ?? '') !== '' && $startTime === false) {
            return Show(ERROR, [], 10025);
        }

        $endTime = $this->normalizeSearchTime($post['end_time'] ?? null, true);
        if (($post['end_time'] ?? '') !== '' && $endTime === false) {
            return Show(ERROR, [], 10025);
        }

        $summary = $this->buildSignLogQuery($post, $startTime, $endTime, false)
            ->fieldRaw('COUNT(*) as total_count, COUNT(DISTINCT log.uid) as user_count, COALESCE(SUM(log.money), 0) as reward_amount')
            ->find();

        $breakdown = $this->buildSignLogQuery($post, $startTime, $endTime, false)
            ->fieldRaw('log.even_sign as even_sign, COUNT(*) as total_count, COALESCE(SUM(log.money), 0) as total_amount')
            ->group('log.even_sign')
            ->order('log.even_sign asc')
            ->limit(10)
            ->select()
            ->toArray();

        return Show(SUCCESS, [
            'sign_user_count' => (int)($summary['user_count'] ?? 0),
            'gift_amount' => (float)($summary['reward_amount'] ?? 0),
            'record_count' => (int)($summary['total_count'] ?? 0),
            'reward_breakdown' => $breakdown,
        ]);
    }

    public function GetMonthlySalaryLogList()
    {
        $postField = 'user_id,status,claim_month,start_time,end_time,page,limit';
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
        $query = $this->buildMonthlySalaryQuery($post, $startTime, $endTime);

        $list = $query
            ->order('log.id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        return Show(SUCCESS, $list);
    }

    public function GetMonthlySalaryStats()
    {
        $postField = 'user_id,status,claim_month,start_time,end_time';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        $startTime = $this->normalizeSearchTime($post['start_time'] ?? null);
        if (($post['start_time'] ?? '') !== '' && $startTime === false) {
            return Show(ERROR, [], 10025);
        }

        $endTime = $this->normalizeSearchTime($post['end_time'] ?? null, true);
        if (($post['end_time'] ?? '') !== '' && $endTime === false) {
            return Show(ERROR, [], 10025);
        }

        $summary = $this->buildMonthlySalaryQuery($post, $startTime, $endTime, false)
            ->fieldRaw('COUNT(*) as total_count, COUNT(DISTINCT log.user_id) as user_count, COALESCE(SUM(log.reward_amount), 0) as reward_amount, COALESCE(SUM(log.team_recharge_amount), 0) as team_recharge_amount')
            ->find();

        $breakdown = $this->buildMonthlySalaryQuery($post, $startTime, $endTime, false)
            ->fieldRaw('log.status as status, COUNT(*) as total_count, COALESCE(SUM(log.reward_amount), 0) as total_amount')
            ->group('log.status')
            ->order('log.status asc')
            ->select()
            ->toArray();

        return Show(SUCCESS, [
            'salary_user_count' => (int)($summary['user_count'] ?? 0),
            'gift_amount' => (float)($summary['reward_amount'] ?? 0),
            'team_recharge_amount' => (float)($summary['team_recharge_amount'] ?? 0),
            'record_count' => (int)($summary['total_count'] ?? 0),
            'reward_breakdown' => $breakdown,
        ]);
    }

    public function GetCommissionLogList()
    {
        $postField = 'user_id,money_type,is_add_to_user_account,sub_id,start_time,end_time,page,limit';
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
        $query = $this->buildCommissionQuery($post, $startTime, $endTime);

        $list = $query
            ->order('log.id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        return Show(SUCCESS, $list);
    }

    public function GetCommissionStats()
    {
        $postField = 'user_id,money_type,is_add_to_user_account,sub_id,start_time,end_time';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        $startTime = $this->normalizeSearchTime($post['start_time'] ?? null);
        if (($post['start_time'] ?? '') !== '' && $startTime === false) {
            return Show(ERROR, [], 10025);
        }

        $endTime = $this->normalizeSearchTime($post['end_time'] ?? null, true);
        if (($post['end_time'] ?? '') !== '' && $endTime === false) {
            return Show(ERROR, [], 10025);
        }

        $summary = $this->buildCommissionQuery($post, $startTime, $endTime, false)
            ->fieldRaw('COUNT(*) as total_count, COUNT(DISTINCT log.user_id) as user_count, COALESCE(SUM(log.money_amount), 0) as reward_amount')
            ->find();

        $breakdown = $this->buildCommissionQuery($post, $startTime, $endTime, false)
            ->fieldRaw('log.money_type, log.money_type_text, COUNT(*) as total_count, COALESCE(SUM(log.money_amount), 0) as total_amount')
            ->group('log.money_type, log.money_type_text')
            ->order('log.money_type asc')
            ->select()
            ->toArray();

        return Show(SUCCESS, [
            'commission_user_count' => (int)($summary['user_count'] ?? 0),
            'gift_amount' => (float)($summary['reward_amount'] ?? 0),
            'record_count' => (int)($summary['total_count'] ?? 0),
            'reward_breakdown' => $breakdown,
        ]);
    }

    protected function buildSignLogQuery(array $post, ?string $startTime, ?string $endTime, bool $withField = true)
    {
        $prefix = (string)config('database.connections.mysql.prefix');
        $query = Db::name('common_user_sign_log')
            ->alias('log')
            ->leftJoin($prefix . 'common_user u', 'u.id = log.uid');

        if ($withField) {
            $query->field('log.id,log.uid as user_id,log.money as reward_amount,log.create_time,log.even_sign,u.user_name,u.nickname,u.phone');
        }

        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $query->where('log.uid', $userId);
        }

        if (!empty($startTime)) {
            $query->where('log.create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('log.create_time', '<=', $endTime);
        }

        return $query;
    }

    protected function buildMonthlySalaryQuery(array $post, ?string $startTime, ?string $endTime, bool $withField = true)
    {
        $prefix = (string)config('database.connections.mysql.prefix');
        $query = Db::name('common_monthly_salary_log')
            ->alias('log')
            ->leftJoin($prefix . 'common_user u', 'u.id = log.user_id');

        if ($withField) {
            $query->field('log.id,log.user_id,log.team_recharge_amount,log.reward_amount,log.claim_month,log.create_time,log.status,u.user_name,u.nickname,u.phone');
        }

        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $query->where('log.user_id', $userId);
        }

        $status = $post['status'] ?? '';
        if ($status !== '' && $status !== null && is_numeric($status)) {
            $query->where('log.status', (int)$status);
        }

        $claimMonth = trim((string)($post['claim_month'] ?? ''));
        if ($claimMonth !== '') {
            $query->where('log.claim_month', $claimMonth);
        }

        if (!empty($startTime)) {
            $query->where('log.create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('log.create_time', '<=', $endTime);
        }

        return $query;
    }

    protected function buildCommissionQuery(array $post, ?string $startTime, ?string $endTime, bool $withField = true)
    {
        $prefix = (string)config('database.connections.mysql.prefix');
        $query = Db::name('money_fanyong_log')
            ->alias('log')
            ->leftJoin($prefix . 'common_user u', 'u.id = log.user_id')
            ->leftJoin($prefix . 'common_user sub', 'sub.id = log.sub_id');

        if ($withField) {
            $query->field('log.id,log.user_id,log.money_amount,log.money_type,log.money_type_text,log.is_add_to_user_account,log.remark,log.user_name,log.create_time,log.update_time,log.product_id,log.product_lev,log.sub_id,u.nickname,u.phone,sub.user_name as sub_user_name,sub.nickname as sub_nickname,sub.phone as sub_phone');
        }

        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $query->where('log.user_id', $userId);
        }

        $moneyType = $post['money_type'] ?? '';
        if ($moneyType !== '' && $moneyType !== null && is_numeric($moneyType)) {
            $query->where('log.money_type', (int)$moneyType);
        }

        $accountStatus = $post['is_add_to_user_account'] ?? '';
        if ($accountStatus !== '' && $accountStatus !== null && is_numeric($accountStatus)) {
            $query->where('log.is_add_to_user_account', (int)$accountStatus);
        }

        $subId = (int)($post['sub_id'] ?? 0);
        if ($subId > 0) {
            $query->where('log.sub_id', $subId);
        }

        if (!empty($startTime)) {
            $query->where('log.create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('log.create_time', '<=', $endTime);
        }

        return $query;
    }
}
