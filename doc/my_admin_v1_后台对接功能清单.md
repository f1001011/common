# my_admin_v1 后台对接功能清单

## 一、基础修复

- 登录接口已切到真实后台接口
- 后台请求基础地址已调整为当前使用地址
- 菜单动态路由已改为真实业务页面，不再走占位页
- 登录页演示消息已屏蔽显示
- Sass 控制台弃用提示已处理
- 前端请求头与跨域触发方式已做兼容调整

## 二、已完成的业务模块

### 1. 用户管理

- 用户列表
- 用户基础信息修改
- 用户状态修改
- 用户在线状态修改
- 用户余额修改
- 用户积分修改
- 列表中展示 VIP 等级
- 列表中展示密码简析字段
- 列表中展示 1/2/3 级代理信息
- 修正“进入页面即调用状态修改接口”的问题，改为点击后再触发

### 2. 财务管理

- 资金流水记录
- 充值记录
- 充值订单修改
- 提现记录
- 提现订单修改
- 提现凭证展示

### 3. 支付管理

- 支付渠道列表
- 支付渠道新增
- 支付渠道修改
- 支付渠道删除

### 4. 商品管理

- 产品列表
- 产品新增
- 产品修改
- 产品删除
- 商品订单记录
- 收益领取记录

### 5. 积分/兑换商品管理

- 兑换商品列表
- 兑换商品新增
- 兑换商品修改
- 兑换商品删除
- 积分商品订单记录

### 6. VIP 等级管理

#### 后台接口

- VIP 配置列表
- VIP 配置新增
- VIP 配置修改
- VIP 配置删除
- VIP 变更日志列表
- VIP 每日奖励记录列表
- 代理等级配置列表
- 代理等级配置新增
- 代理等级配置修改
- 代理等级配置删除

#### 前端页面

- VIP 配置页
- 代理等级配置页
- VIP 变更日志页
- VIP 每日奖励记录页

### 7. 周任务管理

#### 后台接口

- 周任务配置列表
- 周任务配置新增
- 周任务配置修改
- 周任务配置删除
- 周任务进度列表
- 周任务奖励记录列表

#### 前端页面

- 周任务配置页
- 任务进度页
- 奖励记录页

### 8. 活动管理

#### 奖池管理

- 奖池配置列表
- 奖池配置新增
- 奖池配置修改
- 奖池开奖记录列表

#### 转盘管理

- 转盘奖品列表
- 转盘奖品新增
- 转盘奖品修改
- 转盘奖品删除

#### 转盘使用数据

- 转盘开奖记录列表
- 转盘次数数据列表

## 三、已同步修改的菜单页面

- VIP 等级管理
- 周任务管理
- 奖池管理
- 转盘管理
- 转盘使用数据

以上菜单已从占位页切换到真实页面。

## 四、当前新增/修改的主要后台文件

- `admin_api/app/controller/vip/VipCon.php`
- `admin_api/app/controller/task/TaskCon.php`
- `admin_api/app/controller/activity/ActivityCon.php`
- `admin_api/app/validate/VipValidate.php`
- `admin_api/app/validate/TaskValidate.php`
- `admin_api/app/validate/ActivityValidate.php`
- `admin_api/route/app.php`

## 五、当前新增/修改的主要前端文件

- `my_admin_v1/src/views/vip/level/index.vue`
- `my_admin_v1/src/views/task/weekly/index.vue`
- `my_admin_v1/src/views/activity/prizePool/index.vue`
- `my_admin_v1/src/views/activity/lottery/index.vue`
- `my_admin_v1/src/views/activity/lotteryLog/index.vue`
- `my_admin_v1/src/api/modules/vip.ts`
- `my_admin_v1/src/api/modules/task.ts`
- `my_admin_v1/src/api/modules/activity.ts`
- `my_admin_v1/src/api/interface/index.ts`
- `my_admin_v1/src/assets/json/authMenuList.json`

## 六、下一步可继续对接的方向

- 活动管理字段细化
- 各列表页搜索项继续补全
- 表单校验提示细化
- 图片上传字段改成上传组件
- 统计类首页数据接口对接
- 其它剩余后台业务页继续补齐

邮件列表 邮件列表需要展示，需要能发送，修改，删除，
通知列表  需要展示，需要能发送，修改，删除，
签到记录  需要展示 ，给出一个卡片形式，选择 当日，昨日，7日，本周，本月 这种， 默认显示当日的，里面需要内容是 ，每日签到人数，每日赠送金额，每日奖品的列表统计(就几个，直接展示就行)
月薪记录： 需要展示 给出一个卡片形式，选择 当日，昨日，7日，本周，本月 这种， 默认显示当日的，里面需要内容是 ，每日签到人数，每日赠送金额，每日奖品的列表统计(就几个，直接展示就行)
优惠券列表：需要展示
充值凭证列表： 需要展示
返佣记录： 需要展示 给出一个卡片形式，选择 当日，昨日，7日，本周，本月 这种， 默认显示当日的，里面需要内容是 ，每日签到人数，每日赠送金额，每日奖品的列表统计(就几个，直接展示就行)
展示详情 / 评论列表：需要展示,删除，修改，添加
{"appid": "MD01", "api_url": "https://3nnt3311.com", "currency": "mxn", "game_url": "https://3nnt3311.com", "language": "es", "token_key": "P4kR7mL2Q9","callback_password": "P4kR7mL2Q9","callback_username": "MNDOMXN1", "report_url": "https://3nnt3311.com", "secret_key": "7676a4aa218ba38aff7dce7d5c84e37e047d8a021f29269f177ed1d845658e67", "token_username": "MNDOMXN1"}
{"appid": "MD01", "api_url": "https://3nnt3311.com", "currency": "mxn", "game_url": "https://3nnt3311.com", "language": "es", "token_key": "P4kR7mL2Q9", "report_url": "https://3nnt3311.com", "secret_key": "7676a4aa218ba38aff7dce7d5c84e37e047d8a021f29269f177ed1d845658e67", "token_username": "MNDOMXN1"}