<template>
  <div class="share-page">
    <section class="top-hero">
      <div class="hero-copy">
        <span class="eyebrow">Network & commission</span>
        <h1>Mi equipo</h1>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <article class="summary-card">
          <span>Tu red ha generado</span>
          <strong>$ 0</strong>
          <small>en comisiones</small>

          <div class="stat-grid">
            <article>
              <span>Hoy</span>
              <strong>$ 0</strong>
            </article>
            <article>
              <span>Este mes</span>
              <strong>$ 0</strong>
            </article>
            <article>
              <span>Total</span>
              <strong>$ 0</strong>
            </article>
          </div>
        </article>

        <article class="members-card">
          <div class="members-head">
            <strong>0</strong>
            <span>miembros</span>
          </div>

          <div class="level-row" v-for="item in levels" :key="item.name">
            <span>{{ item.name }}</span>
            <span>0</span>
            <div class="bar"><span></span></div>
            <strong>$ 0</strong>
          </div>
        </article>

        <article class="invite-card">
          <div class="invite-head">
            <span class="section-label">INVITAR</span>
            <div class="section-line"></div>
          </div>

          <h3>Invita a tus amigos</h3>

          <div class="code-box">
            <strong>MZV5AVDK</strong>
            <Copy :size="18" />
          </div>

          <div class="action-row">
            <button class="light-btn">
              <Copy :size="16" />
              Copiar enlace
            </button>
            <button class="green-btn">
              <QrCode :size="16" />
              Compartir QR
            </button>
          </div>
        </article>

        <div class="switch-bar">
          <button class="active">Miembros</button>
          <button>Comisiones</button>
        </div>

        <div class="filter-row">
          <button>Todos</button>
          <button class="active">L1</button>
          <button>L2</button>
          <button>L3</button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { Copy, QrCode } from 'lucide-vue-next'

const levels = [{ name: 'L1' }, { name: 'L2' }, { name: 'L3' }]
</script>

<style scoped>
.share-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #102219 0 152px, #f4efe6 152px 100%);
}

.top-hero {
  padding: 20px 18px 30px;
  color: #f6f0e5;
}

.eyebrow {
  display: inline-flex;
  padding: 7px 12px;
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.03);
  color: rgba(246, 240, 229, 0.42);
  font-size: 11px;
  letter-spacing: 1.5px;
  text-transform: uppercase;
}

.hero-copy h1 {
  margin-top: 16px;
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 38px;
  line-height: 0.98;
  letter-spacing: -1.3px;
}

.content-sheet {
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.summary-card,
.members-card,
.invite-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 248, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.summary-card {
  padding: 18px;
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 34%),
    linear-gradient(180deg, #1f6a3f 0%, #165c35 100%);
  border-color: rgba(20, 87, 49, 0.84);
  color: #fff;
}

.summary-card span,
.summary-card small {
  color: rgba(255, 255, 255, 0.7);
}

.summary-card > strong {
  display: block;
  margin-top: 8px;
  font-size: 40px;
}

.stat-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  margin-top: 18px;
  padding: 12px;
  border-radius: 18px;
  background: rgba(255, 255, 255, 0.08);
}

.stat-grid strong {
  display: block;
  margin-top: 6px;
  font-size: 20px;
}

.members-card,
.invite-card {
  margin-top: 16px;
  padding: 18px;
}

.members-head {
  display: flex;
  align-items: baseline;
  gap: 6px;
}

.members-head strong {
  color: #312922;
  font-size: 34px;
}

.members-head span,
.level-row span,
.section-label {
  color: #a79b8e;
}

.level-row {
  display: grid;
  grid-template-columns: 28px 20px 1fr auto;
  gap: 12px;
  align-items: center;
  margin-top: 16px;
}

.bar {
  height: 8px;
  border-radius: 999px;
  background: #efe9e0;
}

.invite-head {
  display: flex;
  align-items: center;
  gap: 12px;
}

.section-label {
  font-size: 11px;
  letter-spacing: 1.8px;
  text-transform: uppercase;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(202, 190, 176, 0.72), transparent);
}

.invite-card h3 {
  margin-top: 14px;
  color: #312922;
  font-size: 22px;
}

.code-box {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 16px;
  padding: 16px;
  border-radius: 18px;
  background: #fbf8f2;
}

.code-box strong {
  color: #8b6d3a;
  font-size: 28px;
}

.action-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
  margin-top: 14px;
}

.light-btn,
.green-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 44px;
  border-radius: 999px;
  font-weight: 700;
}

.light-btn {
  border: 1px solid #e7dfd4;
  background: #fff;
  color: #786d61;
}

.green-btn {
  border: 0;
  background: linear-gradient(180deg, #cfb384 0%, #b0905a 100%);
  color: #1d231e;
}

.switch-bar,
.filter-row {
  display: grid;
  gap: 10px;
  margin-top: 16px;
}

.switch-bar {
  grid-template-columns: 1fr 1fr;
  padding: 5px;
  border: 1px solid rgba(231, 222, 210, 0.9);
  border-radius: 999px;
  background: rgba(255, 251, 246, 0.9);
}

.switch-bar button,
.filter-row button {
  height: 38px;
  border: 0;
  border-radius: 999px;
  background: transparent;
  color: #a79b8e;
  font-weight: 600;
}

.switch-bar button.active,
.filter-row button.active {
  background: #fff;
  color: #312922;
  box-shadow: 0 6px 16px rgba(16, 24, 40, 0.06);
}

.filter-row {
  grid-template-columns: repeat(4, 1fr);
}
</style>
