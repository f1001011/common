<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :request-api="requestVoucherList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>充值凭证列表</span>
          <el-tag type="info" effect="plain">真实接口：/recharge/voucher/list</el-tag>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="statusType(scope.row.status)" effect="light">{{ statusText(scope.row.status) }}</el-tag>
      </template>

      <template #amount="scope">
        <span class="amount">S/ {{ formatMoney(scope.row.amount) }}</span>
      </template>

      <template #voucher_image="scope">
        <el-link v-if="scope.row.voucher_image" :href="scope.row.voucher_image" target="_blank" type="primary">查看凭证</el-link>
        <span v-else>-</span>
      </template>

      <template #user_info="scope">
        <div class="info-cell">
          <span>账号：{{ scope.row.user_name || "-" }}</span>
          <span>昵称：{{ scope.row.nickname || "-" }}</span>
          <span>电话：{{ scope.row.phone || "-" }}</span>
        </div>
      </template>
    </ProTable>
  </div>
</template>

<script setup lang="ts" name="rechargeVoucherManage">
import { reactive } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps } from "@/components/ProTable/interface";
import { RechargeVoucher } from "@/api/interface";
import { getRechargeVoucherList } from "@/api/modules/payment";

const columns = reactive<ColumnProps<RechargeVoucher.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "ID", width: 80 },
  { prop: "user_id", label: "用户ID", width: 100, search: { el: "input" } },
  { prop: "user_info", label: "用户信息", minWidth: 220 },
  { prop: "recharge_id", label: "充值订单ID", width: 130, search: { el: "input" } },
  { prop: "amount", label: "充值金额", width: 120 },
  {
    prop: "status",
    label: "状态",
    width: 100,
    enum: [
      { label: "待审核", value: 0 },
      { label: "通过", value: 1 },
      { label: "拒绝", value: 2 }
    ],
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "voucher_image", label: "凭证图", width: 100 },
  { prop: "create_time", label: "创建时间", minWidth: 180 },
  {
    prop: "date_range",
    label: "时间范围",
    isShow: false,
    search: { el: "date-picker", span: 2, props: { type: "datetimerange", valueFormat: "YYYY-MM-DD HH:mm:ss" } }
  }
]);

const requestVoucherList = (params: Record<string, any>) => {
  const newParams: RechargeVoucher.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.user_id,
    recharge_id: params.recharge_id,
    status: params.status
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getRechargeVoucherList(newParams);
};

const dataCallback = (res: RechargeVoucher.ResListData) => ({
  list: res.data || [],
  total: res.total || 0
});

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);
const statusText = (value: number | string) => ({ 0: "待审核", 1: "通过", 2: "拒绝" })[Number(value)] || `状态${value}`;
const statusType = (value: number | string) => ({ 0: "warning", 1: "success", 2: "danger" })[Number(value)] || "info";
</script>

<style scoped lang="scss">
.page-title {
  display: flex;
  gap: 10px;
  align-items: center;
  font-size: 16px;
  font-weight: 600;
  color: #1f2937;
}

.amount {
  font-weight: 600;
  color: #16a34a;
}

.info-cell {
  display: flex;
  flex-direction: column;
  gap: 4px;
  color: #4b5563;
}
</style>
