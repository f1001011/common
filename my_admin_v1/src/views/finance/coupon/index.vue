<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :request-api="requestCouponList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>优惠券列表</span>
          <el-tag type="info" effect="plain">真实接口：/pay/coupon/list</el-tag>
        </div>
      </template>

      <template #status="scope">
        <el-tag :type="Number(scope.row.status) === 1 ? 'success' : 'warning'" effect="light">
          {{ Number(scope.row.status) === 1 ? "已使用" : "未使用" }}
        </el-tag>
      </template>

      <template #type="scope">
        <el-tag type="primary" effect="light">{{ Number(scope.row.type) === 1 ? "支付券" : `类型${scope.row.type}` }}</el-tag>
      </template>

      <template #money="scope">
        <span class="amount">S/ {{ formatMoney(scope.row.money) }}</span>
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

<script setup lang="ts" name="couponManage">
import { reactive } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import type { ColumnProps } from "@/components/ProTable/interface";
import { Coupon } from "@/api/interface";
import { getCouponList } from "@/api/modules/payment";

const columns = reactive<ColumnProps<Coupon.ResListItem>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "ID", width: 80 },
  { prop: "user_id", label: "用户ID", width: 100, search: { el: "input" } },
  { prop: "user_info", label: "用户信息", minWidth: 220 },
  {
    prop: "type",
    label: "类型",
    width: 100,
    enum: [{ label: "支付券", value: 1 }],
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "money", label: "面额", width: 120 },
  {
    prop: "status",
    label: "状态",
    width: 100,
    enum: [
      { label: "已使用", value: 1 },
      { label: "未使用", value: 2 }
    ],
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "create_time", label: "创建时间", minWidth: 180 },
  { prop: "use_time", label: "使用时间", minWidth: 180 },
  { prop: "exp_time", label: "过期时间", minWidth: 180 },
  {
    prop: "date_range",
    label: "时间范围",
    isShow: false,
    search: { el: "date-picker", span: 2, props: { type: "datetimerange", valueFormat: "YYYY-MM-DD HH:mm:ss" } }
  }
]);

const requestCouponList = (params: Record<string, any>) => {
  const newParams: Coupon.ReqParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.user_id,
    status: params.status,
    type: params.type
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getCouponList(newParams);
};

const dataCallback = (res: Coupon.ResListData) => ({
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
  color: #16a34a;
}

.info-cell {
  display: flex;
  flex-direction: column;
  gap: 4px;
  color: #4b5563;
}
</style>
