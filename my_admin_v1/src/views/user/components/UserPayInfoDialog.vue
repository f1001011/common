<template>
  <el-dialog
    v-model="dialogVisible"
    title="生成支付信息"
    width="680px"
    destroy-on-close
    :show-close="false"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
  >
    <div class="user-summary">
      <div class="summary-item">
        <span class="label">用户ID</span>
        <span class="value">{{ currentRow.id || "-" }}</span>
      </div>
      <div class="summary-item">
        <span class="label">手机号</span>
        <span class="value">{{ currentRow.phone || "-" }}</span>
      </div>
      <div class="summary-item">
        <span class="label">昵称</span>
        <span class="value">{{ currentRow.nickname || "-" }}</span>
      </div>
      <div class="summary-item">
        <span class="label">当前余额</span>
        <span class="value balance">{{ currencyPrefix }}{{ formatMoney(currentRow.money_balance) }}</span>
      </div>
    </div>

    <el-form ref="formRef" :model="form" :rules="rules" label-width="110px">
      <el-form-item label="充值金额" prop="money">
        <el-input-number v-model="form.money" :min="0.01" :precision="2" :step="1" controls-position="right" class="full-width" />
      </el-form-item>

      <el-form-item label="支付通道" prop="channel_id">
        <el-select
          v-model="form.channel_id"
          placeholder="请选择已启用支付通道"
          filterable
          class="full-width"
          :loading="channelLoading"
        >
          <el-option v-for="item in channelOptions" :key="item.id" :label="item.name" :value="item.id" />
        </el-select>
      </el-form-item>

      <el-form-item label="补单原因/备注" prop="remark">
        <el-input
          v-model.trim="form.remark"
          type="textarea"
          :rows="4"
          maxlength="200"
          show-word-limit
          placeholder="请输入补单原因或备注"
        />
      </el-form-item>
    </el-form>

    <div v-if="responseText" class="result-box">
      <div class="result-header">
        <span>返回信息</span>
        <el-button link type="primary" v-copy="responseText">复制返回信息</el-button>
      </div>
      <el-input :model-value="responseText" type="textarea" :rows="10" readonly />
    </div>

    <template #footer>
      <el-button @click="handleClose">关闭</el-button>
      <el-button type="primary" :loading="submitLoading" @click="handleSubmit">生成支付信息</el-button>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import { computed, reactive, ref } from "vue";
import type { FormInstance, FormRules } from "element-plus";
import { ElMessage } from "element-plus";
import { PayChannel, User } from "@/api/interface";
import { getPayChannelList } from "@/api/modules/payment";
import { generateUserPayInfo, recordUserPayInfoLog } from "@/api/modules/user";
import { currencyPrefix } from "@/utils";

interface DialogParams {
  row: User.ResUserList;
}

const dialogVisible = ref(false);
const formRef = ref<FormInstance>();
const submitLoading = ref(false);
const channelLoading = ref(false);
const channelOptions = ref<PayChannel.ResListItem[]>([]);
const responseData = ref<User.GeneratePayInfoResult | "">("");

const currentRow = reactive<User.ResUserList>({
  id: 0,
  user_no: "",
  user_name: "",
  nickname: "",
  phone: "",
  status: 1,
  state: 0,
  level_vip: 0,
  current_experience: 0,
  money_balance: 0,
  money_integral: 0,
  money_team: 0,
  total_recharge: 0,
  total_withdraw: 0,
  total_red: 0,
  is_real_name: 0,
  is_fictitious: 0,
  is_withdraw: 0,
  create_time: ""
});

const form = reactive({
  money: 0,
  channel_id: undefined as number | undefined,
  remark: ""
});

const rules: FormRules = {
  money: [
    { required: true, message: "请输入充值金额", trigger: "blur" },
    {
      validator: (_rule, value, callback) => {
        if (Number(value) <= 0) {
          callback(new Error("充值金额必须大于 0"));
          return;
        }
        callback();
      },
      trigger: "blur"
    }
  ],
  channel_id: [{ required: true, message: "请选择支付通道", trigger: "change" }],
  remark: [{ required: true, message: "请输入补单原因/备注", trigger: "blur" }]
};

const responseText = computed(() => {
  if (!responseData.value) return "";
  return typeof responseData.value === "string" ? responseData.value : JSON.stringify(responseData.value, null, 2);
});

const resetState = () => {
  form.money = 0;
  form.channel_id = undefined;
  form.remark = "";
  responseData.value = "";
  formRef.value?.clearValidate();
};

const loadChannelOptions = async () => {
  channelLoading.value = true;
  try {
    const { data } = await getPayChannelList({ page: 1, limit: 200, status: 1, type: 1 });
    channelOptions.value = data.data || [];
  } finally {
    channelLoading.value = false;
  }
};

const acceptParams = async ({ row }: DialogParams) => {
  Object.assign(currentRow, row);
  resetState();
  dialogVisible.value = true;
  await loadChannelOptions();
};

const formatMoney = (value: number | string | undefined) => Number(value || 0).toFixed(2);

const handleClose = () => {
  dialogVisible.value = false;
  resetState();
};

const handleSubmit = () => {
  formRef.value?.validate(async valid => {
    if (!valid) return;

    const username = String(currentRow.user_name || currentRow.username || "").trim();
    const phone = String(currentRow.phone || "").trim();
    if (!username || !phone) {
      ElMessage.warning("当前用户缺少账号或手机号，无法生成支付信息");
      return;
    }

    const selectedChannel = channelOptions.value.find(item => Number(item.id) === Number(form.channel_id));
    submitLoading.value = true;

    try {
      const result = await generateUserPayInfo({
        phone,
        username,
        id: Number(currentRow.id),
        money: Number(form.money),
        message: form.remark
      });

      responseData.value = result;
      try {
        await recordUserPayInfoLog({
          user_id: Number(currentRow.id),
          phone,
          username,
          nickname: currentRow.nickname || "",
          money: Number(form.money),
          channel_id: Number(form.channel_id),
          channel_name: selectedChannel?.name || "",
          remark: form.remark,
          result: typeof result === "string" ? result : JSON.stringify(result)
        });
        ElMessage.success("支付信息已生成");
      } catch (_error) {
        ElMessage.warning("支付信息已生成，但操作日志记录失败");
      }
    } catch (error) {
      const message = error instanceof Error ? error.message : "生成支付信息失败";
      ElMessage.error(message || "生成支付信息失败");
    } finally {
      submitLoading.value = false;
    }
  });
};

defineExpose({
  acceptParams
});
</script>

<style scoped lang="scss">
.user-summary {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 12px;
  padding: 14px;
  margin-bottom: 16px;
  background: #f8fafc;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
}

.summary-item {
  display: flex;
  justify-content: space-between;
  gap: 12px;
  font-size: 14px;
}

.label {
  color: #6b7280;
}

.value {
  font-weight: 500;
  color: #111827;
}

.balance {
  color: #2563eb;
}

.full-width {
  width: 100%;
}

.result-box {
  margin-top: 8px;
}

.result-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
  font-size: 14px;
  font-weight: 600;
  color: #1f2937;
}
</style>
