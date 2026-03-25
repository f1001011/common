<?php
declare(strict_types=1);

namespace app\controller\activity;

use app\controller\BaseCon;
use app\model\CommonUserSignLogModel;
use app\model\CommonUserModel;
use app\model\CommonPayMoneyLogModel;
use think\facade\Db;
use think\facade\Cache;

/**
 * 签到控制器
 * 负责处理用户签到相关的业务逻辑
 * 提供签到功能，根据连续签到天数发放奖励
 */
class UserSignCon extends BaseCon
{
    /**
     * 签到接口
     * 用户点击签到时触发，检查今日是否已签到 -> 计算连续签到天数 -> 发放奖励 -> 写入签到记录
     * 处理流程：加锁 -> 检查今天是否已签到 -> 计算奖励金额 -> 事务处理 -> 返回结果
     * 
     * @return mixed 返回签到结果，包含奖励金额、连续签到天数、明天奖励预览
     */
    public function DoSign()
    {
        // 获取当前登录用户的ID
        $userId = $this->request->UserID;

        // 0. 加锁防止并发重复签到，生成缓存锁key
        $lockKey = 'sign_lock_' . $userId;
        // 检查缓存中是否存在锁，若存在则返回操作频繁提示
        if (Cache::get($lockKey)) {
            return Show(ERROR, [], 10016);
        }
        // 设置缓存锁，有效期5秒
        Cache::set($lockKey, 1, 5);

        // 1. 检查今天是否已签到
        $todaySign = CommonUserSignLogModel::getTodaySign($userId);
        // 若今天已签到，则删除锁并返回提示信息
        if ($todaySign) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10101);
        }

        // 2. 获取用户上次签到的连续天数
        $lastEvenSign = CommonUserSignLogModel::getLastEvenSign($userId);

        // 3. 计算今天的连续签到天数
        $yesterday = date('Y-m-d', strtotime('-1 day'));
        $lastSign = CommonUserSignLogModel::where('uid', $userId)
            ->order('id', 'desc')
            ->find();

        $evenSign = 1; // 默认重新计算连续签到天数
        if ($lastSign) {
            $lastSignDate = date('Y-md', strtotime($lastSign['create_time']));
            // 如果上次签到是昨天，连续天数+1，否则重置为1
            if ($lastSignDate == $yesterday) {
                $evenSign = $lastEvenSign + 1;
            } else {
                $evenSign = 1;
            }
        }

        // 4. 计算签到奖励金额
        $rewardAmount = $this->calculateReward($evenSign);

        // 5. 使用事务保存签到结果，确保数据一致性
        Db::startTrans();
        try {
            // 获取当前时间
            $now = date('Y-m-d H:i:s');

            // 获取用户信息
            $user = CommonUserModel::PageDataOne(['id' => $userId]);
            if (!$user) {
                throw new \Exception('用户不存在');
            }

            // 根据奖励类型发放奖励
            if (SIGN_REWARD_TYPE == 1) {
                // 余额奖励
                $moneyBefore = $user['money_balance'] ?? 0;
                $result = CommonUserModel::incMoney($userId, $rewardAmount);
                if (!$result) {
                    throw new \Exception('余额增加失败');
                }
                $moneyEnd = $moneyBefore + $rewardAmount;

                // 写入资金流水记录
                CommonPayMoneyLogModel::recordMoneyLog(
                    $userId,
                    CommonPayMoneyLogModel::TYPE_INCOME,
                    CommonPayMoneyLogModel::STATUS_SIGN_REWARD,
                    CommonPayMoneyLogModel::MONEY_TYPE_BALANCE,
                    $rewardAmount,
                    $moneyBefore,
                    $moneyEnd,
                    '签到奖励 - 第' . $evenSign . '天'
                );
            } else {
                // 积分奖励
                $integralBefore = $user['money_integral'] ?? 0;
                $result = CommonUserModel::incIntegral($userId, $rewardAmount);
                if (!$result) {
                    throw new \Exception('积分增加失败');
                }
                $integralEnd = $integralBefore + $rewardAmount;

                // 写入资金流水记录
                CommonPayMoneyLogModel::recordMoneyLog(
                    $userId,
                    CommonPayMoneyLogModel::TYPE_INCOME,
                    CommonPayMoneyLogModel::STATUS_SIGN_REWARD,
                    CommonPayMoneyLogModel::MONEY_TYPE_INTEGRAL,
                    $rewardAmount,
                    $integralBefore,
                    $integralEnd,
                    '签到奖励 - 第' . $evenSign . '天'
                );
            }

            // 写入签到记录
            CommonUserSignLogModel::createSign($userId, $rewardAmount, $evenSign);

            // 提交事务，确认所有数据变更
            Db::commit();
            // 删除缓存锁，允许用户下次操作
            Cache::delete($lockKey);

            // 计算明天的奖励金额预览
            $tomorrowReward = $this->calculateReward($evenSign + 1);
            $isExtraDay = in_array($evenSign + 1, SIGN_EXTRA_DAYS);

            // 返回成功数据
            return Show(SUCCESS, [
                'reward_amount' => $rewardAmount, // 本次签到奖励金额
                'reward_type' => SIGN_REWARD_TYPE, // 奖励类型：1-余额，2-积分
                'even_sign' => $evenSign, // 连续签到天数
                'tomorrow_reward' => $tomorrowReward, // 明天签到奖励预览
                'is_extra_day' => $isExtraDay, // 明天是否是额外奖励日
            ], 10100);

        } catch (\Throwable $e) {
            // 捕获异常，回滚所有数据变更
            Db::rollback();
            // 删除缓存锁
            Cache::delete($lockKey);
            // 返回错误提示
            return Show(ERROR, [], 10102);
        }
    }

    /**
     * 计算签到奖励金额
     * 根据连续签到天数从配置中获取奖励金额
     * 
     * @param int $day 连续签到天数
     * @return float 奖励金额
     */
    private function calculateReward($day)
    {
        // 超过7天循环计算
        $day = $day > 7 ? (($day - 1) % 7) + 1 : $day;
        
        // 从配置中获取奖励金额
        $reward = SIGN_DAILY_REWARD[$day] ?? SIGN_DAILY_REWARD[1] ?? 10.00;
        
        return (float)$reward;
    }

    /**
     * 获取签到信息接口
     * 获取用户今日签到状态、连续签到天数、明日奖励预览等信息
     * 
     * @return mixed 返回签到相关信息
     */
    public function GetSignInfo()
    {
        // 获取当前登录用户的ID
        $userId = $this->request->UserID;

        // 检查今天是否已签到
        $todaySign = CommonUserSignLogModel::getTodaySign($userId);
        
        // 获取连续签到天数
        $evenSign = CommonUserSignLogModel::getLastEvenSign($userId);

        // 明日奖励预览
        $tomorrowReward = $this->calculateReward($evenSign + 1);
        $isExtraDay = in_array($evenSign + 1, SIGN_EXTRA_DAYS);

        // 返回成功数据
        return Show(SUCCESS, [
            'is_signed_today' => $todaySign ? 1 : 0, // 今日是否已签到：0-未签到，1-已签到
            'even_sign' => $evenSign, // 连续签到天数
            'tomorrow_reward' => $tomorrowReward, // 明天签到奖励预览
            'is_extra_day' => $isExtraDay, // 明天是否是额外奖励日
            'reward_type' => SIGN_REWARD_TYPE, // 奖励类型：1-余额，2-积分
            'sign_config' => SIGN_DAILY_REWARD, // 签到配置
            'extra_days' => SIGN_EXTRA_DAYS, // 额外奖励天数
        ]);
    }
}
