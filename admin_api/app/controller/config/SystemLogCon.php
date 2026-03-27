<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonAdminLogModel;

class SystemLogCon extends BaseCon
{
    /**
     * 系统日志列表
     *
     * @return mixed
     */
    public function GetAdminLogList()
    {
        $postField = 'admin_id,name,func,ip,start_time,end_time,page,limit';
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

        $query = CommonAdminLogModel::where([]);

        $adminId = (int)($post['admin_id'] ?? 0);
        if ($adminId > 0) {
            $query->where('admin_id', $adminId);
        }

        $name = trim((string)($post['name'] ?? ''));
        if ($name !== '') {
            $query->whereLike('name', '%' . $name . '%');
        }

        $func = trim((string)($post['func'] ?? ''));
        if ($func !== '') {
            $query->whereLike('func', '%' . $func . '%');
        }

        $ip = trim((string)($post['ip'] ?? ''));
        if ($ip !== '') {
            $query->whereLike('ip', '%' . $ip . '%');
        }

        if (!empty($startTime)) {
            $query->where('create_time', '>=', $startTime);
        }

        if (!empty($endTime)) {
            $query->where('create_time', '<=', $endTime);
        }

        $list = $query
            ->field('id,admin_id,name,ip,func,rmark,create_time')
            ->order('create_time desc,id desc')
            ->paginate([
                'list_rows' => $limit,
                'page' => $page,
                'query' => request()->param(),
            ]);

        return Show(SUCCESS, $list);
    }
}
