<template>
  <div class="products-page">
    <section class="products-hero">
      <div class="hero-noise"></div>
      <div class="hero-glow hero-glow-left"></div>
      <div class="hero-glow hero-glow-right"></div>

      <div class="top-bar">
        <button class="icon-btn" @click="router.back()">
          <ChevronLeft :size="18" />
        </button>
      </div>

      <div class="hero-copy">
        <span class="eyebrow">Curated opportunities</span>
        <h1>Inversiones Inmobiliarias</h1>
        <p>Una selección organizada para comparar ticket, ingreso diario y ciclo con una lectura limpia y directa.</p>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <div class="switch-tabs">
          <button :class="{ active: activeTab === 'productos' }" @click="activeTab = 'productos'">Productos</button>
          <button :class="{ active: activeTab === 'financiar' }" @click="activeTab = 'financiar'">Financiar</button>
        </div>

        <article
          v-if="featuredItem"
          class="featured-card"
          @click="router.push({ name: 'ProductDetail', params: { id: featuredItem.id } })"
        >
          <div class="featured-cover" :style="{ background: featuredItem.cover }">
            <div class="featured-mask"></div>
            <span class="featured-chip">Editor’s pick</span>
            <div class="featured-copy">
              <strong>{{ featuredItem.name }}</strong>
              <p>Producto con estructura clara, lectura visual premium y un CTA de inversión directo.</p>
            </div>
          </div>

          <div class="featured-stats">
            <article>
              <span>Precio</span>
              <strong>$ {{ featuredItem.price }}</strong>
            </article>
            <article>
              <span>Ingreso diario</span>
              <strong class="success">+$ {{ featuredItem.dailyIncome }}</strong>
            </article>
            <article>
              <span>Ciclo</span>
              <strong>{{ featuredItem.days }} días</strong>
            </article>
          </div>

          <button class="featured-btn">Invertir ahora</button>
        </article>

        <div class="list-head">
          <span class="section-label">LISTADO DE ACTIVOS</span>
          <div class="section-line"></div>
        </div>

        <div class="product-list">
          <article
            v-for="item in restItems"
            :key="item.id"
            class="product-card"
            @click="router.push({ name: 'ProductDetail', params: { id: item.id } })"
          >
            <div class="product-cover" :style="{ background: item.cover }">
              <div class="product-mask"></div>
              <div class="product-copy">
                <strong>{{ item.name }}</strong>
                <div class="product-cycle">{{ item.days }} días</div>
              </div>
            </div>

            <div class="product-body">
              <div class="metric-row">
                <div>
                  <span>Precio</span>
                  <strong>$ {{ item.price }}</strong>
                </div>
                <div>
                  <span>Ingreso diario</span>
                  <strong class="success">+$ {{ item.dailyIncome }}</strong>
                </div>
                <div>
                  <span>Retorno</span>
                  <strong>$ {{ item.maturityAmount }}</strong>
                </div>
              </div>

              <div class="product-footer">
                <span>Capital +收益结构清晰，适合移动端快速阅读</span>
                <button>Ver detalle</button>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'
import { ChevronLeft } from 'lucide-vue-next'
import { investmentProducts } from '@/views/h5/data'

const router = useRouter()
const activeTab = ref<'productos' | 'financiar'>('productos')

const displayList = computed(() => {
  if (activeTab.value === 'productos') {
    return investmentProducts.slice(2)
  }
  return investmentProducts.slice(0, 2)
})

const featuredItem = computed(() => displayList.value[0])
const restItems = computed(() => displayList.value.slice(1))
</script>

<style scoped>
.products-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #102219 0 254px, #f4efe6 254px 100%);
}

.products-hero {
  position: relative;
  overflow: hidden;
  padding: 16px 18px 30px;
  color: #f6f0e5;
}

.hero-noise {
  position: absolute;
  inset: 0;
  opacity: 0.05;
  background-image:
    linear-gradient(rgba(255, 255, 255, 0.16) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.16) 1px, transparent 1px);
  background-size: 22px 22px;
  mask-image: linear-gradient(180deg, rgba(0, 0, 0, 0.75), transparent 84%);
}

.hero-glow {
  position: absolute;
  border-radius: 50%;
  filter: blur(52px);
}

.hero-glow-left {
  top: -28px;
  left: -36px;
  width: 140px;
  height: 140px;
  background: rgba(143, 167, 125, 0.12);
}

.hero-glow-right {
  top: 70px;
  right: -18px;
  width: 110px;
  height: 110px;
  background: rgba(195, 159, 96, 0.14);
}

.top-bar,
.hero-copy {
  position: relative;
  z-index: 1;
}

