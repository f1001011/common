// 请求响应参数（不包含data）
export interface Result {
  code: number;
  message: string;
}

// 请求响应参数（包含data）
export interface ResultData<T = any> extends Result {
  data: T;
}

// 分页响应参数
export interface ResPage<T> {
  list: T[];
  pageNum: number;
  pageSize: number;
  total: number;
}

// 分页请求参数
export interface ReqPage {
  page?: number;
  limit?: number;
}

// 文件上传模块
export namespace Upload {
  export interface ResFileUrl {
    fileUrl: string;
  }
}

// 登录模块
export namespace Login {
  export interface ReqLoginForm {
    username: string;
    password: string;
  }
  export interface ResLogin {
    token: string;
    admin_info?: {
      id?: number;
      user_name?: string;
      [key: string]: any;
    };
  }
  export interface ResAuthButtons {
    [key: string]: string[];
  }
}

// 用户管理模块
export namespace User {
  export interface ReqUserParams extends ReqPage {
    user_id?: number | string;
    user_name?: string;
    phone?: string;
    level_vip?: number | string;
    status?: number | string;
    state?: number | string;
    start_time?: string;
    end_time?: string;
  }

  export interface ResUserList {
    id: number;
    user_no: string;
    user_name: string;
    username?: string;
    nickname: string;
    phone: string;
    pwd_text?: string;
    status: number;
    state: number;
    level_vip: number;
    gender?: number;
    current_experience: number;
    money_balance: number | string;
    money_integral: number | string;
    money_team: number | string;
    total_recharge: number | string;
    total_withdraw: number | string;
    total_red: number | string;
    is_real_name: number;
    is_fictitious: number;
    is_withdraw: number;
    agent_id_1?: number;
    agent_id_2?: number;
    agent_id_3?: number;
    create_time: string;
    createTime?: string;
    avatar?: string;
    photo?: any[];
    idCard?: string;
    email?: string;
    address?: string;
    user?: { detail: { age: number } };
    children?: ResUserList[];
  }

  export interface ResUserListData {
    total: number;
    per_page: number;
    current_page: number;
    data: ResUserList[];
  }

  export interface UpdateBaseParams {
    id: number;
    user_name?: string;
    phone?: string;
    nickname?: string;
    level_vip?: number;
    pwd?: string;
  }

  export interface UpdateStatusParams {
    id: number;
    status: number;
  }

  export interface UpdateStateParams {
    id: number;
    state: number;
  }

  export interface UpdateAmountParams {
    id: number;
    action: "inc" | "dec";
    amount: number;
  }

  export interface ResStatus {
    userLabel: string;
    userValue: number | string;
    userStatus?: number | string;
  }

  export interface ResGender {
    genderLabel: string;
    genderValue: number | string;
  }

  export interface ResDepartment {
    id: string;
    name: string;
    children?: ResDepartment[];
  }

  export interface ResRole {
    id: string;
    name: string;
    children?: ResDepartment[];
  }
}

// 资金流水模块
export namespace PayMoneyLog {
  export interface ReqParams extends ReqPage {
    user_id?: number | string;
    start_time?: string;
    end_time?: string;
    type?: number | string;
    money_type?: number | string;
    status?: number | string;
  }

  export interface ResListItem {
    id: number;
    uid: number;
    type: number;
    status: number;
    money_type: number;
    money_before: number | string;
    money_end: number | string;
    money: number | string;
    source_id: number;
    market_uid: number;
    rmark: string;
    create_time: string;
  }

  export interface ResListData {
    total: number;
    per_page: number;
    current_page: number;
    data: ResListItem[];
  }
}

// 充值管理模块
export namespace Recharge {
  export interface ReqParams extends ReqPage {
    user_id?: number | string;
    start_time?: string;
    end_time?: string;
    status?: number | string;
    channel_id?: number | string;
    order_no?: string;
  }

  export interface ResListItem {
    id: number;
    create_time: string;
    expire_at?: string;
    success_time?: string;
    money: number | string;
    actual_amount: number | string;
    admin_uid?: number;
    uid: number;
    u_ip?: string;
    u_city?: string;
    sys_bank_id?: string;
    u_bank_name?: string;
    u_bank_user_name?: string;
    u_bank_card?: string;
    market_uid?: number;
    order_no?: string;
    status: number;
    trilateral_order?: string;
    money_end?: number | string;
    money_before?: number | string;
    channel_id?: number;
    channel_name?: string;
    image_url?: string;
    reject_reason?: string;
  }

