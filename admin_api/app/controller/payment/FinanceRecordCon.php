<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use think\facade\Db;

class FinanceRecordCon extends BaseCon
{
    public function GetCouponList()
    {
        $postField = 'user_id,status,type,start_time,end_time,page,limit';
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
        $prefix = (string)config('database.connections.mysql.prefix');

        $query = Db::name('common_pay_coupon')
            ->alias('coupon')
            ->leftJoin($prefix . 'common_user u', 'u.id = coupon.uid')
            ->field('coupon.id,coupon.money,coupon.type,coupon.uid as user_id,coupon.create_time,coupon.use_time,coupon.status,coupon.exp_time,u.user_name,u.nickname,u.phone');

        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $query->where('coupon.uid', $userId);
        }

        $status = $post['status'] ?? '';
        if ($status !== '' && $status !== null && is_numeric($status)) {
            $query->where('coupon.status', (int)$status);
        }

        $type = $post['type'] ?? '';
        if ($type !== '' && $type !== null && is_numeric($type)) {
            $query->where('coupon.type', (int)$type);
        }

        if (!empty($startTime)) {
            $query->where('coupon.create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('coupon.create_time', '<=', $endTime);
        }

        $list = $query
            ->order('coupon.id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        return Show(SUCCESS, $list);
    }

    public function GetRechargeVoucherList()
    {
        $postField = 'user_id,recharge_id,status,start_time,end_time,page,limit';
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
        $prefix = (string)config('database.connections.mysql.prefix');

        $query = Db::name('common_recharge_voucher')
            ->alias('voucher')
            ->leftJoin($prefix . 'common_user u', 'u.id = voucher.user_id')
            ->field('voucher.id,voucher.user_id,voucher.recharge_id,voucher.voucher_image,voucher.amount,voucher.status,voucher.create_time,u.user_name,u.nickname,u.phone');

        $userId = (int)($post['user_id'] ?? 0);
        if ($userId > 0) {
            $query->where('voucher.user_id', $userId);
        }

        $rechargeId = (int)($post['recharge_id'] ?? 0);
        if ($rechargeId > 0) {
            $query->where('voucher.recharge_id', $rechargeId);
        }

        $status = $post['status'] ?? '';
        if ($status !== '' && $status !== null && is_numeric($status)) {
            $query->where('voucher.status', (int)$status);
        }

        if (!empty($startTime)) {
            $query->where('voucher.create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('voucher.create_time', '<=', $endTime);
        }

        $list = $query
            ->order('voucher.id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        return Show(SUCCESS, $list);
    }
}
