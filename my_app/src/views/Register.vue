<template>
  <div class="reg-root">
    <div class="bg-canvas">
      <div class="orb orb-cyan"></div>
      <div class="orb orb-lime"></div>
      <div class="orb orb-red"></div>
    </div>

    <div class="reg-wrap">
      <div
        class="top-bar"
        v-motion
        :initial="{ opacity: 0, y: -20 }"
        :enter="{ opacity: 1, y: 0, transition: { delay: 40 } }"
      >
        <button class="back-btn" @click="router.push('/login')">
          <ChevronLeft :size="20" />
        </button>
        <span class="top-title">{{ t('auth.registerTitle') }}</span>
        <div style="width: 38px"></div>
      </div>

      <div
        class="reg-hero"
        v-motion
        :initial="{ opacity: 0, x: -24 }"
        :enter="{ opacity: 1, x: 0, transition: { delay: 100, type: 'spring', stiffness: 200, damping: 22 } }"
      >
        <div class="hero-icon"><UserPlus :size="26" /></div>
        <div>
          <div class="hero-title">{{ t('auth.registerTitle') }}</div>
          <div class="hero-sub">{{ t('auth.registerSubtitle') }}</div>
        </div>
      </div>

      <div
        class="reg-card glass-card"
        v-motion
        :initial="{ opacity: 0, y: 40, scale: 0.94 }"
        :enter="{ opacity: 1, y: 0, scale: 1, transition: { delay: 160, type: 'spring', stiffness: 180, damping: 22 } }"
      >
        <div class="card-top-bar"></div>

        <div class="field-label">{{ t('auth.phone') }}</div>
        <div class="field-group" :class="{ 'field-error': phoneErr }">
          <div class="field-icon"><Phone :size="16" /></div>
          <input
            v-model="phone"
            class="field-input"
            type="tel"
            maxlength="9"
            :placeholder="t('auth.phonePlaceholder')"
            @input="phoneErr = ''"
          />
        </div>
        <p v-if="phoneErr" class="err-tip">{{ phoneErr }}</p>

        <div class="field-label">{{ t('auth.invitationCode') }}</div>
        <div class="field-group">
          <div class="field-icon"><KeyRound :size="16" /></div>
          <input
            v-model="invitationCode"
            class="field-input"
            type="text"
            maxlength="50"
            :placeholder="t('auth.invitationCodePlaceholder')"
          />
        </div>
        <p class="field-hint">{{ t('auth.invitationCodeTip') }}</p>

        <div class="field-label">{{ t('password') }}</div>
        <div class="field-group" :class="{ 'field-error': passErr }">
          <div class="field-icon"><Lock :size="16" /></div>
          <input
            v-model="password"
            class="field-input"
            :type="showPass ? 'text' : 'password'"
            :placeholder="t('auth.newPasswordPlaceholder')"
            @input="passErr = ''"
            @keyup.enter="handleRegister"
          />
          <button class="eye-btn" @click="showPass = !showPass">
            <Eye v-if="!showPass" :size="16" />
            <EyeOff v-else :size="16" />
          </button>
        </div>
        <p v-if="passErr" class="err-tip">{{ passErr }}</p>

        <button class="submit-btn" :class="{ loading }" :disabled="loading" @click="handleRegister">
          <span v-if="!loading">{{ t('auth.registerBtn') }}</span>
          <Loader2 v-else :size="18" class="spinner" />
        </button>

        <p class="agreement">
          注册即代表同意 <span class="agreement-link">用户协议</span> 和 <span class="agreement-link">隐私政策</span>
        </p>
      </div>

      <div
        class="bottom-link"
        v-motion
        :initial="{ opacity: 0 }"
        :enter="{ opacity: 1, transition: { delay: 400 } }"
      >
        <span>{{ t('auth.hasAccount') }}</span>
        <button class="link-btn" @click="router.push('/login')">{{ t('auth.toLogin') }}</button>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { Phone, Lock, Eye, EyeOff, ChevronLeft, UserPlus, Loader2, KeyRound } from 'lucide-vue-next'
import { useAuth } from '@/hooks/useAuth'
import { usePopup } from '@/composables/usePopup'

const router = useRouter()
const { t } = useI18n()
const { register } = useAuth()
const { showPopup } = usePopup()

const phone = ref('')
const invitationCode = ref('')
const password = ref('')
const showPass = ref(false)
const loading = ref(false)
const phoneErr = ref('')
const passErr = ref('')

function validate() {
  let ok = true

  if (!/^1\d{8}$/.test(phone.value)) {
    phoneErr.value = t('auth.phoneError')
    ok = false
  }

  if (!/^[A-Za-z0-9]{8,25}$/.test(password.value)) {
    passErr.value = t('auth.passwordError')
    ok = false
  }

  return ok
}

