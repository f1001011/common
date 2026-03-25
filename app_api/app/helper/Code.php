<?php
const SUCCESS = 200;
const ERROR = 400;
const ERROR_TOKEN = 402;

// 手机号正则（可配置）：9位数字且1开头
const PHONE_REGEX = '/^1\d{8}$/';

// 用户编号偏移量：user_no = id + USER_NO_OFFSET
const USER_NO_OFFSET = 1000;

// 领取收益相关
const CLAIM_INCOME_SUCCESS = 10092; // 领取成功
const CLAIM_INCOME_NO_PENDING = 10091; // 没有待领取的收益
const CLAIM_INCOME_FAILED = 10093; // 领取失败，请稍后重试