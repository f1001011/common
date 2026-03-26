<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :request-api="requestShowcaseList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>提现凭证</span>
          <el-tag type="info" effect="plain">真实接口：/withdraw/showcase/list</el-tag>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="Number(scope.row.status) === 1 ? 'success' : 'warning'" effect="light">
          {{ Number(scope.row.status) === 1 ? "展示中" : "待处理" }}
        </el-tag>
      </template>

      <template #amount="scope">
        <span class="amount success-text">S/ {{ formatMoney(scope.row.amount) }}</span>
      </template>

      <template #voucher_image="scope">
        <el-link v-if="scope.row.voucher_image" :href="scope.row.voucher_image" target="_blank" type="primary">查看凭证</el-link>
        <span v-else>-</span>
      </template>
    </ProTable>
  </div>
</template>

<script setup lang="ts" name="withdrawShowcase">
import { reactive } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps } from "@/components/ProTable/interface";
import { WithdrawShowcase } from "@/api/interface";
import { getWithdrawShowcaseList } from "@/api/modules/product";

const statusOptions = [
  { label: "全部", value: "" },
  { label: "待处理", value: 0 },
  { label: "展示中", value: 1 },
  { label: "已拒绝", value: 2 }
];

const columns = reactive<ColumnProps<WithdrawShowcase.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "凭证ID", width: 90 },
  { prop: "user_id", label: "用户ID", width: 100, search: { el: "input" } },
  { prop: "withdraw_id", label: "提现订单ID", width: 120, search: { el: "input" } },
  {
    prop: "status",
    label: "状态",
    width: 120,
    enum: statusOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "user_name", label: "账号", minWidth: 140 },
  { prop: "nickname", label: "昵称", minWidth: 140 },
  { prop: "phone", label: "手机号", minWidth: 140 },
  { prop: "amount", label: "金额", width: 120 },
  { prop: "like_count", label: "点赞数", width: 90 },
  { prop: "comment_count", label: "评论数", width: 90 },
  { prop: "voucher_image", label: "凭证图", width: 100 },
  {
    prop: "create_time",
    label: "创建时间",
    minWidth: 180,
    search: {
      el: "date-picker",
      key: "date_range",
      span: 2,
      props: { type: "datetimerange", valueFormat: "YYYY-MM-DD HH:mm:ss" }
    }
  }
]);

const requestShowcaseList = (params: Record<string, any>) => {
  const newParams: WithdrawShowcase.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.user_id,
    withdraw_id: params.withdraw_id,
    status: params.status
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getWithdrawShowcaseList(newParams);
};

const dataCallback = (res: WithdrawShowcase.ResListData) => ({
  list: res.data || [],
  total: res.total || 0
});

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);
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
}

.success-text {
  color: #16a34a;
}
</style>
