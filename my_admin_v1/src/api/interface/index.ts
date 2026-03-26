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
