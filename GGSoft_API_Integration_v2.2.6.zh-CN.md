# GGSoft API Integration v2.2.6 中文整理

来源 PDF：`D:\go\www\mundo17\GGSoft_API_Integration_v2.2.6.pdf`

说明：本文是按对接视角整理的中文 Markdown 版本，重点保留了接入流程、鉴权方式、核心接口、签名规则、报表与附录信息，便于快速查阅。若需要逐页逐字段的完整翻译，建议再结合原 PDF 复核。

## 1. 文档概览

- 文档标题：`API Integration Document`
- 当前版本：`v2.2.6`
- 页数：`84`
- 最近一次版本记录：`2025-09-22`，更新内容为 `Update Game List`
- 主要覆盖范围：
  - 接入流程图
  - 鉴权与 Token 使用
  - 基础对接要求
  - 游戏列表与进房
  - Seamless Wallet（无缝钱包）
  - Transfer Wallet（转账钱包）
  - 报表查询
  - 回放链接生成
  - 赛季终止
  - 错误码 / 语言 / 币种附录

## 2. 总体接入流程

根据文档中的流程图，推荐按下面顺序完成接入：

1. 商户先向 GGSoft 获取 `Operator Token`
2. 使用 `Operator Token` 拉取游戏列表
3. 玩家登录或注册，向 GGSoft 获取 `Player Token`
4. 使用 `Player Token` 获取游戏 URL
5. 玩家进入游戏
6. 若使用 `Seamless Wallet`，GGSoft 会回调商户侧接口进行余额查询、扣款、派奖等处理
7. 若使用 `Transfer Wallet`，商户可主动调用 GGSoft 的钱包接口进行转账、查余额、查转账状态
8. 对账或运营分析时，商户调用报表接口获取投注记录 / 游戏记录
9. 如需复盘单局，可生成回放链接
10. 如需结束会话，可调用赛季终止接口

## 3. Token 体系

GGSoft 文档定义了两类授权令牌：

### 3.1 Merchant Token

用途：

- 拉取游戏列表
- 获取投注 / 游戏报表
- 获取玩家登录会话
- 终止商户级会话

典型使用接口：

- `/auth/memberLogin`
- `/central/getListGame`
- `/report/GetBetRecordList`
- `/report/GetGameRecordList`
- `/auth/v1/terminateSeasonOperator`

### 3.2 Player Token

用途：

- 获取玩家余额
- 玩家进房
- 钱包转账
- 终止玩家会话
- 参与任意游戏内会话

典型使用接口：

- `/central/game/enterGame`
- `/central/transfer`
- `/central/getBalance`
- `/auth/v1/terminateSeasonMember`

### 3.3 Token 使用规则

- 两类 Token 都通过 `Bearer Token` 放在 `Authorization` Header 中
- `Merchant Token` 用于商户级调用
- `Player Token` 用于玩家级调用
- `Player Token` 在玩家进入 GGSoft 体系时也承担注册 / 建立会话的作用

## 4. 基础对接要求

### 4.1 币种处理

文档明确要求：

- 所有支持币种都按 `1:1` 的名义值存储和展示
- 不做缩放，不做面额换算
- 例如 `1.000` 就按 `1.000` 保存和展示

### 4.2 Operator 鉴权

用于获取商户级 Token。

- 路径：`/MasterService/auth/v1/getToken`
- 方法：`POST`
- 请求体示例：

```json
{
  "username": "testing",
  "key": "1234"
}
```

- 请求参数：
  - `username`：GGSoft 提供的用户名，必填
  - `key`：GGSoft 提供的密钥，必填
- 成功返回：
  - `tokenData`：商户级 JWT Token

### 4.3 Player 鉴权 / 登录

用于注册或登录玩家，并取得玩家级 Token。

- 路径：`/MasterService/player/auth/memberLogin?trace_id=xxx`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 主要请求参数：
  - `appid`：商户标识，必填
  - `username`：玩家昵称，必填
  - `uname`：商户侧唯一玩家 ID，必填
  - `cid`：币种 ID，选填；不传默认按 `idr`
  - `phone`：手机号，选填
  - `email`：邮箱，选填
  - `seamless`：是否使用无缝钱包，选填；不传默认 `false`
- 核心返回字段：
  - `token`：玩家级 Token
  - `balance`：玩家余额
  - `app_id`：玩家在 GGSoft 体系中的 ID

## 5. 核心接口整理

## 5.1 游戏列表与进房

### 获取游戏列表

- 路径：`/MasterService/central/getListGame`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 请求体：

```json
{
  "appid": "GG01"
}
```

