import { GoodsOrder, IncomeClaimLog, Wares, WaresOrder, WithdrawShowcase } from "@/api/interface/index";
import { PORT1 } from "@/api/config/servicePort";
import http from "@/api";

/**
 * @name 产品扩展模块
 */
export const getWaresList = (params: Wares.ReqParams) => {
  return http.post<Wares.ResListData>(PORT1 + `/wares/list`, params);
};

export const addWares = (params: Wares.SaveParams) => {
  return http.post(PORT1 + `/wares/add`, params);
};

export const updateWares = (params: Wares.SaveParams) => {
  return http.post(PORT1 + `/wares/update`, params);
};

export const deleteWares = (params: Wares.DeleteParams) => {
  return http.post(PORT1 + `/wares/delete`, params);
};

export const getGoodsOrderList = (params: GoodsOrder.ReqParams) => {
  return http.post<GoodsOrder.ResListData>(PORT1 + `/goods/order/list`, params);
};

export const getIncomeClaimLogList = (params: IncomeClaimLog.ReqParams) => {
  return http.post<IncomeClaimLog.ResListData>(PORT1 + `/income/claim/log/list`, params);
};

export const getWaresOrderList = (params: WaresOrder.ReqParams) => {
  return http.post<WaresOrder.ResListData>(PORT1 + `/wares/order/list`, params);
};

export const getWithdrawShowcaseList = (params: WithdrawShowcase.ReqParams) => {
  return http.post<WithdrawShowcase.ResListData>(PORT1 + `/withdraw/showcase/list`, params);
};
