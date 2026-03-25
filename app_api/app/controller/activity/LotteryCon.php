<?php
declare(strict_types=1);

namespace app\controller\activity;

use app\controller\BaseCon;
use app\model\CommonLotteryChanceModel;
use app\model\CommonLotteryLogModel;
use app\model\CommonLotteryPrizeModel;
use app\model\CommonUserModel;
use app\model\CommonPayMoneyLogModel;
use think\facade\Db;
use think\facade\Cache;

/**
 * 抽奖/转盘控制器
 */
class LotteryCon extends BaseCon
{
    /**
     * 获取抽奖次数
     */
    public function GetLotteryChance()
    {
        $userId = $this->request->UserID;
        
        $map = [
            'user_id' => $userId,
            'rest_chance' => ['>', 0],
            'expire_time' => ['>=', date('Y-m-d H:i:s')],
        ];
        
        $list = CommonLotteryChanceModel::PageData($map, 'expire_time asc');
        
        return Show(SUCCESS, $list);
    }
    
    /**
     * 抽奖历史
     */
    public function GetLotteryLog()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        $userId = $this->request->UserID;
        
        $map = ['user_id' => $userId];
        
        $list = CommonLotteryLogModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
    
    /**
     * 奖品列表
     */
    public function GetPrizeList()
    {
        $map = ['status' => 1];
        
        $list = CommonLotteryPrizeModel::PageData($map);
        
        return Show(SUCCESS, $list);
    }
    
    /**
     * 抽奖
     */
    public function DoLottery()
    {
        $userId = $this->request->UserID;
        
        // 0. 加锁防止并发重复抽奖
        $lockKey = 'lottery_lock_' . $userId;
        if (Cache::get($lockKey)) {
            return Show(ERROR, [], 10016);
        }
        Cache::set($lockKey, 1, 5); // 5秒内不能重复请求
        
        // 1. 检查用户是否有抽奖资格
        $chanceInfo = CommonLotteryChanceModel::PageDataOne([
            'user_id' => $userId,
            'rest_chance' => ['>', 0],
            'expire_time' => ['>=', date('Y-m-d H:i:s')],
        ]);
        
        if (!$chanceInfo) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10070);
        }
        
        // 2. 获取抽奖奖品（只获取金额<=10000的现金奖励，排除实物）
        $prizeList = CommonLotteryPrizeModel::PageData([
            'status' => CommonLotteryPrizeModel::STATUS_ENABLE,
            'type' => CommonLotteryPrizeModel::TYPE_CASH,
            'amount' => ['<=', 10000],
        ]);
        
        if (!$prizeList) {
            Cache::delete($lockKey);
            return Show(ERROR, [], 10072);
        }
        
        // 3. 根据概率计算中奖
        $prize = $this->calcPrize($prizeList);
        
        // 4. 使用事务保存结果
        Db::startTrans();
        try {
            // 4.1 减少抽奖次数
            CommonLotteryChanceModel::decChance($userId);
            
            // 4.2 获取用户当前余额
            $user = CommonUserModel::PageDataOne(['id' => $userId]);
            $moneyBefore = $user['money_balance'] ?? 0;
            
            // 4.3 增加用户余额
            CommonUserModel::incMoney($userId, $prize['amount']);
            $moneyEnd = $moneyBefore + $prize['amount'];
            
            // 4.4 写入资金记录
            CommonPayMoneyLogModel::recordMoneyLog(
                $userId,
                CommonPayMoneyLogModel::TYPE_INCOME,
                CommonPayMoneyLogModel::STATUS_LOTTERY_REWARD,
                CommonPayMoneyLogModel::MONEY_TYPE_BALANCE,
                $prize['amount'],
                $moneyBefore,
                $moneyEnd,
                '抽奖奖励'
            );
            
            // 4.5 写入抽奖记录
            $lotteryLog = CommonLotteryLogModel::recordPrize(
                $userId,
                $prize['id'],
                $prize['name'],
                $prize['type'],
                $prize['amount']
            );
            
            Db::commit();
            Cache::delete($lockKey);
            
            return Show(SUCCESS, $lotteryLog, 10071);
            
        } catch (\Throwable $e) {
            Db::rollback();
            Cache::delete($lockKey);
            return Show(ERROR, [], 10072);
        }
    }
    
    /**
     * 根据概率计算中奖奖品
     */
    private function calcPrize($prizeList)
    {
        $totalProbability = 0;
        foreach ($prizeList as $item) {
            $totalProbability += (float)$item['probability'];
        }
        
        $random = mt_rand(1, (int)($totalProbability * 100)) / 100;
        
        $current = 0;
        foreach ($prizeList as $item) {
            $current += (float)$item['probability'];
            if ($random <= $current) {
                return $item;
            }
        }
        
        return $prizeList[0];
    }
}