.icon-btn {
  display: inline-flex;
  width: 36px;
  height: 36px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.05);
  color: rgba(255, 255, 255, 0.72);
  backdrop-filter: blur(10px);
}

.hero-copy {
  margin-top: 24px;
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
  max-width: 260px;
  margin-top: 16px;
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 40px;
  line-height: 0.98;
  letter-spacing: -1.4px;
}

.hero-copy p {
  max-width: 320px;
  margin-top: 12px;
  color: rgba(246, 240, 229, 0.54);
  line-height: 1.72;
}

.content-sheet {
  position: relative;
  z-index: 1;
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.64);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.switch-tabs {
  display: inline-grid;
  grid-template-columns: 1fr 1fr;
  padding: 5px;
  border: 1px solid rgba(231, 222, 210, 0.9);
  border-radius: 999px;
  background: rgba(255, 251, 246, 0.9);
}

.switch-tabs button {
  min-width: 112px;
  height: 38px;
  border: 0;
  border-radius: 999px;
  background: transparent;
  color: #b0a496;
  font-size: 14px;
  font-weight: 600;
}

.switch-tabs button.active {
  background: #fff;
  color: #332b23;
  box-shadow: 0 6px 16px rgba(16, 24, 40, 0.06);
}

.featured-card,
.product-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 248, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.featured-card {
  overflow: hidden;
  margin-top: 18px;
}

.featured-cover {
  position: relative;
  height: 228px;
}

.featured-mask {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, rgba(18, 24, 33, 0.08) 0%, rgba(18, 24, 33, 0.68) 100%);
}

.featured-chip,
.featured-copy {
  position: absolute;
  z-index: 1;
}

.featured-chip {
  top: 16px;
  left: 16px;
  padding: 6px 10px;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.1);
  color: rgba(255, 255, 255, 0.88);
  font-size: 10px;
  letter-spacing: 1.2px;
  text-transform: uppercase;
}

.featured-copy {
  right: 18px;
  bottom: 18px;
  left: 18px;
  color: #fff;
}

.featured-copy strong {
  display: block;
  font-size: 30px;
  line-height: 1;
}

.featured-copy p {
  max-width: 250px;
  margin-top: 10px;
  color: rgba(255, 255, 255, 0.74);
  line-height: 1.65;
}

.featured-stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  padding: 16px 16px 10px;
}

.featured-stats span,
.metric-row span,
.section-label {
  color: #b1a698;
  font-size: 11px;
  letter-spacing: 1.4px;
  text-transform: uppercase;
}

.featured-stats strong,
.metric-row strong {
  display: block;
  margin-top: 8px;
  color: #312922;
  font-size: 18px;
}

.success {
  color: #8b6d3a !important;
}

.featured-btn {
  width: calc(100% - 32px);
  height: 46px;
  margin: 0 16px 16px;
  border: 0;
  border-radius: 999px;
  background: linear-gradient(180deg, #cfb384 0%, #b0905a 100%);
  color: #1e241f;
  font-size: 16px;
  font-weight: 700;
}

.list-head {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-top: 24px;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(202, 190, 176, 0.72), transparent);
}

.product-list {
  display: flex;
  flex-direction: column;
  gap: 14px;
  margin-top: 14px;
}

.product-card {
  overflow: hidden;
}

.product-cover {
  position: relative;
  height: 158px;
}

.product-mask {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, rgba(18, 24, 33, 0.08) 0%, rgba(18, 24, 33, 0.6) 100%);
}

.product-copy {
  position: absolute;
  right: 16px;
  bottom: 16px;
  left: 16px;
  z-index: 1;
  color: #fff;
}

.product-copy strong {
  display: block;
  font-size: 28px;
  line-height: 1;
}

.product-cycle {
  margin-top: 8px;
  color: rgba(255, 255, 255, 0.82);
}

.product-body {
  padding: 16px;
}

.metric-row {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}

.product-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 10px;
  margin-top: 16px;
  padding-top: 14px;
  border-top: 1px solid rgba(232, 224, 213, 0.92);
}

.product-footer span {
  color: #8a8073;
  line-height: 1.65;
}

.product-footer button {
  min-width: 96px;
  height: 34px;
  border: 0;
  border-radius: 999px;
  background: rgba(176, 144, 90, 0.12);
  color: #886e41;
  font-weight: 700;
}

@media (max-width: 380px) {
  .hero-copy h1 {
    font-size: 36px;
  }

  .featured-stats,
  .metric-row {
    grid-template-columns: 1fr 1fr;
  }

  .product-footer {
    flex-direction: column;
    align-items: flex-start;
  }
}
</style>
