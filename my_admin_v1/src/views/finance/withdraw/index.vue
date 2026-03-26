<template>
  <div class="table-box">
    <div class="summary-grid">
      <div class="summary-card danger">
        <span class="summary-label">申请中</span>
        <strong>{{ summary.applying }}</strong>
      </div>
      <div class="summary-card success">
        <span class="summary-label">已完成</span>
        <strong>{{ summary.success }}</strong>
      </div>
      <div class="summary-card warning">
        <span class="summary-label">已拒绝</span>
        <strong>{{ summary.reject }}</strong>
      </div>
      <div class="summary-card">
        <span class="summary-label">当前页总额</span>
        <strong>S/ {{ formatMoney(summary.totalMoney) }}</strong>
      </div>
    </div>

    <ProTable
      ref="proTable"
      :columns="columns"
      :request-api="requestCashList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>提现管理</span>
          <el-tag type="info" effect="plain">真实接口：/pay/cash/list</el-tag>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="getStatusTag(scope.row.status)" effect="light">
          {{ getStatusText(scope.row.status) }}
        </el-tag>
      </template>

      <template #money="scope">
        <span class="amount">S/ {{ formatMoney(scope.row.money) }}</span>
      </template>

      <template #actual_amount="scope">
        <span class="success-text">S/ {{ formatMoney(scope.row.actual_amount) }}</span>
      </template>

      <template #fee="scope">
        <span>S/ {{ formatMoney(scope.row.fee) }}</span>
      </template>

      <template #is_status="scope">
        <el-tag :type="Number(scope.row.is_status) === 1 ? 'success' : 'info'" effect="plain">
          {{ Number(scope.row.is_status) === 1 ? "已提交" : "未提交" }}
        </el-tag>
      </template>

      <template #operation="scope">
        <el-button type="primary" link @click="openDialog(scope.row)">编辑</el-button>
      </template>
    </ProTable>

    <WithdrawDialog ref="dialogRef" />
  </div>
</template>

<script setup lang="ts" name="financeWithdraw">
import { reactive, ref } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { Cash } from "@/api/interface";
import { getCashList } from "@/api/modules/payment";
import WithdrawDialog from "@/views/finance/components/WithdrawDialog.vue";

const proTable = ref<ProTableInstance>();
const dialogRef = ref<InstanceType<typeof WithdrawDialog> | null>(null);

const summary = reactive({
  applying: 0,
  success: 0,
  reject: 0,
  totalMoney: 0
});

const statusOptions = [
  { label: "全部", value: "" },
  { label: "申请中", value: 0 },
  { label: "已完成", value: 1 },
  { label: "已拒绝", value: 2 }
];

const columns = reactive<ColumnProps<Cash.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "订单ID", width: 90 },
  { prop: "u_id", label: "用户ID", width: 100, search: { el: "input" } },
  { prop: "order_on", label: "订单号", minWidth: 180, search: { el: "input" } },
  {
    prop: "status",
    label: "状态",
    width: 120,
    enum: statusOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "money", label: "提现金额", width: 120 },
  { prop: "fee", label: "手续费", width: 110 },
  { prop: "actual_amount", label: "实际到账", width: 120 },
  { prop: "channel_name", label: "渠道名称", minWidth: 120 },
  { prop: "u_bank_name", label: "银行名称", minWidth: 140 },
  { prop: "u_back_card", label: "收款账号", minWidth: 150 },
  { prop: "is_status", label: "平台提交", width: 110 },
  {
    prop: "create_time",
    label: "申请时间",
    minWidth: 180,
    search: {
      el: "date-picker",
      key: "date_range",
      span: 2,
      props: { type: "datetimerange", valueFormat: "YYYY-MM-DD HH:mm:ss" }
    }
  },
  { prop: "success_time", label: "审核时间", minWidth: 180 },
  { prop: "operation", label: "操作", fixed: "right", width: 100 }
]);

const requestCashList = (params: Record<string, any>) => {
  const newParams: Cash.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.u_id,
    status: params.status,
    order_on: params.order_on
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getCashList(newParams);
};

const dataCallback = (res: Cash.ResListData) => {
  const list = res.data || [];
  summary.applying = list.filter(item => Number(item.status) === 0).length;
  summary.success = list.filter(item => Number(item.status) === 1).length;
  summary.reject = list.filter(item => Number(item.status) === 2).length;
  summary.totalMoney = list.reduce((sum, item) => sum + Number(item.money || 0), 0);
  return {
    list,
    total: res.total || 0
  };
};

const openDialog = (row: Cash.ResListItem) => {
  dialogRef.value?.acceptParams({
    row,
    getTableList: () => proTable.value?.getTableList()
  });
};

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);

const getStatusText = (value: number | string) => {
  const map: Record<number, string> = {
    0: "申请中",
    1: "已完成",
    2: "已拒绝"
  };
  return map[Number(value)] || `状态${value}`;
};

const getStatusTag = (value: number | string) => {
  const map: Record<number, "danger" | "success" | "warning"> = {
    0: "warning",
    1: "success",
    2: "danger"
  };
  return map[Number(value)] || "warning";
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

.summary-grid {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 16px;
  margin-bottom: 16px;
}

.summary-card {
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding: 18px 20px;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
}

.summary-card strong {
  font-size: 24px;
  color: #111827;
}

.summary-card.success {
  border-color: #bbf7d0;
  background: #f0fdf4;
}

.summary-card.warning {
  border-color: #fde68a;
  background: #fffbeb;
}

.summary-card.danger {
  border-color: #fecaca;
  background: #fef2f2;
}

.summary-label {
  font-size: 13px;
  color: #6b7280;
}

.amount {
  font-weight: 600;
  color: #111827;
}

.success-text {
  font-weight: 600;
  color: #16a34a;
}

@media (max-width: 1200px) {
  .summary-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 768px) {
  .summary-grid {
    grid-template-columns: 1fr;
  }
}
</style>
