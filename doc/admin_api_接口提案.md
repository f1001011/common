## admin_api 接口提案

更新时间：2026-03-25

### 1. 文档目标

本提案文档用于整理 `admin_api` 当前已经完成的后台接口能力，并列出下一步建议补充的管理模块，方便继续排期和查漏补缺。

当前后台接口实现统一参照 `app_api` 规范执行：

- 控制器命名：`别名 + Con`
- 模型命名：`别名 + Model`
- 控制器查询走模型
- 列表接口统一使用 `paginate()`
- 接口返回统一使用 `Show()`
- 参数统一走 `validate`
- 返回文案统一写入 `lang`
- 路由按“需要 token / 不需要 token”分组

### 2. 当前已完成模块

#### 2.1 管理员登录与认证

已完成内容：

- 管理员登录接口：`api/login`
- 后台认证中间件切换为管理员 token 校验
- 登录 token 使用 `common_admin_token`

说明：

- 后台登录密码加密方式已与前台保持一致
- 登录成功后会清理旧 token 并生成新 token

#### 2.2 用户管理

已完成接口：

- `api/user/list`
- `api/user/update/base`
- `api/user/update/status`
- `api/user/update/state`
- `api/user/update/balance`
- `api/user/update/integral`

已支持能力：

- 用户列表分页展示
- 支持按 `user_id / user_name / phone / level_vip / status / state / 时间范围` 搜索
- 支持单独修改账号、手机号、昵称、VIP 等级、密码
- 支持单独切换冻结状态
- 支持单独切换在线状态
- 支持管理员单独增加或扣除余额
- 支持管理员单独增加或扣除积分
- 余额与积分修改时同步写入资金流水日志

#### 2.3 记录类接口

已完成接口：

- `api/pay/money/log/list`
- `api/pay/recharge/list`
- `api/pay/cash/list`
- `api/goods/order/list`
- `api/income/claim/log/list`
- `api/wares/order/list`

统一能力：

- 默认 `page = 1`
- 默认 `limit = 20`
- 默认按倒序展示
- 支持按 `user_id + 时间范围` 搜索
- 特殊记录支持额外业务字段筛选

特殊说明：

- 资金流水接口已支持按 `type / money_type / status` 搜索

#### 2.4 商品管理 `ntp_common_goods`

已完成接口：

- `api/goods/list`
- `api/goods/add`
- `api/goods/update`
- `api/goods/delete`

已支持能力：

- 商品列表分页展示
- 支持按 `id / goods_name / status / goods_type_id / level_vip / red_way / 时间范围` 搜索
- 支持后台新增商品
- 支持后台修改商品
- 支持后台删除商品

当前删除策略：

- `ntp_common_goods` 使用逻辑删除
- 删除时写入 `del = 1`

#### 2.5 兑换商品管理 `ntp_common_wares`

已完成接口：

- `api/wares/list`
- `api/wares/add`
- `api/wares/update`
- `api/wares/delete`

已支持能力：

- 兑换商品列表分页展示
- 支持按 `id / wares_name / status / wares_type_id / is_type / 时间范围` 搜索
- 支持后台新增兑换商品
- 支持后台修改兑换商品
- 支持后台删除兑换商品

当前删除策略：

- `ntp_common_wares` 当前按表结构执行物理删除

### 3. 当前已补充的配套能力

已完成配套：

- 后台统一分页与时间范围处理基类
- 用户管理验证器
- 商品与兑换商品验证器
- 管理员登录多语言文案
- 用户管理多语言文案
- 商品与兑换商品管理多语言文案

### 4. 当前后台已完成接口总表

| 模块 | 接口地址 | 说明 |
| --- | --- | --- |
| 登录 | `api/login` | 管理员登录 |
| 用户 | `api/user/list` | 用户列表 |
| 用户 | `api/user/update/base` | 修改用户基础信息 |
| 用户 | `api/user/update/status` | 修改用户冻结状态 |
| 用户 | `api/user/update/state` | 修改用户在线状态 |
| 用户 | `api/user/update/balance` | 修改用户余额 |
| 用户 | `api/user/update/integral` | 修改用户积分 |
| 记录 | `api/pay/money/log/list` | 资金流水记录 |
| 记录 | `api/pay/recharge/list` | 充值记录 |
| 记录 | `api/pay/cash/list` | 提现记录 |
| 记录 | `api/goods/order/list` | 商品订单记录 |
| 记录 | `api/income/claim/log/list` | 收益领取记录 |
| 记录 | `api/wares/order/list` | 兑换商品订单记录 |
| 商品 | `api/goods/list` | 商品列表 |
| 商品 | `api/goods/add` | 商品新增 |
| 商品 | `api/goods/update` | 商品修改 |
| 商品 | `api/goods/delete` | 商品删除 |
| 兑换商品 | `api/wares/list` | 兑换商品列表 |
| 兑换商品 | `api/wares/add` | 兑换商品新增 |
| 兑换商品 | `api/wares/update` | 兑换商品修改 |
| 兑换商品 | `api/wares/delete` | 兑换商品删除 |

### 5. 建议下一步补充模块

建议优先补以下后台功能：

#### 5.1 商品分类与兑换商品分类

建议补充：

- 商品分类列表
- 商品分类新增
- 商品分类修改
- 商品分类删除
- 兑换商品分类列表
- 兑换商品分类新增
- 兑换商品分类修改
- 兑换商品分类删除

原因：

- 商品与兑换商品当前已支持管理，但分类管理尚未补齐
- 后台运营调整商品展示时通常会同步维护分类

#### 5.2 商品详情接口

建议补充：

- 商品详情接口
- 兑换商品详情接口

原因：

- 前端编辑页通常需要先拉取详情数据回填
- 当前只有列表与增删改，缺少单条详情读取能力

#### 5.3 第二批记录类页面

建议补充：

- `email` 邮件记录
- `notification` 通知记录
- `user_sign_log` 签到记录
- `task_reward_log` 任务奖励记录
- `vip_daily_reward_log` VIP 每日奖励记录
- `vip_log` VIP 升级记录
- `monthly_salary_log` 月薪记录
- `lottery_log` 抽奖记录
- `prize_pool_log` 奖池记录
- `money_fanyong_log` 返佣记录

#### 5.4 运营配置类接口

建议补充：

- 系统配置管理
- VIP 配置管理
- banner / 广告配置管理
- 任务配置管理

### 6. 当前实现边界说明

为便于后续扩展，当前后台已按以下思路实现：

- 用户余额与积分修改已保留日志写入能力
- 商品与兑换商品的增删改查已单独拆分控制器
- 商品删除与兑换商品删除按照各自表结构分别处理
- 所有新增后台接口均已接入 `route/app.php`

### 7. 结论

当前 `admin_api` 已经完成了后台基础能力的第一阶段搭建，重点包含：

- 管理员登录认证
- 用户管理
- 核心记录类列表
- 商品管理
- 兑换商品管理

下一阶段建议优先补“分类管理 + 详情接口 + 第二批记录页”，这样后台基础运营能力会更完整。