async function handleRegister() {
  if (!validate() || loading.value) return
  loading.value = true
  try {
    await register(phone.value, password.value, invitationCode.value)
    showPopup(t('auth.registerSuccess'), 'success')
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
* { box-sizing: border-box; margin: 0; padding: 0; }

.reg-root {
  min-height: 100vh; background: var(--bg-base);
  display: flex; align-items: center; justify-content: center;
  position: relative; overflow: hidden; padding: 24px 20px;
  font-family: 'Inter','SF Pro Text',-apple-system,'PingFang SC','Noto Sans SC',sans-serif;
  -webkit-font-smoothing: antialiased;
}

.bg-canvas { position: fixed; inset: 0; pointer-events: none; z-index: 0; }
.orb { position: absolute; border-radius: 50%; filter: blur(90px); }
.orb-cyan { width:400px; height:400px; top:-80px; right:-80px;   background:var(--orb-cyan);      animation:drift 18s ease-in-out infinite; }
.orb-lime { width:320px; height:320px; bottom:-60px; left:-40px; background:rgba(105,255,71,0.22); animation:drift 22s ease-in-out infinite reverse; }
.orb-red  { width:260px; height:260px; top:50%; left:50%;        background:var(--orb-red);       animation:drift 26s ease-in-out infinite 3s; }
@keyframes drift {
  0%,100% { transform:translate(0,0) scale(1); }
  40%     { transform:translate(18px,-14px) scale(1.05); }
  70%     { transform:translate(-12px,10px) scale(0.96); }
}

.reg-wrap {
  position: relative; z-index: 1;
  width: 100%; max-width: 400px;
  display: flex; flex-direction: column; gap: 20px;
}

.top-bar { display:flex; align-items:center; justify-content:space-between; }
.back-btn {
  width:38px; height:38px; border-radius:11px;
  background:rgba(255,255,255,0.06); border:1px solid rgba(255,255,255,0.08);
  color:rgba(255,255,255,0.6); display:flex; align-items:center; justify-content:center;
  cursor:pointer; transition:background 0.2s, transform 0.15s;
}
.back-btn:hover  { background:rgba(255,255,255,0.1); }
.back-btn:active { transform:scale(0.93); }
.top-title { font-size:15px; font-weight:600; color:rgba(255,255,255,0.7); letter-spacing:0.3px; }

.reg-hero { display:flex; align-items:center; gap:14px; padding:0 2px; }
.hero-icon {
  width:50px; height:50px; border-radius:15px; flex-shrink:0;
  background:linear-gradient(135deg,#00e5ff,#00b0ff);
  display:flex; align-items:center; justify-content:center; color:#fff;
  box-shadow:0 0 22px rgba(0,229,255,0.45), 0 4px 14px rgba(0,0,0,0.3);
}
.hero-title { font-size:20px; font-weight:800; color:rgba(255,255,255,0.92); letter-spacing:-0.3px; margin-bottom:3px; }
.hero-sub   { font-size:12px; color:rgba(255,255,255,0.35); letter-spacing:0.2px; }

.glass-card {
  background:var(--bg-card);
  backdrop-filter:blur(28px) saturate(160%);
  -webkit-backdrop-filter:blur(28px) saturate(160%);
  border:1px solid var(--border); border-radius:24px;
}
.reg-card { width:100%; padding:28px 28px 24px; position:relative; overflow:hidden; }
.card-top-bar {
  position:absolute; top:0; left:0; right:0; height:2px;
  background:linear-gradient(90deg,#00e5ff,#69ff47,#ffb800);
  border-radius:24px 24px 0 0;
}

.field-label {
  font-size:11px; font-weight:500; letter-spacing:0.8px; text-transform:uppercase;
  color:rgba(255,255,255,0.35); margin-bottom:8px; margin-top:16px;
}
.field-label:first-of-type { margin-top:0; }

.field-group {
  display:flex; align-items:center;
  background:rgba(255,255,255,0.05); border:1px solid rgba(255,255,255,0.1);
  border-radius:14px; padding:0 16px; height:52px; margin-bottom:6px;
  transition:border-color 0.2s, background 0.2s;
}
.field-group:focus-within { border-color:rgba(0,229,255,0.5); background:rgba(0,229,255,0.04); }
.field-group.field-error  { border-color:rgba(255,77,77,0.65); }
.field-icon { color:rgba(255,255,255,0.28); display:flex; align-items:center; margin-right:12px; flex-shrink:0; }
.field-input {
  flex:1; background:none; border:none; outline:none;
  font-size:15px; color:rgba(255,255,255,0.88); font-family:inherit;
}
.field-input::placeholder { color:rgba(255,255,255,0.22); }
.eye-btn {
  background:none; border:none; cursor:pointer;
  color:rgba(255,255,255,0.28); padding:4px; display:flex; align-items:center;
  transition:color 0.2s;
}
.eye-btn:hover { color:rgba(255,255,255,0.6); }
.err-tip { font-size:11px; color:#ff6b6b; margin-bottom:4px; padding-left:4px; }
.field-hint {
  font-size:11px; color:rgba(255,255,255,0.28);
  margin-bottom:4px; padding-left:4px;
}

.submit-btn {
  width:100%; height:52px; border-radius:14px; border:none; margin-top:20px;
  background:linear-gradient(135deg,#00e5ff,#00b0ff);
  color:#fff; font-size:15px; font-weight:600; letter-spacing:0.5px;
  cursor:pointer; font-family:inherit;
  box-shadow:0 4px 20px rgba(0,229,255,0.35);
  transition:transform 0.18s, box-shadow 0.18s, opacity 0.18s;
  display:flex; align-items:center; justify-content:center;
}
.submit-btn:hover:not(:disabled) { transform:translateY(-2px); box-shadow:0 8px 28px rgba(0,229,255,0.45); }
.submit-btn:active:not(:disabled) { transform:scale(0.97); }
.submit-btn.loading { opacity:0.7; cursor:not-allowed; }
.spinner { animation:spin 0.8s linear infinite; }
@keyframes spin { to { transform:rotate(360deg); } }

.agreement {
  text-align:center; margin-top:14px;
  font-size:11px; color:rgba(255,255,255,0.22); letter-spacing:0.2px;
}
.agreement-link { color:rgba(0,229,255,0.6); cursor:pointer; }
.agreement-link:hover { color:#00e5ff; }

.bottom-link { display:flex; align-items:center; justify-content:center; gap:6px; font-size:13px; color:rgba(255,255,255,0.35); }
.link-btn {
  background:none; border:none; cursor:pointer;
  font-size:13px; font-weight:600; color:#00e5ff; font-family:inherit; transition:color 0.2s;
}
.link-btn:hover { color:#80f0ff; }
</style>
