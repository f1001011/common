## admin_api 全部提案

更新时间：2026-03-25

### 1. 文档目标

本提案文档用于统一整理 `admin_api` 当前已经完成的后台接口能力、接口总表、实现规则和下一步建议扩展方向。

本文件为后台总提案文档，适合作为：

- 后台接口总览
- 前端联调参考
- 测试接口清单
- 后续排期基础文档

### 2. 后台统一规范

当前 `admin_api` 实现统一按照 `app_api` 规范执行：

- 控制器命名：`别名 + Con`
- 模型命名：`别名 + Model`
- 控制器全部继承 `BaseCon`
- 模型全部继承 `BaseModel`
- 查询统一走模型
- 列表接口统一使用 `paginate()`
- 单表分页统一优先使用模型封装
- 参数统一走 `validate`
- 返回统一走 `Show()`
- 文案统一写入 `lang`
- 路由统一按“需要 token / 不需要 token”分组

### 3. 当前已完成模块

#### 3.1 管理员登录与认证

已完成内容：

- 管理员登录接口：`api/login`
- 管理员 token 表：`common_admin_token`
- 认证中间件改为后台管理员 token 校验
- 登录密码加密方式与前台保持一致

当前说明：

- 登录成功后会清理旧 token 并重新生成新 token
- 中间件已统一写入当前管理员 ID，供后台接口直接使用

#### 3.2 用户管理

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
- 支持单独修改冻结状态
- 支持单独修改在线状态
- 支持管理员单独增加或扣除余额
- 支持管理员单独增加或扣除积分
- 余额和积分修改时同步写入资金流水日志

#### 3.3 记录类接口

已完成接口：

- `api/pay/money/log/list`
- `api/pay/recharge/list`
- `api/pay/cash/list`
- `api/goods/order/list`
- `api/income/claim/log/list`
- `api/wares/order/list`
- `api/withdraw/showcase/list`

统一能力：

- 默认 `page = 1`
- 默认 `limit = 20`
- 默认倒序展示
- 普通记录页统一支持 `user_id + 时间范围` 搜索
- 特殊记录页支持补充业务筛选字段

特殊说明：

- `pay/money/log/list` 已支持 `type / money_type / status`
- `pay/recharge/list` 已支持 `status / channel_id / order_no`
- `pay/cash/list` 已支持 `status / channel_id / order_on`
- `withdraw/showcase/list` 只负责展示提现凭证，不做审核处理

#### 3.4 充值与提现后台管理

已完成接口：

- `api/pay/recharge/update`
- `api/pay/cash/update`
- `api/pay/channel/list`
- `api/pay/channel/add`
- `api/pay/channel/update`
- `api/pay/channel/delete`

已支持能力：

- 后台修改充值订单
- 后台修改提现订单
- 后台维护充值 / 提现渠道配置

当前业务规则：

- 充值订单改为“已到账”时，会自动给用户增加余额
- 充值到账时同步写入资金流水
- 已到账充值订单不能再次修改金额或到账状态
- 提现订单改为“拒绝”时，会自动把提现金额退回用户余额
- 提现拒绝退款时同步写入资金流水
- 已审核完成的提现订单不能再次修改状态或金额
- 支付渠道只维护配置参数，不处理实际支付逻辑

#### 3.5 商品管理 `ntp_common_goods`

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

- `ntp_common_goods` 采用逻辑删除
- 删除时写入 `del = 1`

#### 3.6 兑换商品管理 `ntp_common_wares`

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

- `ntp_common_wares` 当前按表结构走物理删除

### 4. 当前已补充的公共能力

已补充配套：

- 后台统一分页与时间范围处理基类
- 用户管理验证器
- 商品管理验证器
- 充值提现验证器
- 管理员登录多语言文案
- 用户管理多语言文案
- 商品管理多语言文案
- 充值提现管理多语言文案
- 后台资金流水写入公共方法

### 5. 当前后台接口总表