- 说明：
  - 商户调用该接口获取 GGSoft 的游戏列表
  - 接口由 GGSoft 提供
- 返回重点字段：
  - `glist[].gameid`：游戏 ID
  - `glist[].name`：游戏名称
  - `glist[].platform`：平台类型
  - `glist[].gametype`：游戏类型
  - `glist[].status`：状态
  - `glist[].icon_url`：图标地址

### 获取游戏 URL / 玩家进房

- 路径：`/MasterService/central/game/enterGame`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Player Token>`
- 请求体关键字段：
  - `appid`：商户标识，必填
  - `timestamp`：时间戳，必填
  - `currency`：币种，必填
  - `game_id`：游戏 ID，必填
  - `lang`：语言，选填
- 返回重点字段：
  - `data.gameurl`：最终游戏地址

## 5.2 Seamless Wallet（无缝钱包）

文档说明：这一部分接口通常由商户侧实现，GGSoft 在游戏过程中主动回调商户。

### 关键特点

- GGSoft 会调用商户侧接口
- 商户需要按文档提供余额查询、扣款 / 派奖等能力
- 文档中给了大量不同游戏机制下的请求体 / 回包示例
- 对接时要特别关注特殊玩法字段，例如：
  - `bonus_round_type`
  - `end_round`
  - `award_order_ids`
  - 不同游戏特有日志字段

### 典型接口

#### 获取商户 Token

- 示例路径：`/getToken`
- 方法：`POST`
- 说明：GGSoft 调用商户侧此接口，拿到访问商户 Seamless API 所需的 Token
- 主要字段：
  - `username`
  - `password`
  - `uname`
  - `hash`
- 返回重点字段：
  - `tokenData`

#### 查询玩家余额

- 示例路径：`https://{merchant link URL}/getBalance`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Seamless Merchant Token>`
- 返回重点字段：
  - 玩家当前余额

#### 变更玩家余额

文档在 Seamless 段落中给出了大量余额变动、Scatter、Bouncy 等场景示例。示例 URL 中可见一个常用回调路径：

- 示例路径：`https://{merchant link URL}/verifyUserBalance`

这部分是 Seamless 接入最重的一段，建议在实际开发时：

- 逐个比对文档中的请求体示例
- 按游戏机制校验 `type`、`bonus_round_type`、`award_order_ids`
- 对重复请求、签名失败、订单幂等做严格处理

## 5.3 Transfer Wallet（转账钱包）

### 转账

- 路径：`/MasterService/central/transfer?trace_id=xxx`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Player Token>`
- 请求体关键字段：
  - `appid`
  - `timestamp`
  - `currency`
  - `amount`
  - `tx_id`：商户侧唯一事务号
- 成功返回重点字段：
  - `tx_id`
  - `ptx_id`：GGSoft 侧事务号
  - `balance`
  - `code`

### 查询玩家余额

- 路径：`https://{Our link URL}/MasterService/central/getBalance?trace_id=xxx`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Player Token>`
- 请求体关键字段：
  - `appid`
  - `timestamp`
  - `currency`
  - `uname`
  - `game_id`：可选
- 返回重点字段：
  - `balance`
  - `symbol`

### 查询转账状态

- 路径：`https://{Our link URL}/MasterService/central/transferStatus?trace_id=xxx`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Player Token>`
- 请求体关键字段：
  - `appid`
  - `timestamp`
  - `currency`
  - `uname`
  - `tx_id`
- 返回重点字段：
  - `currency`
  - `amount`
  - `state`

## 5.4 Report API（报表）

报表接口由 GGSoft 提供，文档特别强调：

- 时区按 `UTC+0`
- 接入方需要自行处理统计口径与时区换算

### 投注记录

- 路径：`https://{Our game link URL}/ReportService/report/GetBetRecordList`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 请求体关键字段：
  - `appid`
  - `uname`：可选
  - `game_id`：可选
  - `page`
  - `size`
  - `start_time`
  - `end_time`
- 返回重点字段：
  - `total_max_count`
  - `total_max_pagination`
  - `total_current`
  - `current_page`
  - `data[].round_id`
  - `data[].bet`
  - `data[].enter_money`
  - `data[].after_settlement_money`
  - `data[].win`
  - `data[].create_time`
  - `data[].multiplier`
  - `data[].account`
  - `data[].account_id`
  - `data[].currency`
  - `data[].game_id`
  - `data[].source_game`

### 游戏记录

- 路径：`https://{Our game link URL}/ReportService/report/GetGameRecordList`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 查询参数结构与投注记录类似
- 文档后续页（约第 55-77 页）给出了大量按游戏拆分的日志字段说明
- 如果你要落数据库或做 BI，同步建议重点关注这一段

