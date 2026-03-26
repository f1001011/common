<template>
  <div class="table-box finance-list-page">
    <ProTable
      ref="proTable"
      :columns="columns"
      :request-api="requestMoneyLogList"
      :data-callback="dataCallback"
      :search-col="{ xs: 1, sm: 2, md: 3, lg: 4, xl: 6 }"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>资金流水</span>
          <el-tag type="info" effect="plain">已对接 admin_api</el-tag>
        </div>
      </template>

      <template #type="scope">
        <el-tag :type="Number(scope.row.type) === 1 ? 'success' : 'danger'" effect="light">
          {{ getTypeText(scope.row.type) }}
        </el-tag>
      </template>

      <template #money_type="scope">
        <el-tag :type="Number(scope.row.money_type) === 1 ? 'primary' : 'warning'" effect="light">
          {{ getMoneyTypeText(scope.row.money_type) }}
        </el-tag>
      </template>

      <template #status="scope">
        <span>{{ getStatusText(scope.row.status) }}</span>
      </template>

      <template #money_before="scope">
        <span>{{ currencyPrefix }}{{ formatMoney(scope.row.money_before) }}</span>
      </template>

      <template #money="scope">
        <span :class="Number(scope.row.type) === 1 ? 'amount-up' : 'amount-down'">
          {{ Number(scope.row.type) === 1 ? "+" : "-" }}{{ currencyPrefix }}{{ formatMoney(scope.row.money) }}
        </span>
      </template>

      <template #money_end="scope">
        <span>{{ currencyPrefix }}{{ formatMoney(scope.row.money_end) }}</span>
      </template>
    </ProTable>
  </div>
</template>

<script setup lang="ts" name="financeMoneyLog">
import { ref, reactive } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { PayMoneyLog } from "@/api/interface";
import { getPayMoneyLogList } from "@/api/modules/payment";
import { currencyPrefix } from "@/utils";

const proTable = ref<ProTableInstance>();

const typeOptions = [
  { label: "全部", value: "" },
  { label: "收入", value: 1 },
  { label: "支出", value: 2 }
];

const moneyTypeOptions = [
  { label: "全部", value: "" },
  { label: "余额", value: 1 },
  { label: "积分", value: 2 }
];

const statusOptions = [
  { label: "全部", value: "" },
  { label: "充值到账", value: 101 },
  { label: "管理员加余额", value: 120 },
  { label: "管理员减余额", value: 121 },
  { label: "管理员加积分", value: 122 },
  { label: "管理员减积分", value: 123 },
  { label: "提现扣款", value: 201 },
  { label: "提现驳回退回", value: 202 }
];

const columns = reactive<ColumnProps<PayMoneyLog.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "流水ID", width: 90 },
  { prop: "uid", label: "用户ID", width: 100, search: { el: "input", order: 1 } },
  {
    prop: "type",
    label: "收支类型",
    width: 120,
    enum: typeOptions,
    search: { el: "select", order: 3, props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  {
    prop: "money_type",
    label: "账户类型",
    width: 120,
    enum: moneyTypeOptions,
    search: { el: "select", order: 2, props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  {
    prop: "status",
    label: "业务状态",
    minWidth: 150,
    enum: statusOptions,
    search: { el: "select", order: 4, props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "money_before", label: "变更前", width: 120 },
  { prop: "money", label: "变更金额", width: 140 },
  { prop: "money_end", label: "变更后", width: 120 },
  { prop: "source_id", label: "来源ID", width: 100 },
  { prop: "rmark", label: "备注", minWidth: 180 },
  {
    prop: "create_time",
    label: "创建时间",
    minWidth: 180,
    search: {
      el: "date-picker",
      order: 5,
      key: "date_range",
      span: 2,
      props: { type: "datetimerange", valueFormat: "YYYY-MM-DD HH:mm:ss" }
    }
  }
]);

const requestMoneyLogList = (params: Record<string, any>) => {
  const newParams: PayMoneyLog.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.uid,
    type: params.type,
    money_type: params.money_type,
    status: params.status
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getPayMoneyLogList(newParams);
};

const dataCallback = (data: PayMoneyLog.ResListData) => {
  return {
    list: data.data || [],
    total: data.total || 0
  };
};

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);

const getTypeText = (value: number | string) => (Number(value) === 1 ? "收入" : "支出");

const getMoneyTypeText = (value: number | string) => (Number(value) === 1 ? "余额" : "积分");

const getStatusText = (value: number | string) => {
  const current = statusOptions.find(item => Number(item.value) === Number(value));
  return current?.label || `状态${value}`;
};
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

.amount-up {
  font-weight: 600;
  color: #16a34a;
}

.amount-down {
  font-weight: 600;
  color: #dc2626;
}
</style>
