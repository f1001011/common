<template>
  <div class="detail-page">
    <section class="detail-hero" :style="{ background: currentProduct.cover }">
      <div class="hero-mask"></div>

      <div class="hero-top">
        <button class="icon-btn" @click="router.back()">
          <ChevronLeft :size="18" />
        </button>
        <button class="icon-btn">
          <Share2 :size="17" />
        </button>
      </div>

      <div class="hero-copy">
        <span class="hero-label">Curated property asset</span>
        <h1>{{ currentProduct.detailTitle }}</h1>
        <p>Un producto diseñado para mostrar con claridad precio de entrada, ingreso diario y retorno estructurado.</p>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <article class="summary-card">
          <div>
            <span>Precio</span>
            <strong>$ {{ currentProduct.price }}</strong>
          </div>
          <div>
            <span>Ingreso diario</span>
            <strong class="accent">+$ {{ currentProduct.dailyIncome }}</strong>
          </div>
          <div>
            <span>Ciclo</span>
            <strong>{{ currentProduct.days }} días</strong>
          </div>
        </article>

        <article class="return-card">
          <div class="card-head">
            <span class="section-label">RETORNO DE INVERSIÓN</span>
            <div class="section-line"></div>
          </div>

          <div class="return-grid">
            <div class="return-block">
              <span>Ingreso diario</span>
              <strong>$ {{ currentProduct.dailyIncome }}</strong>
              <small>x {{ currentProduct.days }} días</small>
            </div>

            <div class="return-block total">
              <span>Retorno total</span>
              <strong>$ {{ currentProduct.maturityAmount }}</strong>
              <small>acreditación diaria a saldo disponible</small>
            </div>
          </div>
        </article>

        <article class="detail-card">
          <div class="card-head">
            <span class="section-label">DETALLES</span>
            <div class="section-line"></div>
          </div>

          <p>{{ currentProduct.detailText }}</p>
        </article>
      </div>
    </section>

    <div class="bottom-bar">
      <div class="bottom-price">
        <span>PRECIO</span>
        <strong>$ {{ currentProduct.price }}</strong>
      </div>
      <button class="disabled-btn">Saldo insuficiente</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ChevronLeft, Share2 } from 'lucide-vue-next'
import { investmentProducts } from '@/views/h5/data'

const route = useRoute()
const router = useRouter()

const currentProduct = computed(() => {
  const currentId = Number(route.params.id || 0)
  return investmentProducts.find(item => item.id === currentId) ?? investmentProducts[0]
})
</script>

<style scoped>
.detail-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #102219 0 320px, #f4efe6 320px 100%);
}

.detail-hero {
  position: relative;
  min-height: 320px;
  padding: 16px 18px 40px;
}

.hero-mask {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(180deg, rgba(16, 24, 22, 0.22) 0%, rgba(16, 24, 22, 0.68) 100%),
    linear-gradient(180deg, rgba(16, 24, 22, 0.08) 0%, rgba(16, 24, 22, 0.12) 100%);
}

.hero-top,
.hero-copy {
  position: relative;
  z-index: 1;
}

.hero-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.icon-btn {
  display: inline-flex;
  width: 36px;
  height: 36px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.08);
  color: rgba(255, 255, 255, 0.86);
  backdrop-filter: blur(10px);
}

.hero-copy {
  margin-top: 156px;
  color: #fff;
}

.hero-label {
  display: inline-flex;
  padding: 6px 10px;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.08);
  color: rgba(255, 255, 255, 0.76);
  font-size: 10px;
  letter-spacing: 1.4px;
  text-transform: uppercase;
}

.hero-copy h1 {
  margin-top: 12px;
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 34px;
  line-height: 0.98;
  letter-spacing: -1.2px;
}

.hero-copy p {
  max-width: 280px;
  margin-top: 10px;
  color: rgba(255, 255, 255, 0.76);
  line-height: 1.7;
}

.content-sheet {
  position: relative;
  z-index: 1;
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.64);
}

.sheet-inner {
  padding: 18px 18px 132px;
}

.summary-card,
.return-card,
.detail-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 248, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.summary-card {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  margin-top: -52px;
  padding: 18px 16px;
}

.summary-card span,
.return-block span,
.bottom-price span,
.section-label {
  color: #b1a698;
  font-size: 11px;
  letter-spacing: 1.4px;
  text-transform: uppercase;
}

.summary-card strong,
.return-block strong,
.bottom-price strong {
  display: block;
  margin-top: 8px;
  color: #312922;
  font-size: 18px;
}

.accent {
  color: #8a6b38 !important;
}

.return-card,
.detail-card {
  margin-top: 16px;
  padding: 20px 18px;
}

.card-head {
  display: flex;
  align-items: center;
  gap: 12px;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(202, 190, 176, 0.72), transparent);
}

.return-grid {
  display: grid;
  gap: 14px;
  margin-top: 16px;
}

.return-block {
  padding: 16px;
  border: 1px solid rgba(234, 225, 214, 0.9);
  border-radius: 20px;
  background: linear-gradient(180deg, #fffdfa 0%, #f8f2e8 100%);
}

.return-block small {
  display: block;
  margin-top: 6px;
  color: #8d8377;
}

.return-block.total {
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 36%),
    linear-gradient(180deg, #fffdfa 0%, #f6efe4 100%);
}

.detail-card p {
  margin-top: 16px;
  color: #756b5f;
  line-height: 1.85;
}

.bottom-bar {
  position: fixed;
  right: max(18px, calc(50vw - 184px));
  bottom: 92px;
  left: max(18px, calc(50vw - 184px));
  z-index: 20;
  display: flex;
  gap: 12px;
  max-width: 368px;
}

.bottom-price {
  flex: 1;
  padding: 10px 2px;
}

.disabled-btn {
  flex: 1;
  height: 48px;
  border: 0;
  border-radius: 999px;
  background: linear-gradient(180deg, #efede8 0%, #e4e0d9 100%);
  color: #786d61;
  font-size: 16px;
  font-weight: 700;
  box-shadow: 0 12px 24px rgba(16, 24, 40, 0.08);
}

@media (max-width: 380px) {
  .hero-copy h1 {
    font-size: 30px;
  }

  .summary-card {
    grid-template-columns: 1fr 1fr;
  }
}
</style>
