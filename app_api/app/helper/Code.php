<?php


// 手机号正则（可配置）：9位数字且1开头
const PHONE_REGEX = '/^1\d{8}$/';

// 用户编号偏移量：user_no = id + USER_NO_OFFSET
const USER_NO_OFFSET = 1000;


const SUCCESS = 200;
const ERROR = 400;
const ERROR_TOKEN = 402;

// 领取收益相关
const CLAIM_INCOME_SUCCESS = 10092; // 领取成功
const CLAIM_INCOME_NO_PENDING = 10091; // 没有待领取的收益
const CLAIM_INCOME_FAILED = 10093; // 领取失败，请稍后重试

// 签到相关
const SIGN_IN_SUCCESS = 10100; // 签到成功
const SIGN_IN_ALREADY = 10101; // 已签到
const SIGN_IN_FAILED = 10102; // 签到失败

// 签到奖励配置
// 签到奖励类型：1-余额，2-积分
const SIGN_REWARD_TYPE = 1; 

// 每日签到基础奖励金额
const SIGN_DAILY_REWARD = [
    1 => 10.00,   // 第1天
    2 => 10.00,   // 第2天
    3 => 30.00,   // 第3天（额外奖励）
    4 => 10.00,   // 第4天
    5 => 10.00,   // 第5天
    6 => 10.00,   // 第6天
    7 => 50.00,   // 第7天（额外奖励）
];

// 额外奖励天数配置
const SIGN_EXTRA_DAYS = [3, 7];

