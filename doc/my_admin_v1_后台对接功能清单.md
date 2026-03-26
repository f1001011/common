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
- 财务报表
- 提现凭证展示
- 优惠券列表
- 充值凭证列表
- 提现凭证详情
- 提现凭证新增
- 提现凭证修改
- 提现凭证删除
- 提现凭证评论列表
- 提现凭证评论新增
- 提现凭证评论修改
- 提现凭证评论删除

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

### 9. 内容管理

- 邮件列表
- 邮件新增
- 邮件修改
- 邮件发送
- 邮件删除
- 通知列表
- 通知新增
- 通知修改
- 通知删除

### 10. 统计记录页

- 签到记录列表
- 签到统计卡片
- 月薪记录列表
- 月薪统计卡片
- 返佣记录列表
- 返佣统计卡片

## 三、已同步修改的菜单页面

- VIP 等级管理
- 周任务管理
- 奖池管理
- 转盘管理
- 转盘使用数据
- 通知列表
- 邮件列表
- 签到记录
- 月薪记录
- 返佣记录
- 优惠券列表
- 充值凭证列表
- 财务报表

以上菜单已从占位页切换到真实页面。

## 四、当前新增/修改的主要后台文件

- `admin_api/app/controller/vip/VipCon.php`
- `admin_api/app/controller/task/TaskCon.php`
- `admin_api/app/controller/activity/ActivityCon.php`
- `admin_api/app/controller/content/ContentCon.php`
- `admin_api/app/controller/report/RecordCon.php`
- `admin_api/app/controller/payment/FinanceRecordCon.php`
- `admin_api/app/controller/payment/WithdrawShowcaseCon.php`
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
- `my_admin_v1/src/views/content/email/index.vue`
- `my_admin_v1/src/views/content/notification/index.vue`
- `my_admin_v1/src/views/activity/signRecord/index.vue`
- `my_admin_v1/src/views/activity/monthlySalary/index.vue`
- `my_admin_v1/src/views/activity/commission/index.vue`
- `my_admin_v1/src/views/finance/coupon/index.vue`
- `my_admin_v1/src/views/finance/rechargeVoucher/index.vue`
- `my_admin_v1/src/views/finance/withdrawShowcase/index.vue`
- `my_admin_v1/src/views/finance/report/index.vue`
- `my_admin_v1/src/api/modules/vip.ts`
- `my_admin_v1/src/api/modules/task.ts`
- `my_admin_v1/src/api/modules/activity.ts`
- `my_admin_v1/src/api/modules/content.ts`
- `my_admin_v1/src/api/modules/report.ts`
- `my_admin_v1/src/api/interface/index.ts`
- `my_admin_v1/src/assets/json/authMenuList.json`

## 六、下一步可继续对接的方向

- 剩余占位菜单：
  - 用户标签
  - 渠道链接
  - 风控中心
- 这 3 个页面当前 `admin_api` 还没有对应后台接口，不能硬接真实业务
- 下一步可做：
  - 继续补这 4 个模块的后台接口
  - 或先把页面外观做出来，后续再接真实接口
  - 或继续细化现有页面字段、搜索项、上传组件
