<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :request-api="requestAdminLogList"
      :data-callback="dataCallback"
      :search-col="{ xs: 1, sm: 2, md: 3, lg: 4, xl: 4 }"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>系统日志</span>
          <el-tag type="info" effect="plain">真实接口：/system/log/list</el-tag>
        </div>
      </template>

      <template #func="scope">
        <el-tag type="primary" effect="light">{{ scope.row.func || "-" }}</el-tag>
      </template>

      <template #rmark="scope">
        <div class="remark-cell">{{ scope.row.rmark || "-" }}</div>
      </template>
    </ProTable>
  </div>
</template>

<script setup lang="ts" name="systemLog">
import { reactive } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps } from "@/components/ProTable/interface";
import { AdminLog } from "@/api/interface";
import { getAdminLogList } from "@/api/modules/config";

const columns = reactive<ColumnProps<AdminLog.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "日志ID", width: 90 },
  { prop: "admin_id", label: "管理员ID", width: 110, search: { el: "input" } },
  { prop: "name", label: "管理员", minWidth: 120, search: { el: "input" } },
  { prop: "ip", label: "IP", minWidth: 140, search: { el: "input" } },
  { prop: "func", label: "操作方法", minWidth: 220, search: { el: "input" } },
  { prop: "rmark", label: "备注", minWidth: 360 },
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

const requestAdminLogList = (params: Record<string, any>) => {
  const newParams: AdminLog.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    admin_id: params.admin_id,
    name: params.name,
    ip: params.ip,
    func: params.func
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getAdminLogList(newParams);
};

const dataCallback = (data: AdminLog.ResListData) => ({
  list: data.data || [],
  total: data.total || 0
});
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

.remark-cell {
  line-height: 1.6;
  color: #4b5563;
  white-space: normal;
  word-break: break-all;
}
</style>
