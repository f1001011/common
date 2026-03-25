<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use app\middleware\AuthMiddleware;
use think\facade\Route;
// 需要token的接口
Route::group('api', function(){
    // 用户列表
    Route::post('user/list', \app\controller\user\UserCon::class . '@GetUserList');

    // 用户基础信息修改
    Route::post('user/update/base', \app\controller\user\UserCon::class . '@UpdateBaseInfo');

    // 用户冻结状态修改
    Route::post('user/update/status', \app\controller\user\UserCon::class . '@UpdateStatus');

    // 用户在线状态修改
    Route::post('user/update/state', \app\controller\user\UserCon::class . '@UpdateState');

    // 用户余额修改
    Route::post('user/update/balance', \app\controller\user\UserCon::class . '@UpdateBalance');

    // 用户积分修改
    Route::post('user/update/integral', \app\controller\user\UserCon::class . '@UpdateIntegral');

    // 资金流水记录
    Route::post('pay/money/log/list', \app\controller\payment\PayMoneyLogCon::class . '@GetMoneyLogList');

    // 充值记录
    Route::post('pay/recharge/list', \app\controller\payment\PayRechargeCon::class . '@GetRechargeList');

    // 提现记录
    Route::post('pay/cash/list', \app\controller\payment\PayCashCon::class . '@GetCashList');

    // 商品订单记录
    Route::post('goods/order/list', \app\controller\product\GoodsOrderCon::class . '@GetOrderList');

    // 收益领取记录
    Route::post('income/claim/log/list', \app\controller\product\IncomeClaimLogCon::class . '@GetClaimLogList');

    // 积分商品订单记录
    Route::post('wares/order/list', \app\controller\product\WaresOrderCon::class . '@GetWaresOrderList');

    // 商品列表
    Route::post('goods/list', \app\controller\product\GoodsCon::class . '@GetGoodsList');

    // 商品新增
    Route::post('goods/add', \app\controller\product\GoodsCon::class . '@AddGoods');

    // 商品修改
    Route::post('goods/update', \app\controller\product\GoodsCon::class . '@UpdateGoods');

    // 商品删除
    Route::post('goods/delete', \app\controller\product\GoodsCon::class . '@DeleteGoods');

    // 兑换商品列表
    Route::post('wares/list', \app\controller\product\WaresCon::class . '@GetWaresList');

    // 兑换商品新增
    Route::post('wares/add', \app\controller\product\WaresCon::class . '@AddWares');

    // 兑换商品修改
    Route::post('wares/update', \app\controller\product\WaresCon::class . '@UpdateWares');

    // 兑换商品删除
    Route::post('wares/delete', \app\controller\product\WaresCon::class . '@DeleteWares');

})->middleware([AuthMiddleware::class]);

Route::group('api', function(){

    // 管理员登录
    Route::post('login', \app\controller\LoginCon::class . '@Login');

});
