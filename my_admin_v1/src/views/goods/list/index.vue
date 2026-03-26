<template>
  <div class="table-box">
    <div class="summary-grid">
      <div class="summary-card">
        <span class="summary-label">当前页产品数</span>
        <strong>{{ summary.total }}</strong>
      </div>
      <div class="summary-card success">
        <span class="summary-label">上架产品</span>
        <strong>{{ summary.online }}</strong>
      </div>
      <div class="summary-card warning">
        <span class="summary-label">即将推出</span>
        <strong>{{ summary.coming }}</strong>
      </div>
      <div class="summary-card danger">
        <span class="summary-label">下架产品</span>
        <strong>{{ summary.offline }}</strong>
      </div>
    </div>

    <ProTable
      ref="proTable"
      :columns="columns"
      :request-api="requestGoodsList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="table-header">
          <div class="page-title">
            <span>产品列表</span>
            <el-tag type="info" effect="plain">真实接口：/goods/list</el-tag>
          </div>
          <el-button type="primary" @click="openDialog()">新增产品</el-button>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="getStatusTag(scope.row.status)" effect="light">
          {{ getStatusText(scope.row.status) }}
        </el-tag>
      </template>

      <template #red_way="scope">
        <el-tag :type="Number(scope.row.red_way) === 1 ? 'primary' : 'warning'" effect="plain">
          {{ Number(scope.row.red_way) === 1 ? "到期还本还息" : "每日返息到期还本" }}
        </el-tag>
      </template>

      <template #goods_money="scope">
        <span class="amount">S/ {{ formatMoney(scope.row.goods_money) }}</span>
      </template>

      <template #day_red="scope">
        <span>S/ {{ formatMoney(scope.row.day_red) }}</span>
      </template>

      <template #total_money="scope">
        <span class="success-text">S/ {{ formatMoney(scope.row.total_money) }}</span>
      </template>

      <template #commission="scope">
        <div class="commission-cell">
          <span>L1: {{ formatMoney(scope.row.goods_agent_1) }}</span>
          <span>L2: {{ formatMoney(scope.row.goods_agent_2) }}</span>
          <span>L3: {{ formatMoney(scope.row.goods_agent_3) }}</span>
        </div>
      </template>

      <template #operation="scope">
        <el-button type="primary" link @click="openDialog(scope.row)">编辑</el-button>
        <el-button type="danger" link @click="handleDelete(scope.row)">删除</el-button>
      </template>
    </ProTable>

    <GoodsDialog ref="dialogRef" />
  </div>
</template>

<script setup lang="ts" name="goodsList">
import { reactive, ref } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { Goods } from "@/api/interface";
import { deleteGoods, getGoodsList } from "@/api/modules/goods";
import GoodsDialog from "@/views/goods/components/GoodsDialog.vue";

const proTable = ref<ProTableInstance>();
const dialogRef = ref<InstanceType<typeof GoodsDialog> | null>(null);

const summary = reactive({
  total: 0,
  online: 0,
  coming: 0,
  offline: 0
});

const statusOptions = [
  { label: "全部", value: "" },
  { label: "下架", value: 0 },
  { label: "上架", value: 1 },
  { label: "即将推出", value: 2 }
];

const redWayOptions = [
  { label: "全部", value: "" },
  { label: "到期还本还息", value: 1 },
  { label: "每日返息到期还本", value: 2 }
];

const columns = reactive<ColumnProps<Goods.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "产品ID", width: 90, search: { el: "input" } },
  { prop: "goods_name", label: "产品名称", minWidth: 180, search: { el: "input" } },
  { prop: "goods_type_id", label: "分类ID", width: 100, search: { el: "input" } },
  {
    prop: "status",
    label: "状态",
    width: 120,
    enum: statusOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  {
    prop: "red_way",
    label: "返利方式",
    minWidth: 160,
    enum: redWayOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "level_vip", label: "VIP等级", width: 100, search: { el: "input" } },
  { prop: "goods_money", label: "价格", width: 120 },
  { prop: "day_red", label: "日收益", width: 120 },
  { prop: "total_money", label: "总收益", width: 120 },
  { prop: "period", label: "周期(天)", width: 100 },
  { prop: "buy_num", label: "限购次数", width: 100 },
  { prop: "commission", label: "返佣", minWidth: 160, isSetting: false },
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
  { prop: "operation", label: "操作", fixed: "right", width: 140 }
]);

const requestGoodsList = (params: Record<string, any>) => {
  const newParams: Goods.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    id: params.id,
    goods_name: params.goods_name,
    goods_type_id: params.goods_type_id,
    status: params.status,
    red_way: params.red_way,
    level_vip: params.level_vip
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getGoodsList(newParams);
};

const dataCallback = (res: Goods.ResListData) => {
  const list = res.data || [];
  summary.total = list.length;
  summary.online = list.filter(item => Number(item.status) === 1).length;
  summary.coming = list.filter(item => Number(item.status) === 2).length;
  summary.offline = list.filter(item => Number(item.status) === 0).length;
  return {
    list,
    total: res.total || 0
  };
};

const openDialog = (row?: Goods.ResListItem) => {
  dialogRef.value?.acceptParams({
    row,
    getTableList: () => proTable.value?.getTableList()
  });
};

const handleDelete = (row: Goods.ResListItem) => {
  ElMessageBox.confirm(`确认删除产品“${row.goods_name}”吗？`, "删除确认", {
    type: "warning"
  }).then(async () => {
    await deleteGoods({ id: row.id });
    ElMessage.success("产品已删除");
    proTable.value?.getTableList();
  });
};

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);

const getStatusText = (value: number | string) => {
  const map: Record<number, string> = {
    0: "下架",
    1: "上架",
    2: "即将推出"
  };
  return map[Number(value)] || `状态${value}`;
};

const getStatusTag = (value: number | string) => {
  const map: Record<number, "info" | "success" | "warning"> = {
    0: "info",
    1: "success",
    2: "warning"
  };
  return map[Number(value)] || "info";
};
</script>

<style scoped lang="scss">
.table-header {
  display: flex;
  justify-content: space-between;
  gap: 16px;
  align-items: center;
}

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

.commission-cell {
  display: flex;
  flex-direction: column;
  gap: 2px;
  font-size: 12px;
  color: #4b5563;
}

@media (max-width: 1200px) {
  .summary-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 768px) {
  .table-header {
    flex-direction: column;
    align-items: flex-start;
  }

  .summary-grid {
    grid-template-columns: 1fr;
  }
}
</style>