### 按交易 / 回合 ID 查询单局详情

- 路径：`https://{Our game link URL}/GameService/service/GetTransactionByRoundId`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 请求体关键字段：
  - `app_id`
  - `round_id`
- 用途：
  - 按交易 / 回合 ID 查询单局详细记录

## 5.5 回放链接生成

- 路径：`/GameService/service/simulatingTransaction`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 请求体关键字段：
  - `app_id`
  - `round_id`
- 返回重点字段：
  - `url`：回放链接

文档特别说明：

- 回放链接不包含会话时长
- 实时投注类游戏（例如 Crash 类）不支持回放

## 5.6 赛季终止

### 终止 Operator Token 会话

- 路径：`/MasterService/auth/v1/terminateSeasonOperator`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Merchant Token>`
- 请求体：

```json
{
  "appid": "GG01"
}
```

### 终止 Player Token 会话

- 路径：`/MasterService/auth/v1/terminateSeasonMember`
- 方法：`POST`
- Header：
  - `Authorization: Bearer <Player Token>`

## 6. Seamless 签名规则

GGSoft 在无缝钱包段落使用 `MD5` 做请求签名校验。

签名格式：

```text
md5(key1=value1&key2=value2&...&keyN=valueN + secret key)
```

关键规则：

- 第一层 key 必须按字母序排序
- `award_order_ids` 内部元素顺序不要求排序
- 每个键值对之间用 `&` 连接
- value 必须按示例中的字符串形式参与签名
- 不能直接对原始 JSON 或 `JSON.stringify()` 结果做签名
- 签名校验失败时，商户应返回：

```json
{
  "code": 10002,
  "msg": "Signature verification failed"
}
```

补充说明：

- 文档给出的签名 key 是 `staging` 环境用
- 切到 `production` 时，GGSoft 会重新发生产密钥

## 7. 附录整理

## 7.1 错误码

| 代码 | 说明 |
| --- | --- |
| 1 | Success |
| 10001 | 余额不足，提现失败 |
| 10002 | 签名校验失败 |
| 10008 | 游戏已关闭 |
| 10009 | 参数非法 |
| 10011 | 玩家登录 Token 校验失败 |
| 10012 | `app_id` 无效 |
| 10013 | 玩家不存在 |
| 10014 | 玩家被禁用 |
| 10015 | 服务器内部错误 |
| 10016 | Token 错误 |
| 10017 | 重复账号 |
| 10018 | 多次请求错误 |
| 10019 | 交易不存在 |

## 7.2 支持语言

`en`、`id`、`th`、`vn`、`hi`、`ms`、`zn-cn`、`zh-hant`、`ja`、`ko`、`pt-br`

可理解为：

- 英语
- 印尼语
- 泰语
- 越南语
- 印地语
- 马来语
- 简体中文
- 繁体中文
- 日语
- 韩语
- 巴西葡语

## 7.3 支持币种

文档列出的币种代码包括：

`usd`、`idr`、`thb`、`inr`、`vnd`、`eur`、`gbp`、`usdt`、`btc`、`eth`、`xrp`、`busd`、`ngn`、`sgd`、`pkr`、`npr`、`hkd`、`aud`、`bdt`、`mmk`、`php`、`myr`、`cny`、`krw`、`jpy`、`khr`、`lak`、`brl`、`mxn`、`ntd`

## 8. 对接建议

如果你准备实际落地接入，建议按下面顺序做：

1. 先打通 `Operator Token` 获取
2. 再打通 `Player Login / Player Token`
3. 用 `getListGame` 与 `enterGame` 验证基础链路
4. 选定钱包模式：
   - 如果走 `Transfer Wallet`，优先实现 `transfer / getBalance / transferStatus`
   - 如果走 `Seamless Wallet`，优先实现商户侧回调与签名校验
5. 再补报表、回放、赛季终止
6. 对账时统一按 `UTC+0` 处理
7. 对所有带 `tx_id` / `round_id` 的请求做幂等和重复校验

## 9. 这份整理最值得注意的点

- GGSoft 把 Token 分成商户级和玩家级，边界比较明确
- 游戏列表、报表、回放、赛季终止主要是 GGSoft 提供接口
- Seamless Wallet 反过来要求商户提供接口给 GGSoft 回调
- Seamless 段落最容易出问题的是签名排序、字段字符串化、以及特殊玩法场景
- 报表时区固定按 `UTC+0`
- 回放接口并不适用于所有实时类游戏
