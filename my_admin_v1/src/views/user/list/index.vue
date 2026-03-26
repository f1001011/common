<template>
  <div class="table-box">
    <ProTable
      ref="proTable"
      :columns="columns"
      :request-api="requestUserList"
      :data-callback="dataCallback"
      :tool-button="['refresh', 'setting', 'search']"
    >
      <template #tableHeader>
        <div class="page-title">
          <span>用户列表</span>
          <el-tag type="info" effect="plain">已对接 admin_api</el-tag>
        </div>
      </template>

      <template #status="scope">
        <el-switch
          :model-value="scope.row.status"
          :active-value="1"
          :inactive-value="0"
          active-text="正常"
          inactive-text="冻结"
          @change="value => changeStatus(scope.row, value)"
        />
      </template>

      <template #state="scope">
        <el-switch
          :model-value="scope.row.state"
          :active-value="1"
          :inactive-value="0"
          active-text="在线"
          inactive-text="离线"
          @change="value => changeState(scope.row, value)"
        />
      </template>

      <template #money_balance="scope">
        <span class="money">S/ {{ formatMoney(scope.row.money_balance) }}</span>
      </template>

      <template #money_integral="scope">
        <span>{{ formatMoney(scope.row.money_integral) }}</span>
      </template>

      <template #total_recharge="scope">
        <span>S/ {{ formatMoney(scope.row.total_recharge) }}</span>
      </template>

      <template #total_withdraw="scope">
        <span>S/ {{ formatMoney(scope.row.total_withdraw) }}</span>
      </template>

      <template #operation="scope">
        <el-button type="primary" link @click="openBaseDialog(scope.row)">编辑</el-button>
        <el-button type="primary" link @click="openAmountDialog('balance', scope.row)">调余额</el-button>
        <el-button type="primary" link @click="openAmountDialog('integral', scope.row)">调积分</el-button>
      </template>
    </ProTable>

    <UserBaseDialog ref="baseDialogRef" />
    <UserAmountDialog ref="amountDialogRef" />
  </div>
</template>

<script setup lang="ts" name="userList">
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import ProTable from "@/components/ProTable/index.vue";
import type { ProTableInstance, ColumnProps } from "@/components/ProTable/interface";
import { User } from "@/api/interface";
import { getUserList, updateUserState, updateUserStatus } from "@/api/modules/user";
import UserBaseDialog from "@/views/user/components/UserBaseDialog.vue";
import UserAmountDialog from "@/views/user/components/UserAmountDialog.vue";

const proTable = ref<ProTableInstance>();
const baseDialogRef = ref<InstanceType<typeof UserBaseDialog> | null>(null);
const amountDialogRef = ref<InstanceType<typeof UserAmountDialog> | null>(null);

const statusOptions = [
  { label: "全部", value: "" },
  { label: "正常", value: 1 },
  { label: "冻结", value: 0 }
];

const stateOptions = [
  { label: "全部", value: "" },
  { label: "在线", value: 1 },
  { label: "离线", value: 0 }
];

const columns = reactive<ColumnProps<User.ResUserList>[]>([
  { type: "index", label: "#", width: 70 },
  { prop: "id", label: "用户ID", width: 90, search: { el: "input" } },
  { prop: "user_name", label: "账号", minWidth: 120, search: { el: "input" } },
  { prop: "nickname", label: "昵称", minWidth: 120 },
  { prop: "phone", label: "手机号", minWidth: 140, search: { el: "input" } },
  { prop: "level_vip", label: "VIP等级", width: 110, search: { el: "input" } },
  {
    prop: "status",
    label: "冻结状态",
    width: 130,
    enum: statusOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  {
    prop: "state",
    label: "在线状态",
    width: 130,
    enum: stateOptions,
    search: { el: "select", props: { clearable: true } },
    fieldNames: { label: "label", value: "value" }
  },
  { prop: "money_balance", label: "可用余额", width: 120 },
  { prop: "money_integral", label: "可用积分", width: 120 },
  { prop: "total_recharge", label: "累计充值", width: 120 },
  { prop: "total_withdraw", label: "累计提现", width: 120 },
  {
    prop: "create_time",
    label: "注册时间",
    minWidth: 180,
    search: {
      el: "date-picker",
      key: "date_range",
      span: 2,
      props: { type: "datetimerange", valueFormat: "YYYY-MM-DD HH:mm:ss" }
    }
  },
  { prop: "operation", label: "操作", fixed: "right", width: 220 }
]);

const requestUserList = (params: Record<string, any>) => {
  const newParams: User.ReqUserParams = {
    page: params.pageNum,
    limit: params.pageSize,
    user_id: params.id,
    user_name: params.user_name,
    phone: params.phone,
    level_vip: params.level_vip,
    status: params.status,
    state: params.state
  };

  if (Array.isArray(params.date_range)) {
    newParams.start_time = params.date_range[0];
    newParams.end_time = params.date_range[1];
  }

  return getUserList(newParams);
};

const dataCallback = (data: User.ResUserListData) => {
  return {
    list: data.data || [],
    total: data.total || 0
  };
};

const formatMoney = (value: number | string) => {
  const amount = Number(value || 0);
  return amount.toFixed(2);
};

const refreshTable = () => {
  proTable.value?.getTableList();
};

const changeStatus = async (row: User.ResUserList, value: string | number | boolean) => {
  await updateUserStatus({ id: row.id, status: Number(value) });
  ElMessage.success("冻结状态已更新");
  refreshTable();
};

const changeState = async (row: User.ResUserList, value: string | number | boolean) => {
  await updateUserState({ id: row.id, state: Number(value) });
  ElMessage.success("在线状态已更新");
  refreshTable();
};

const openBaseDialog = (row: User.ResUserList) => {
  baseDialogRef.value?.acceptParams({
    row,
    getTableList: refreshTable
  });
};

const openAmountDialog = (mode: "balance" | "integral", row: User.ResUserList) => {
  amountDialogRef.value?.acceptParams({
    mode,
    row,
    getTableList: refreshTable
  });
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

.money {
  font-weight: 600;
  color: #2563eb;
}
</style>
