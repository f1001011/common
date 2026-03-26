import { Login } from "@/api/interface/index";
import { PORT1 } from "@/api/config/servicePort";
import authMenuList from "@/assets/json/authMenuList.json";
import authButtonList from "@/assets/json/authButtonList.json";
import http from "@/api";

/**
 * @name 登录模块
 */
// 用户登录
export const loginApi = (params: Login.ReqLoginForm) => {
  // admin_api 需要 user_name + pwd
  const payload = { user_name: params.username, pwd: params.password };
  return http.post<Login.ResLogin>(PORT1 + `/login`, payload, { loading: false }); // 正常 post json 请求  ==>  application/json
  // return http.post<Login.ResLogin>(PORT1 + `/login`, params, { loading: false }); // 控制当前请求不显示 loading
  // return http.post<Login.ResLogin>(PORT1 + `/login`, {}, { params }); // post 请求携带 query 参数  ==>  ?username=admin&password=123456
  // return http.post<Login.ResLogin>(PORT1 + `/login`, qs.stringify(params)); // post 请求携带表单参数  ==>  application/x-www-form-urlencoded
  // return http.get<Login.ResLogin>(PORT1 + `/login?${qs.stringify(params, { arrayFormat: "repeat" })}`); // get 请求可以携带数组等复杂参数
};

// 获取菜单列表
export const getAuthMenuListApi = () => {
  // admin_api 暂无菜单接口，默认使用本地菜单
  return Promise.resolve(authMenuList as Menu.MenuOptions[]);
};

// 获取按钮权限
export const getAuthButtonListApi = () => {
  // admin_api 暂无按钮权限接口，默认使用本地按钮权限
  return Promise.resolve(authButtonList as Login.ResAuthButtons);
};

// 用户退出登录
export const logoutApi = () => {
  // admin_api 暂无退出接口，前端本地清理即可
  return Promise.resolve(true);
};