| 模块 | 接口地址 | 说明 |
| --- | --- | --- |
| 登录 | `api/login` | 管理员登录 |
| 用户 | `api/user/list` | 用户列表 |
| 用户 | `api/user/update/base` | 修改用户基础信息 |
| 用户 | `api/user/update/status` | 修改用户冻结状态 |
| 用户 | `api/user/update/state` | 修改用户在线状态 |
| 用户 | `api/user/update/balance` | 修改用户余额 |
| 用户 | `api/user/update/integral` | 修改用户积分 |
| 资金 | `api/pay/money/log/list` | 资金流水记录 |
| 充值 | `api/pay/recharge/list` | 充值订单列表 |
| 充值 | `api/pay/recharge/update` | 充值订单修改 |
| 提现 | `api/pay/cash/list` | 提现订单列表 |
| 提现 | `api/pay/cash/update` | 提现订单修改 |
| 渠道 | `api/pay/channel/list` | 支付渠道列表 |
| 渠道 | `api/pay/channel/add` | 支付渠道新增 |
| 渠道 | `api/pay/channel/update` | 支付渠道修改 |
| 渠道 | `api/pay/channel/delete` | 支付渠道删除 |
| 提现凭证 | `api/withdraw/showcase/list` | 提现凭证展示列表 |
| 商品订单 | `api/goods/order/list` | 商品订单记录 |
| 收益领取 | `api/income/claim/log/list` | 收益领取记录 |
| 兑换订单 | `api/wares/order/list` | 兑换商品订单记录 |
| 商品 | `api/goods/list` | 商品列表 |
| 商品 | `api/goods/add` | 商品新增 |
| 商品 | `api/goods/update` | 商品修改 |
| 商品 | `api/goods/delete` | 商品删除 |
| 兑换商品 | `api/wares/list` | 兑换商品列表 |
| 兑换商品 | `api/wares/add` | 兑换商品新增 |
| 兑换商品 | `api/wares/update` | 兑换商品修改 |
| 兑换商品 | `api/wares/delete` | 兑换商品删除 |

### 6. 当前后台第一阶段完成范围

当前第一阶段已经完成的后台核心能力包括：

- 管理员登录认证
- 用户管理
- 用户余额积分调整
- 核心记录页查询
- 充值订单管理
- 提现订单管理
- 支付渠道配置
- 提现凭证展示
- 商品管理
- 兑换商品管理

### 7. 当前实现边界说明

为方便后续继续扩展，当前实现采用以下边界控制：

- 用户余额和积分修改已具备日志写入能力
- 充值提现订单已具备后台单条修改能力
- 商品与兑换商品已具备基础增删改查能力
- 支付渠道只维护配置参数，不混入支付业务逻辑
- 提现凭证只做展示，不做审核和删除处理
- 所有新增后台接口均已挂入 `route/app.php`

当前暂未扩展内容：

- 充值凭证表 `ntp_common_recharge_voucher`
- 商品详情接口
- 兑换商品详情接口
- 商品分类管理
- 兑换商品分类管理
- 第二批记录类接口
- 批量审核接口
- 审核日志追踪

### 8. 建议下一步补充模块

建议优先补以下后台功能：

#### 8.1 商品与兑换商品扩展

建议补充：

- 商品详情接口
- 兑换商品详情接口
- 商品分类管理
- 兑换商品分类管理

原因：

- 编辑页面通常需要详情回填
- 分类管理是运营后台常用能力

#### 8.2 支付后台扩展

建议补充：

- 充值凭证列表 `ntp_common_recharge_voucher`
- 充值订单详情接口
- 提现订单详情接口
- 审核备注记录
- 批量审核接口

原因：

- 当前支付后台已具备基础处理能力
- 再补详情与凭证查看后，支付管理会更完整

#### 8.3 第二批记录类页面

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

#### 8.4 配置类后台

建议补充：

- 系统配置管理
- VIP 配置管理
- banner / 广告配置管理
- 任务配置管理

### 9. 结论

当前 `admin_api` 已经完成后台基础能力的第一阶段建设，已经具备：

- 登录认证
- 用户管理
- 记录页查询
- 支付后台基础管理
- 商品后台基础管理

下一阶段建议优先补“详情接口 + 分类管理 + 充值凭证 + 第二批记录页”，这样后台整体能力会更加完整。
我把计划调整成这版：

先改左侧菜单，和截图结构对齐。
说明：仪表盘先保留样式，不接真实统计数据。
优先做列表类页面对接 admin_api。
先做这些：
用户列表
资金流水
充值管理
提现管理
支付渠道
渠道管理
产品列表
再补其他管理页的菜单和占位页。
比如 VIP、公告、播报、奖池、转盘、周任务、风控等。
最后再回头补统计接口。
到时候再把仪表盘卡片、图表、报表这些数据接进去。