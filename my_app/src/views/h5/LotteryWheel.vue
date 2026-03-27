<template>
  <div class="lottery-page">
    <section class="top-hero">
      <div class="top-bar">
        <button class="icon-btn" @click="router.back()"><ChevronLeft :size="18" /></button>
        <div class="page-title">Ruleta de la suerte</div>
        <div class="ghost-space"></div>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <div class="chance-pill">
          <Star :size="16" />
          <span>Oportunidades: <strong>0</strong> / 5</span>
        </div>

        <div class="wheel-wrap">
          <div class="wheel-pointer"></div>
          <div class="wheel">
            <div v-for="(label, index) in labels" :key="label" class="wheel-segment" :style="segmentStyle(index)">
              <span>{{ label }}</span>
            </div>
            <button class="spin-btn">GIRAR</button>
          </div>
        </div>

        <article class="panel-card">
          <div class="card-head">
            <span class="section-label">HISTORIAL DE HOY</span>
            <div class="section-line"></div>
          </div>
          <p class="empty-text">Aún no has girado hoy</p>
        </article>

        <article class="panel-card">
          <div class="card-head">
            <span class="section-label">CÓMO OBTENER OPORTUNIDADES</span>
            <div class="section-line"></div>
          </div>

          <div class="rule-list">
            <div class="rule-item">
              <div class="rule-icon"><Crown :size="16" /></div>
              <div>
                <strong>Comprar un producto</strong>
                <span>Cada compra activa una oportunidad adicional</span>
              </div>
            </div>

            <div class="rule-item">
              <div class="rule-icon"><Wallet :size="16" /></div>
              <div>
                <strong>Recargar saldo</strong>
                <span>Las recargas válidas también incrementan tus intentos</span>
              </div>
            </div>
          </div>
        </article>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ChevronLeft, Crown, Star, Wallet } from 'lucide-vue-next'
import { useRouter } from 'vue-router'

const router = useRouter()

const labels = ['$ 50.000', '$ 100', '$ 300', '$ 500', 'Gracias', '$ 800', '$ 1.500', '$ 3.000', '$ 5.000', '$ 8.000']

const segmentStyle = (index: number) => ({
  transform: `rotate(${index * 36}deg) skewY(-54deg)`,
  background: index % 2 === 0 ? '#fbf6ef' : '#f1fbf5'
})
</script>

<style scoped>
.lottery-page {
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

.chance-pill,
.panel-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 248, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.chance-pill {
  display: flex;
  width: fit-content;
  align-items: center;
  gap: 8px;
  margin: 0 auto;
  padding: 10px 18px;
  border-radius: 999px;
  color: #6f6559;
}

.chance-pill strong {
  color: #8a6b38;
}

.wheel-wrap {
  position: relative;
  display: flex;
  justify-content: center;
  margin-top: 18px;
}

.wheel-pointer {
  position: absolute;
  top: 6px;
  z-index: 2;
  width: 0;
  height: 0;
  border-right: 12px solid transparent;
  border-left: 12px solid transparent;
  border-top: 22px solid #8a6b38;
}

.wheel {
  position: relative;
  width: 292px;
  height: 292px;
  border: 6px solid #e5efe8;
  border-radius: 50%;
  overflow: hidden;
  background: #fbfffc;
  box-shadow: 0 16px 30px rgba(18, 24, 38, 0.06);
}

.wheel-segment {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 50%;
  height: 50%;
  transform-origin: 0 0;
}

.wheel-segment span {
  position: absolute;
  top: 18px;
  left: 22px;
  color: #365244;
  font-size: 12px;
  font-weight: 700;
  transform: skewY(54deg) rotate(18deg);
}

.spin-btn {
  position: absolute;
  inset: 50%;
  width: 98px;
  height: 98px;
  border: 0;
  border-radius: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(180deg, #a7d1b2 0%, #6ba181 100%);
  color: #fff;
  font-size: 20px;
  font-weight: 700;
  box-shadow: 0 12px 24px rgba(54, 82, 68, 0.16);
  z-index: 1;
}

.panel-card {
  margin-top: 18px;
  padding: 18px;
}

.card-head {
  display: flex;
  align-items: center;
  gap: 12px;
}

.section-label {
  color: #b1a698;
  font-size: 11px;
  letter-spacing: 1.8px;
  text-transform: uppercase;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(202, 190, 176, 0.72), transparent);
}

.empty-text {
  margin-top: 18px;
  text-align: center;
  color: #918679;
}

.rule-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-top: 16px;
}

.rule-item {
  display: flex;
  gap: 12px;
  padding: 14px;
  border: 1px solid rgba(234, 225, 214, 0.86);
  border-radius: 18px;
  background: linear-gradient(180deg, #fffdfa 0%, #f7f1e8 100%);
}

.rule-icon {
  display: inline-flex;
  width: 34px;
  height: 34px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: rgba(176, 144, 90, 0.12);
  color: #8a6b38;
}

.rule-item strong {
  display: block;
  color: #322a22;
}

.rule-item span {
  display: block;
  margin-top: 4px;
  color: #887e72;
  line-height: 1.65;
}
</style>
