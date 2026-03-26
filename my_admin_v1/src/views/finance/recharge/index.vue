<template>
  <div class="table-box finance-list-page">
    <div class="summary-grid">
      <div class="summary-card">
        <span class="summary-label">当前页订单数</span>
        <strong>{{ summary.total }}</strong>
      </div>
      <div class="summary-card success">
        <span class="summary-label">已到账</span>
        <strong>{{ summary.success }}</strong>
      </div>
      <div class="summary-card warning">
        <span class="summary-label">待支付</span>
        <strong>{{ summary.pending }}</strong>
      </div>
      <div class="summary-card danger">
        <span class="summary-label">支付失败</span>
        <strong>{{ summary.failed }}</strong>
      </div>
    </div>

    <ProTable
      ref="proTable"
      :columns="columns"
      :request-api="requestRechargeList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>充值管理</span>
          <el-tag type="info" effect="plain">真实接口：/pay/recharge/list</el-tag>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="getStatusTag(scope.row.status)" effect="light">
          {{ getStatusText(scope.row.status) }}
        </el-tag>
      </template>

      <template #money="scope">
        <span class="amount">{{ currencyPrefix }}{{ formatMoney(scope.row.money) }}</span>
      </template>

      <template #actual_amount="scope">
        <span class="amount success-text">{{ currencyPrefix }}{{ formatMoney(scope.row.actual_amount) }}</span>
      </template>

      <template #channel_name="scope">
        <el-tag v-if="scope.row.channel_name" type="primary" effect="plain">{{ scope.row.channel_name }}</el-tag>
        <span v-else>-</span>
      </template>

      <template #image_url="scope">
        <el-link v-if="scope.row.image_url" :href="scope.row.image_url" target="_blank" type="primary">查看凭证</el-link>
        <span v-else>-</span>
      </template>

      <template #operation="scope">
        <el-button type="primary" link @click="openDialog(scope.row)">编辑</el-button>
      </template>
    </ProTable>

    <RechargeDialog ref="dialogRef" />
  </div>
</template>

<script setup lang="ts" name="financeRecharge">
import { reactive, ref } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { Recharge } from "@/api/interface";
import { getRechargeList } from "@/api/modules/payment";
import { currencyPrefix } from "@/utils";
import RechargeDialog from "@/views/finance/components/RechargeDialog.vue";

const proTable = ref<ProTableInstance>();
const dialogRef = ref<InstanceType<typeof RechargeDialog> | null>(null);

const summary = reactive({
  total: 0,
  success: 0,
  pending: 0,
  failed: 0
});

const statusOptions = [
  { label: "全部", value: "" },
  { label: "创建订单", value: 0 },
  { label: "待支付", value: 1 },
  { label: "已到账", value: 2 },
  { label: "支付失败", value: 3 }
];

const columns = reactive<ColumnProps<Recharge.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "订单ID", width: 90 },
  { prop: "uid", label: "用户ID", width: 100, search: { el: "input" } },
  { prop: "order_no", label: "订单号", minWidth: 180, search: { el: "input" } },
  { prop: "channel_id", label: "渠道ID", width: 100, isShow: false, isSetting: false, search: { el: "input" } },
  {
    prop: "status",
    label: "状态",
    width: 120,
    enum: statusOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "money", label: "充值金额", width: 120 },
  { prop: "actual_amount", label: "实际到账", width: 120 },
  { prop: "channel_name", label: "渠道名称", minWidth: 120 },
  { prop: "sys_bank_id", label: "收款账号", minWidth: 150 },
  { prop: "u_bank_name", label: "银行名称", minWidth: 130 },
  { prop: "trilateral_order", label: "三方订单号", minWidth: 180 },
  { prop: "image_url", label: "凭证", width: 100 },
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
  },
  { prop: "success_time", label: "到账时间", minWidth: 180 },
  { prop: "operation", label: "操作", fixed: "right", width: 100 }
]);

const requestRechargeList = (params: Record<string, any>) => {
  const newParams: Recharge.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.uid,
    status: params.status,
    order_no: params.order_no,
    channel_id: params.channel_id
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getRechargeList(newParams);
};

const dataCallback = (res: Recharge.ResListData) => {
  const list = res.data || [];
  summary.total = list.length;
  summary.success = list.filter(item => Number(item.status) === 2).length;
  summary.pending = list.filter(item => Number(item.status) === 1).length;
  summary.failed = list.filter(item => Number(item.status) === 3).length;
  return {
    list,
    total: res.total || 0
  };
};

const openDialog = (row: Recharge.ResListItem) => {
  dialogRef.value?.acceptParams({
    row,
    getTableList: () => proTable.value?.getTableList()
  });
};

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);

const getStatusText = (value: number | string) => {
  const map: Record<number, string> = {
    0: "创建订单",
    1: "待支付",
    2: "已到账",
    3: "支付失败"
  };
  return map[Number(value)] || `状态${value}`;
};

const getStatusTag = (value: number | string) => {
  const map: Record<number, "info" | "warning" | "success" | "danger"> = {
    0: "info",
    1: "warning",
    2: "success",
    3: "danger"
  };
  return map[Number(value)] || "info";
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
