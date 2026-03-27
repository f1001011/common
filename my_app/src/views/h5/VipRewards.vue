<template>
  <div class="vip-page">
    <section class="top-hero">
      <div class="top-bar">
        <button class="icon-btn" @click="router.back()"><ChevronLeft :size="18" /></button>
        <div class="page-title">SVIP Recompensas</div>
        <div class="ghost-space"></div>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <article class="summary-card">
          <div>
            <span>Tu nivel SVIP</span>
            <strong>Sin nivel</strong>
          </div>
          <div class="summary-right">
            <span>Recompensa diaria</span>
            <strong>$ 0</strong>
          </div>
          <div class="summary-foot">
            <span>0 niveles desbloqueados</span>
            <span>Acreditación automática diaria</span>
          </div>
        </article>

        <div class="list-head">
          <span class="section-label">TODOS LOS NIVELES</span>
          <div class="section-line"></div>
        </div>

        <div class="level-list">
          <article v-for="item in levels" :key="item.level" class="level-card">
            <div class="lock-wrap"><Lock :size="18" /></div>
            <div class="level-copy">
              <strong>SVIP{{ item.level }}</strong>
              <span>VIC{{ item.level }} × 2</span>
            </div>
            <div class="level-price">
              <strong>$ {{ item.reward }}</strong>
              <span>/ día</span>
            </div>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ChevronLeft, Lock } from 'lucide-vue-next'

const router = useRouter()

const levels = [
  { level: 1, reward: '288' },
  { level: 2, reward: '388' },
  { level: 3, reward: '588' },
  { level: 4, reward: '888' },
  { level: 5, reward: '1.888' },
  { level: 6, reward: '3.888' }
]
</script>

<style scoped>
.vip-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #102219 0 138px, #f4efe6 138px 100%);
}

.top-hero {
  padding: 16px 18px 30px;
  color: #f6f0e5;
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
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.summary-card,
.level-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 248, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.summary-card {
  padding: 18px;
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 34%),
    linear-gradient(180deg, #1f241e 0%, #121612 100%);
  border-color: rgba(31, 36, 30, 0.84);
  color: #f6f0e5;
}

.summary-card span,
.summary-foot,
.section-label,
.level-copy span,
.level-price span {
  color: rgba(246, 240, 229, 0.5);
}

.summary-card strong {
  display: block;
  margin-top: 8px;
  font-size: 28px;
}

.summary-right {
  margin-top: 18px;
}

.summary-foot {
  display: flex;
  justify-content: space-between;
  margin-top: 18px;
  padding-top: 14px;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
  font-size: 13px;
}

.list-head {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-top: 24px;
}

.section-label {
  color: #b7aca0;
  font-size: 11px;
  letter-spacing: 2px;
  text-transform: uppercase;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(202, 190, 176, 0.72), transparent);
}

.level-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-top: 14px;
}

.level-card {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 14px;
  align-items: center;
  padding: 16px;
}

.lock-wrap {
  display: inline-flex;
  width: 42px;
  height: 42px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #f1ece4;
  color: #b5aa9d;
}

.level-copy strong {
  display: block;
  color: #302821;
  font-size: 20px;
}

.level-copy span,
.level-price span {
  color: #a69b8e;
}

.level-price {
  text-align: right;
}

.level-price strong {
  display: block;
  color: #8d7040;
  font-size: 24px;
}
</style>
