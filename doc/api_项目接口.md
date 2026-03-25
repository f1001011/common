app_api 是api项目， 由 thinkphp6.0 创建
 模型已全部生成

已完成 1   生成注册接口，注册接口 团队号，如果上级有团队号，就使用上级，没有就先生成数据，在用自己的ID+1000，
    user_no 是自己的ID+1000  这个 1000设置成常量，可以随便改
    用户邀请码，如果存在邀请码，就查询用户的上级，并赋值agent_id,agent_id_1，agent_id_2，agent_id_3，其他字段根据实际备注填充
    调用 common中的方法生成token，并写表，返回用户信息和token，密码字段不可显示
    需要注册查询是注册过的账号
    
已完成 2 生成登录接口，登录参数是手机号和密码，手机号 正则 写入到 Code中 可配置，先写 成 9 位数字，1开头

控制器定义区分为  商品类， 配置类，支付类 活动类(包括转盘)   日志类 几大类创建

3 ntp_common_ads banner记录，直接全部查询出来，按照sort排序字段排序 和  status=1，不需要分页   

4 ntp_common_email 查询 is_send 已发送的 ，按照 未读 和 id倒序排序 页默认数量都是 20条

5 ntp_common_goods 查询 所有商品。按照 sort 排序 ， status 可选参数 1 和 2 ，没传或者其他都 全部显示，默认每页显示 20条
                    需要详情接口，只需要根据id 查询，并且 需要判定是否上架

6 ntp_common_goods_order 查询用户的订单， 每页显示20条， status 正序和id 倒序 。 加入 模型连表查询，获取 对应的 ntp_common_goods 的信息，ntp_common_goods_order 中每条数据 ntp_common_goods中都有

7 ntp_common_income_claim_log 查询用户待领取，时间是大于领取时间， 按照快过期时间的展示到前面，默认每页显示 20条，需要同时获取 商品的信息和订单的信息，商品的信息和订单的信息 查询的时候 可以加 cache缓存时间 1分钟，不能加就算了

8 ntp_common_lottery_chance 查询  rest_chance 大于0，并且没过期的，全部查询出来，不需要分页，过期时间正序排序

9 ntp_common_lottery_log 查询获得奖品历史，默认每页显示 20条，id倒序

10 ntp_common_lottery_prize 查询奖品列表，全部查询只查询启用的

11 ntp_common_monthly_salary_log 发放记录 默认每页显示 20条

12 ntp_common_notification 按照 未读排在前面，默认每页显示20条

13 ntp_common_pay_cash   每页显示20条按照 id 倒序

14 ntp_common_pay_coupon 只查询10条，过期的不显示， 按照id 倒序

15 ntp_common_pay_money_log 根据 money_type 条件查询， type字段如果没有就全部查询， id 倒序 默认每页显示20条

16 ntp_common_pay_recharge 倒序 每页显示20条

17 ntp_common_prize_pool_log 获奖记录 每页显示 10条

18 ntp_common_recharge_voucher 查询通过的，需要查询用户 昵称

19 ntp_common_sys_config 需要传入 name 字段，。如果没有默认全部查询出来，

20  ntp_common_task_config 任务表，需要 附带查询用户 邀请的下面的 1 2 3级 中大于等于 lv1 的人数

21  ntp_common_task_reward_log  倒序。默认查询20条

22 ntp_common_user_sign_log 倒序，默认展示 20条

23 ntp_common_vip vip等级正序，全部查询

24 ntp_common_vip_daily_reward_log vip 每日工资 ，倒序，默认显示20条

25 ntp_common_vip_log 倒序，默认每页10条

26 ntp_common_wares 每页显示 20条 ，只显示上架
    需要详情接口，只需要根据id 查询，并且 需要判定是否上架
37 ntp_common_wares_order  每页显示 10条


38 ntp_common_withdraw_comment ，ntp_common_withdraw_like ，ntp_common_withdraw_showcase ，展示表每页显示 10条，需要统计点赞数，和评论列表，评论列表每页显示 20条

39 ntp_money_fanyong_log 每页显示20条，倒序



40 用户抽奖，用户点击抽奖的时候请求当前 抽奖接口，需要获取用户是否有抽奖资格，，  
    1 如果没有直接返回提示语， 记得按照前面写的多语言
    2 如果有 获取抽奖奖品，只获取 奖励金额 10000 <= 的。实物奖励不需要，根据奖励概率给用户
    3 保存奖励结果，用户加金额 使用 锁，比如 框架自带的 inc，dec 这种，需要在模型中先定义 模型方法，直接传值调用
    4 写入资金记录(模型定义公共方法)    写入抽奖记录 (模型定义公共方法)    修改抽奖信息数据
    5 返回中奖那条数据的信息，需要加入事务
