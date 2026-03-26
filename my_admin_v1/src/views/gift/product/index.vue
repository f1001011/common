<template>
  <div class="table-box">
    <div class="summary-grid">
      <div class="summary-card">
        <span class="summary-label">当前页商品数</span>
        <strong>{{ summary.total }}</strong>
      </div>
      <div class="summary-card success">
        <span class="summary-label">上架商品</span>
        <strong>{{ summary.online }}</strong>
      </div>
      <div class="summary-card danger">
        <span class="summary-label">下架商品</span>
        <strong>{{ summary.offline }}</strong>
      </div>
    </div>

    <ProTable
      ref="proTable"
      :columns="columns"
      :request-api="requestWaresList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="table-header">
          <div class="page-title">
            <span>赠送产品管理</span>
            <el-tag type="info" effect="plain">真实接口：/wares/list</el-tag>
          </div>
          <el-button type="primary" @click="openDialog()">新增产品</el-button>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="Number(scope.row.status) === 1 ? 'success' : 'info'" effect="light">
          {{ Number(scope.row.status) === 1 ? "上架" : "下架" }}
        </el-tag>
      </template>

      <template #wares_money="scope">
        <span class="amount">{{ formatMoney(scope.row.wares_money) }} 积分</span>
      </template>

      <template #head_img="scope">
        <el-link v-if="scope.row.head_img" :href="scope.row.head_img" target="_blank" type="primary">查看图片</el-link>
        <span v-else>-</span>
      </template>

      <template #content="scope">
        <div class="content-preview">{{ scope.row.content || "-" }}</div>
      </template>

      <template #operation="scope">
        <el-button type="primary" link @click="openDialog(scope.row)">编辑</el-button>
        <el-button type="danger" link @click="handleDelete(scope.row)">删除</el-button>
      </template>
    </ProTable>

    <WaresDialog ref="dialogRef" />
  </div>
</template>

<script setup lang="ts" name="giftProduct">
import { reactive, ref } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { Wares } from "@/api/interface";
import { deleteWares, getWaresList } from "@/api/modules/product";
import WaresDialog from "@/views/gift/components/WaresDialog.vue";

const proTable = ref<ProTableInstance>();
const dialogRef = ref<InstanceType<typeof WaresDialog> | null>(null);

const summary = reactive({
  total: 0,
  online: 0,
  offline: 0
});

const statusOptions = [
  { label: "全部", value: "" },
  { label: "下架", value: 0 },
  { label: "上架", value: 1 }
];

const columns = reactive<ColumnProps<Wares.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "商品ID", width: 90, search: { el: "input" } },
  { prop: "wares_name", label: "商品名称", minWidth: 180, search: { el: "input" } },
  { prop: "wares_type_id", label: "分类ID", width: 100, search: { el: "input" } },
  {
    prop: "status",
    label: "状态",
    width: 120,
    enum: statusOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "wares_spec", label: "商品规格", minWidth: 140 },
  { prop: "wares_money", label: "兑换积分", width: 120 },
  { prop: "is_type", label: "兑换类型", width: 100 },
  { prop: "head_img", label: "商品图片", width: 100 },
  { prop: "content", label: "商品介绍", minWidth: 220 },
  { prop: "sort", label: "排序", width: 90 },
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

const requestWaresList = (params: Record<string, any>) => {
  const newParams: Wares.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    id: params.id,
    wares_name: params.wares_name,
    wares_type_id: params.wares_type_id,
    status: params.status
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getWaresList(newParams);
};

const dataCallback = (res: Wares.ResListData) => {
  const list = res.data || [];
  summary.total = list.length;
  summary.online = list.filter(item => Number(item.status) === 1).length;
  summary.offline = list.filter(item => Number(item.status) === 0).length;
  return {
    list,
    total: res.total || 0
  };
};

const openDialog = (row?: Wares.ResListItem) => {
  dialogRef.value?.acceptParams({
    row,
    getTableList: () => proTable.value?.getTableList()
  });
};

const handleDelete = (row: Wares.ResListItem) => {
  ElMessageBox.confirm(`确认删除“${row.wares_name}”吗？`, "删除确认", {
    type: "warning"
  }).then(async () => {
    await deleteWares({ id: row.id });
    ElMessage.success("赠送产品已删除");
    proTable.value?.getTableList();
  });
};

const formatMoney = (value: number | string) => Number(value || 0).toFixed(2);
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
  grid-template-columns: repeat(3, minmax(0, 1fr));
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

.content-preview {
  display: -webkit-box;
  overflow: hidden;
  color: #4b5563;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

@media (max-width: 900px) {
  .table-header {
    flex-direction: column;
    align-items: flex-start;
  }

  .summary-grid {
    grid-template-columns: 1fr;
  }
}
</style>