  export interface UpdateParams {
    id: number;
    status?: number;
    money?: number;
    actual_amount?: number;
    channel_id?: number;
    channel_name?: string;
    order_no?: string;
    sys_bank_id?: string;
    u_bank_name?: string;
    u_bank_user_name?: string;
    u_bank_card?: string;
    reject_reason?: string;
    trilateral_order?: string;
    image_url?: string;
    expire_at?: string;
    success_time?: string;
  }

  export interface ResListData {
    total: number;
    per_page: number;
    current_page: number;
    data: ResListItem[];
  }
}

// 提现管理模块
export namespace Cash {
  export interface ReqParams extends ReqPage {
    user_id?: number | string;
    start_time?: string;
    end_time?: string;
    status?: number | string;
    channel_id?: number | string;
    order_on?: string;
  }

  export interface ResListItem {
    id: number;
    create_time: string;
    success_time?: string;
    money: number | string;
    fee?: number | string;
    actual_amount?: number | string;
    reject_reason?: string;
    money_before?: number | string;
    money_end?: number | string;
    msg?: string;
    u_id: number;
    u_ip?: string;
    u_city?: string;
    admin_uid?: number;
    status: number;
    pay_type?: string;
    u_bank_name?: string;
    u_back_card?: string;
    u_back_user_name?: string;
    market_uid?: number;
    trilateral_order?: string;
    order_on?: string;
    is_status?: number;
    channel_id?: number;
    channel_name?: string;
  }

  export interface UpdateParams {
    id: number;
    status?: number;
    money?: number;
    fee?: number;
    actual_amount?: number;
    channel_id?: number;
    channel_name?: string;
    order_on?: string;
    pay_type?: string;
    u_bank_name?: string;
    u_back_card?: string;
    u_back_user_name?: string;
    reject_reason?: string;
    trilateral_order?: string;
    success_time?: string;
    msg?: string;
    is_status?: number;
  }

  export interface ResListData {
    total: number;
    per_page: number;
    current_page: number;
    data: ResListItem[];
  }
}

// 支付渠道模块
export namespace PayChannel {
  export interface ReqParams extends ReqPage {
    id?: number | string;
    type?: number | string;
    name?: string;
    status?: number | string;
    start_time?: string;
    end_time?: string;
  }

  export interface ResListItem {
    id: number;
    json_value: string;
    type: number;
    name: string;
    status: number;
    create_time: string;
  }

  export interface AddParams {
    type: number;
    name: string;
    json_value: string;
    status: number;
  }

  export interface UpdateParams {
    id: number;
    type?: number;
    name?: string;
    json_value?: string;
    status?: number;
  }

  export interface DeleteParams {
    id: number;
  }

  export interface ResListData {
    total: number;
    per_page: number;
    current_page: number;
    data: ResListItem[];
  }
}

// 商品管理模块
export namespace Goods {
  export interface ReqParams extends ReqPage {
    id?: number | string;
    goods_name?: string;
    status?: number | string;
    goods_type_id?: number | string;
    level_vip?: number | string;
    red_way?: number | string;
    start_time?: string;
    end_time?: string;
  }

  export interface ResListItem {
    id: number;
    goods_type_id: number;
    goods_name: string;
    goods_money: number | string;
    project_scale: number | string;
    day_red: number | string;
    income_times_per_day: number;
    income_per_time: number | string;
    total_money: number | string;
    revenue_lv: number | string;
    period: number;
    status: number;
    red_way: number;
    warrant: string;
    create_time: string;
    head_img?: string;
    bottom_img?: string;
    is_examine: number;
    sort: number;
    is_coupon: number;
    progress_rate: number | string;
    goods_agent_1: number | string;
    goods_agent_2: number | string;
    goods_agent_3: number | string;
    buy_num: number;
    level_vip: number;
    minute_claim: number;
  }

  export interface SaveParams {
    id?: number;
    goods_type_id: number;
    goods_name: string;
    goods_money: number;
    project_scale: number;
    day_red: number;
    income_times_per_day: number;
    income_per_time: number;
    total_money: number;
    revenue_lv: number;
    period: number;
    status: number;
    red_way: number;
    warrant: string;
    head_img?: string;
    bottom_img?: string;
    is_examine: number;
    sort: number;
    is_coupon: number;
    progress_rate: number;
    goods_agent_1: number;
    goods_agent_2: number;
    goods_agent_3: number;
    buy_num: number;
    level_vip: number;
    minute_claim: number;
  }

  export interface DeleteParams {
    id: number;
  }

  export interface ResListData {
    total: number;
    per_page: number;
    current_page: number;
    data: ResListItem[];
  }
}
