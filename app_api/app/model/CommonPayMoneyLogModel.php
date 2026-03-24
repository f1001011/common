<?php

namespace app\model;

class CommonPayMoneyLogModel extends BaseModel
{
    protected $name = 'common_pay_money_log';

    const TYPE_INCOME = 1; // 收入
    const TYPE_EXPEND = 2; // 支出

    const MONEY_TYPE_BALANCE = 1; // 余额账户
    const MONEY_TYPE_INTEGRAL = 2; // 积分账户
}
