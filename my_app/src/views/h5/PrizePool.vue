<template>
  <div class="prize-page">
    <section class="top-hero">
      <div class="top-bar">
        <button class="icon-btn" @click="router.back()"><ChevronLeft :size="18" /></button>
        <div class="page-title">Fondo de premios diarios</div>
        <div class="ghost-space"></div>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <div class="ring-panel">
          <div class="ring">
            <div class="ring-inner">
              <span>Restante</span>
              <strong>$ 10.000</strong>
              <small>/ $ 10.000</small>
            </div>
          </div>
        </div>

        <div class="reset-pill">Próximo reinicio</div>

        <article class="invite-card">
          <Users :size="18" />
          <span>Tus invitaciones válidas hoy</span>
          <strong>0</strong>
          <small>personas</small>
        </article>

        <div class="list-head">
          <span class="section-label">NIVELES DE RECOMPENSA</span>
          <div class="section-line"></div>
        </div>

        <div class="reward-list">
          <article v-for="item in rewards" :key="item.count" class="reward-card">
            <div class="lock-wrap"><Lock :size="18" /></div>
            <div class="reward-body">
              <div class="reward-row">
                <span>{{ item.count }} invitaciones</span>
                <strong>$ {{ item.amount }}</strong>
              </div>
              <div class="progress-bar"><span></span></div>
              <div class="progress-value">0%</div>
            </div>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ChevronLeft, Lock, Users } from 'lucide-vue-next'

const router = useRouter()

const rewards = [
  { count: 10, amount: '388' },
  { count: 20, amount: '888' },
  { count: 50, amount: '1.288' }
]
</script>

<style scoped>
.prize-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #171327 0 138px, #f5eff7 138px 100%);
}

.top-hero {
  padding: 16px 18px 30px;
  color: #f5f0fb;
}

.top-bar {
  display: grid;
  grid-template-columns: 36px 1fr 36px;
  align-items: center;
}

.icon-btn,
.ghost-space {
  width: 36px;
  height: 36px;
}

.icon-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.05);
  color: rgba(255, 255, 255, 0.72);
}

.page-title {
  text-align: center;
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 28px;
  letter-spacing: -0.6px;
}

.content-sheet {
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #fbf8fe 0%, #f5eff7 100%);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.ring-panel,
.invite-card,
.reward-card {
  border: 1px solid rgba(234, 225, 238, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 255, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.ring-panel {
  padding: 24px 18px;
}

.ring {
  display: flex;
  width: 214px;
  height: 214px;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  border-radius: 50%;
  background: conic-gradient(#8a56d8 0deg 360deg, #e7daf8 360deg);
}

.ring-inner {
  display: flex;
  width: 172px;
  height: 172px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #fff;
}

.ring-inner span,
.ring-inner small,
.progress-value,
.section-label {
  color: #b2a6c3;
}

.ring-inner strong {
  margin-top: 8px;
  color: #7c3aed;
  font-size: 30px;
}

.reset-pill {
  width: fit-content;
  margin: 16px auto 0;
  padding: 10px 18px;
  border-radius: 999px;
  background: #fff;
  color: #9a8cb0;
  box-shadow: 0 10px 20px rgba(124, 58, 237, 0.08);
}

.invite-card {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 18px;
  padding: 18px;
  background: linear-gradient(135deg, #a94bf5 0%, #6857ff 100%);
  color: #fff;
}

.invite-card span {
  flex: 1;
}

.invite-card strong {
  font-size: 34px;
}

.list-head {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-top: 24px;
}

.section-label {
  font-size: 11px;
  letter-spacing: 2px;
  text-transform: uppercase;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(197, 183, 214, 0.72), transparent);
}

.reward-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-top: 14px;
}

.reward-card {
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 14px;
  padding: 16px;
}

.lock-wrap {
  display: inline-flex;
  width: 42px;
  height: 42px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #f2edf8;
  color: #b7aac8;
}

.reward-row {
  display: flex;
  justify-content: space-between;
  color: #91859f;
}

.reward-row strong {
  color: #8a56d8;
  font-size: 24px;
}

.progress-bar {
  height: 8px;
  margin-top: 14px;
  border-radius: 999px;
  background: #efe8f7;
}

.progress-value {
  margin-top: 10px;
  text-align: right;
}
</style>
