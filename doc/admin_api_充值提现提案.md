## admin_api 充值提现提案

更新时间：2026-03-25

### 1. 提案目标

本提案文档用于整理 `admin_api` 当前已经完成的充值、提现、支付渠道、提现凭证展示相关后台接口，方便前端、测试和后续继续扩展。

当前实现统一遵循后台项目规范：

- 控制器统一继承 `BaseCon`
- 模型统一继承 `BaseModel`
- 查询统一走模型
- 列表统一使用 `paginate()`
- 返回统一使用 `Show()`
- 参数统一走 `validate`
- 文案统一写入 `lang`

### 2. 当前涉及数据表

本轮后台接口涉及以下数据表：

- `ntp_common_pay_recharge`
- `ntp_common_pay_cash`
- `ntp_common_pay_channel`
- `ntp_common_withdraw_showcase`
- `ntp_common_pay_money_log`
- `ntp_common_user`

### 3. 已完成模块

#### 3.1 充值订单管理

已完成接口：

- `api/pay/recharge/list`
- `api/pay/recharge/update`

已支持能力：

- 查询所有充值订单
- 支持按 `user_id / start_time / end_time / status / channel_id / order_no` 搜索
- 默认分页 `page = 1`
- 默认每页 `limit = 20`
- 默认按 `id desc` 展示
- 支持后台修改充值订单字段

当前可修改字段：

- `status`
- `money`
- `actual_amount`
- `channel_id`
- `channel_name`
- `order_no`
- `sys_bank_id`
- `u_bank_name`
- `u_bank_user_name`
- `u_bank_card`
- `reject_reason`
- `trilateral_order`
- `image_url`
- `expire_at`
- `success_time`

当前订单处理规则：

- 当充值订单状态从“未到账”修改为“已到账”时，会自动给用户增加余额
- 充值到账时会同步写入资金流水
- 已经到账的充值订单，不允许再次修改金额或到账状态，避免重复加款

#### 3.2 提现订单管理

已完成接口：

- `api/pay/cash/list`
- `api/pay/cash/update`

已支持能力：

- 查询所有提现订单
- 支持按 `user_id / start_time / end_time / status / channel_id / order_on` 搜索
- 默认分页 `page = 1`
- 默认每页 `limit = 20`
- 默认按 `id desc` 展示
- 支持后台修改提现订单字段

当前可修改字段：

- `status`
- `money`
- `fee`
- `actual_amount`
- `channel_id`
- `channel_name`
- `order_on`
- `pay_type`
- `u_bank_name`
- `u_back_card`
- `u_back_user_name`
- `reject_reason`
- `trilateral_order`
- `success_time`
- `msg`
- `is_status`

当前订单处理规则：

- 当提现订单状态从“申请中”修改为“拒绝”时，会自动把提现金额退回用户余额
- 提现拒绝退回时会同步写入资金流水
- 已经审核完成的提现订单，不允许再次修改状态或金额，避免重复退回
- 提现成功时，只更新订单审核结果与审核时间，不重复做余额扣减

#### 3.3 支付渠道配置

已完成接口：

- `api/pay/channel/list`
- `api/pay/channel/add`
- `api/pay/channel/update`
- `api/pay/channel/delete`

已支持能力：

- 渠道列表查询
- 支持按 `id / type / name / status / start_time / end_time` 搜索
- 支持新增支付渠道
- 支持修改支付渠道
- 支持删除支付渠道

当前配置字段：

- `type`
- `name`
- `json_value`
- `status`

渠道用途说明：

- `type = 1` 代表充值渠道
- `type = 2` 代表提现渠道
- `json_value` 作为渠道配置参数内容，后台只负责保存与维护

#### 3.4 提现凭证展示

已完成接口：

- `api/withdraw/showcase/list`

已支持能力：

- 查询用户上传的提现凭证展示数据
- 支持按 `user_id / withdraw_id / status / start_time / end_time` 搜索
- 默认分页 `page = 1`
- 默认每页 `limit = 20`
- 默认按 `id desc` 展示
- 列表中附带用户账号、昵称、手机号信息

说明：

- 当前提现凭证只做后台展示
- 不涉及后台审核、修改、删除等处理

### 4. 当前接口总表

| 模块 | 接口地址 | 说明 |
| --- | --- | --- |
| 充值 | `api/pay/recharge/list` | 充值订单列表 |
| 充值 | `api/pay/recharge/update` | 充值订单修改 |
| 提现 | `api/pay/cash/list` | 提现订单列表 |
| 提现 | `api/pay/cash/update` | 提现订单修改 |
| 渠道 | `api/pay/channel/list` | 支付渠道列表 |
| 渠道 | `api/pay/channel/add` | 支付渠道新增 |
| 渠道 | `api/pay/channel/update` | 支付渠道修改 |
| 渠道 | `api/pay/channel/delete` | 支付渠道删除 |
| 提现凭证 | `api/withdraw/showcase/list` | 提现凭证展示列表 |

### 5. 本轮已补充的配套能力

本轮已同步补充：

- 充值提现后台验证器
- 充值提现后台多语言文案
- 支付渠道后台多语言文案
- 充值到账资金流水写入
- 提现拒绝退款资金流水写入

### 6. 当前实现边界

当前实现边界如下：

- `ntp_common_pay_recharge` 只做后台订单查询与订单修改
- `ntp_common_pay_cash` 只做后台订单查询与订单修改
- `ntp_common_pay_channel` 只做配置维护，不处理实际支付逻辑
- `ntp_common_withdraw_showcase` 只做展示，不做审核逻辑

本轮未扩展内容：

- 充值凭证表 `ntp_common_recharge_voucher`
- 充值 / 提现订单详情接口
- 充值 / 提现批量审核接口
- 审核操作日志单独记录表

### 7. 建议下一步补充

建议后续优先补以下能力：

#### 7.1 充值凭证展示

建议补充：

- 充值凭证列表接口
- 凭证关联用户昵称展示

原因：

- 前台已有凭证上传与展示逻辑
- 后台通常也需要查看用户提交的充值截图

#### 7.2 订单详情接口

建议补充：

- 充值订单详情接口
- 提现订单详情接口

原因：

- 后台修改页通常需要单条详情回填
- 只靠列表字段容易不够用

#### 7.3 审核操作追踪

建议补充：

- 单独审核备注字段维护
- 审核记录日志表
- 审核前后差异记录

原因：

- 后台后续如果多人协作处理订单，需要更清晰的审计能力

### 8. 结论

当前 `admin_api` 的充值提现后台基础能力已经完成第一阶段，已覆盖：

- 充值订单列表与修改
- 提现订单列表与修改
- 支付渠道配置管理
- 提现凭证展示列表

下一阶段建议优先补“充值凭证展示 + 订单详情 + 审核追踪”，这样支付后台会更完整。
