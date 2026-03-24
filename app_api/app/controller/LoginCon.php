<?php

namespace app\controller;

use app\model\CommonHomeTokenModel;
use app\model\CommonUserModel;
use think\exception\ValidateException;
use think\facade\Db;

class LoginCon extends BaseCon
{
    /**
     * 注册
     */
    public function Register()
    {
        $postField = 'phone,pwd,invitation_code';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        $post['invitation_code'] = isset($post['invitation_code']) ? strtoupper(trim((string)$post['invitation_code'])) : '';

        try {
            validate(\app\validate\LoginValidate::class)->scene('register')->check($post);
        } catch (ValidateException $e) {
            return Show(ERROR, [], $e->getError());
        }

        $existsUser = CommonUserModel::PageDataOne(['phone' => $post['phone']]);
        if ($existsUser) {
            return Show(ERROR, [], 10007);
        }

        $inviter = null;
        if (!empty($post['invitation_code'])) {
//            if (!preg_match('/^[A-Z0-9]{1,20}$/', $post['invitation_code'])) {
//                return Show(ERROR, [], 10060);
//            }
            $inviter = CommonUserModel::PageDataOne(['invitation_code' => $post['invitation_code']]);
            if (!$inviter) {
                return Show(ERROR, [], 10057);
            }
        }

        $now = date('Y-m-d H:i:s');
        Db::startTrans();
        try {
            $insertData = [
                'user_no' => 0,
                'user_name' => 'user_' . time() . mt_rand(100, 999),
                'create_time' => $now,
                'pwd' => ShiftEncode($post['pwd']),
                'withdraw_pwd' => ShiftEncode($post['pwd']),
                'status' => CommonUserModel::STATUS_NORMAL,
                'state' => CommonUserModel::STATE_OFFLINE,
                'is_real_name' => CommonUserModel::IS_REAL_NAME_NONE,
                'market_uid' => 0,
                'is_fictitious' => CommonUserModel::IS_FICTITIOUS_NO,
                'phone' => $post['phone'],
                'user_team' => 0,
                'ip' => (string)$this->request->ip(),
                'is_withdraw' => CommonUserModel::IS_WITHDRAW_YES,
                'invitation_code' => '',
            ];

            if ($inviter) {
                $insertData['agent_id'] = (int)$inviter['id'];
                $insertData['agent_id_1'] = (int)$inviter['id'];
                $insertData['agent_id_2'] = (int)($inviter['agent_id_1'] ?? 0);
                $insertData['agent_id_3'] = (int)($inviter['agent_id_2'] ?? 0);
            }

            $newUser = new CommonUserModel();
            $newUser->save($insertData);
            $newUserId = (int)$newUser->id;

            $userNo = $newUserId + USER_NO_OFFSET;
            // 邀请码改为基于 user_no 生成，确保与用户编号一一对应、天然唯一
            $invitationCode = $userNo;
            // 无邀请码时，创建新的团队ID（使用自己的 user_no）
            $userTeam = $userNo;
            // 有邀请码且上级存在团队号时，继承上级团队ID
            if ($inviter && !empty($inviter['user_team'])) {
                $userTeam = (int)$inviter['user_team'];
            }

            CommonUserModel::update([
                'id' => $newUserId,
                'user_no' => $userNo,
                'user_team' => $userTeam,
                'invitation_code' => $invitationCode,
            ]);

            $token = ApiToken($newUserId);
            $tokenModel = new CommonHomeTokenModel();
            $tokenModel->save([
                'token' => $token,
                'create_time' => $now,
                'user_id' => $newUserId,
            ]);

            Db::commit();

            $userInfo = CommonUserModel::PageDataOne(['id' => $newUserId]);
            if ($userInfo) {
                unset($userInfo['pwd'], $userInfo['withdraw_pwd']);
            }

            return Show(SUCCESS, ['token' => $token, 'user_info' => $userInfo], 10058);
        } catch (\Throwable $e) {
            Db::rollback();
            return Show(ERROR, [], 10061);
        }

    }

    /**
     * 登录
     */
    public function Login()
    {
        $postField = 'phone,pwd';
        $post = $this->request->only(explode(',', $postField), 'post', null);

        try {
            validate(\app\validate\LoginValidate::class)->scene('login')->check($post);
        } catch (ValidateException $e) {
            return Show(ERROR, [], $e->getError());
        }

        $userInfo = CommonUserModel::PageDataOne(['phone' => $post['phone']]);
        if (!$userInfo) {
            return Show(ERROR, [], 10000);
        }

        if ((int)$userInfo['status'] === CommonUserModel::STATUS_FREEZE) {
            return Show(ERROR, [], 10002);
        }

        if ($userInfo['pwd'] !== ShiftEncode($post['pwd'])) {
            return Show(ERROR, [], 10001);
        }

        $now = date('Y-m-d H:i:s');
        $token = ApiToken((int)$userInfo['id']);

        CommonHomeTokenModel::where(['user_id' => (int)$userInfo['id']])->delete();
        $tokenModel = new CommonHomeTokenModel();
        $tokenModel->save([
            'token' => $token,
            'create_time' => $now,
            'user_id' => (int)$userInfo['id'],
        ]);

        unset($userInfo['pwd'], $userInfo['withdraw_pwd']);
        return Show(SUCCESS, ['token' => $token, 'user_info' => $userInfo], 10059);
    }
}
