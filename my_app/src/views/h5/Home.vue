<template>
  <div class="home-page">
    <section class="hero">
      <div class="hero-grid"></div>
      <div class="hero-glow hero-glow-left"></div>
      <div class="hero-glow hero-glow-right"></div>

      <header class="hero-header">
        <div class="brand">
          <strong>Lendlease</strong>
          <span>PRIVATE REAL ESTATE INCOME</span>
        </div>

        <div class="header-actions">
          <button class="icon-btn" aria-label="notifications">
            <Bell :size="16" />
          </button>
          <button class="icon-btn" aria-label="profile" @click="router.push({ name: 'Profile' })">
            <User :size="16" />
          </button>
        </div>
      </header>

      <div class="hero-copy">
        <h1>Buenas noches</h1>

        <div class="balance-title">
          <span>SALDO DISPONIBLE</span>
          <Eye :size="14" />
        </div>

        <div class="balance-value">
          <small>$</small>
          <strong>3.000</strong>
        </div>

        <div class="balance-stats">
          <article>
            <span>SALDO CONGELADO</span>
            <strong>$0</strong>
          </article>
          <article>
            <span>GANANCIAS DE HOY</span>
            <strong>0</strong>
          </article>
          <article>
            <span>GANANCIAS TOTALES</span>
            <strong>0</strong>
          </article>
        </div>
      </div>

      <div class="hero-actions">
        <button class="primary-btn">
          <Plus :size="18" />
          <span>Recargar</span>
        </button>
        <button class="secondary-btn">
          <ArrowUp :size="18" />
          <span>Retirar</span>
        </button>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <section class="section">
          <div class="section-head">
            <span class="section-label">MI PORTAFOLIO</span>
            <div class="section-line"></div>
          </div>

          <article class="editorial-card">
            <div class="editorial-card-inner">
              <span class="editorial-mark">Selección destacada</span>
              <h2>Descubre tu próxima inversión inmobiliaria</h2>
              <button class="text-link" @click="router.push({ name: 'Products' })">
                Explorar productos
                <ChevronRight :size="16" />
              </button>
            </div>
          </article>
        </section>

        <section class="section section-tight">
          <div class="module-grid">
            <article class="module-card module-card-light">
              <div class="module-head">
                <div class="module-icon icon-gold">
                  <CalendarDays :size="18" />
                </div>
                <span>Firma</span>
              </div>

              <h3>Firma diaria</h3>
              <p>Activa tu beneficio diario con una entrada directa y sin fricción.</p>
              <button class="module-btn">Firmar +100</button>
            </article>

            <article class="module-card module-card-dark" @click="router.push({ name: 'Team' })">
              <div class="module-head">
                <div class="module-icon icon-soft">
                  <Users :size="18" />
                </div>
                <span>Mi Equipo</span>
              </div>

              <h3>Invita y gana comisión</h3>
              <p>Abre una segunda capa de rendimiento con referidos activos.</p>
              <button class="module-link">
                Invitar ahora
                <ArrowRight :size="15" />
              </button>
            </article>
          </div>
        </section>

        <section class="section">
          <div class="section-head">
            <span class="section-label">PROPIEDADES DESTACADAS</span>
            <div class="section-line"></div>
          </div>

          <div class="property-track">
            <article
              v-for="item in featuredProducts"
              :key="item.id"
              class="property-card"
              @click="router.push({ name: 'ProductDetail', params: { id: item.id } })"
            >
              <div class="property-cover" :style="{ background: item.cover }">
                <div class="property-image-overlay"></div>
                <div class="property-copy">
                  <strong>{{ item.name }}</strong>
                  <div class="property-meta">
                    <span>$ {{ item.dailyIncome }}/día</span>
                    <span>{{ item.days }} días</span>
                  </div>
                </div>
              </div>

              <div class="property-bottom">
                <div class="property-price">$ {{ item.price }}</div>
              </div>
            </article>
          </div>

          <div class="dots">
            <span class="dot active"></span>
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
          </div>
        </section>
      </div>
    </section>

    <transition name="fade">
      <div v-if="showPopup" class="popup-mask" @click.self="showPopup = false">
        <div class="popup-card">
          <button class="popup-close" @click="showPopup = false">×</button>

          <div class="popup-header">
            <div class="popup-badge">
              <Bell :size="16" />
            </div>
            <h3>Bienvenido a Lendlease</h3>
          </div>

          <div class="popup-body">
            <p>
              La visión de Lendlease comenzó en 1957, desde sus humildes inicios hasta proyectos emblemáticos en todo el mundo.
            </p>

            <article v-for="section in popupSections" :key="section.title" class="popup-section">
              <strong>{{ section.title }}</strong>
              <ul>
                <li v-for="item in section.items" :key="item">{{ item }}</li>
              </ul>
            </article>
          </div>

          <button class="popup-primary" @click="showPopup = false">Saber</button>
        </div>
      </div>
    </transition>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'
import {
  ArrowRight,
  ArrowUp,
  Bell,
  CalendarDays,
  ChevronRight,
  Eye,
  Plus,
  User,
  Users
} from 'lucide-vue-next'
import { investmentProducts, type InvestmentProduct } from '@/views/h5/data'

const router = useRouter()
const showPopup = ref(true)

const featuredProducts = computed<InvestmentProduct[]>(() => {
  const order = [4, 2, 1]
  return order.reduce<InvestmentProduct[]>((result, id) => {
    const target = investmentProducts.find(item => item.id === id)
    if (target) result.push(target)
    return result
  }, [])
})

const popupSections = [
  {
    title: '1. Bono de Registro: ¡3000 COP solo por registrarte!',
    items: ['Al registrarte, recibe 3000 COP y 100 COP adicionales cada día solo por iniciar sesión.']
  },
  {
    title: '2. Programa SVIP: ¡Recompensas diarias para ti!',
    items: ['Compra 2 productos iguales y gana entre 288 y 15,888 COP diarios.', '¡Cuanto más compres, más ganarás!']
  },
  {
    title: '3. Recompensas del Evento de Bonificación Diaria',
    items: ['Cada día se agregarán 10,000 COP al fondo de bonificación.', 'Invita a tus amigos y gana entre 388 y 1288 COP diariamente.']
  },
  {
    title: '4. Bono Semanal de Equipo: Gana hasta 18,888 COP por semana',
    items: ['Con tu equipo, puedes ganar entre 3888 y 18,888 COP cada semana.', '¡Lidera a tu equipo y gana aún más!']
  }
]
</script>

<style scoped>
.home-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #082615 0 386px, #f7f2e9 386px 100%);
}

.hero {
  position: relative;
  overflow: hidden;
  padding: 18px 18px 30px;
  color: #f7f2e8;
  background:
    radial-gradient(circle at top left, rgba(35, 131, 81, 0.22), transparent 28%),
    linear-gradient(180deg, #052c18 0%, #072d19 100%);
}

.hero-grid,
.hero-glow,
.hero-header,
.hero-copy,
.hero-actions {
  position: relative;
  z-index: 1;
}

.hero-grid {
  position: absolute;
  inset: 0;
  opacity: 0.06;
  background-image:
    linear-gradient(rgba(255, 255, 255, 0.18) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.18) 1px, transparent 1px);
  background-size: 20px 20px;
  mask-image: linear-gradient(180deg, rgba(0, 0, 0, 0.9), transparent 90%);
}

.hero-glow {
  position: absolute;
  border-radius: 50%;
  filter: blur(56px);
  pointer-events: none;
}

.hero-glow-left {
  top: -36px;
  left: -42px;
  width: 160px;
  height: 160px;
  background: rgba(39, 155, 89, 0.18);
}

.hero-glow-right {
  right: -20px;
  bottom: 28px;
  width: 128px;
  height: 128px;
  background: rgba(193, 157, 89, 0.16);
}

.hero-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.brand {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.brand strong {
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 28px;
  font-weight: 700;
  letter-spacing: -0.6px;
}

.brand span {
  color: rgba(247, 242, 232, 0.42);
  font-size: 10px;
  letter-spacing: 1.7px;
}

.header-actions {
  display: flex;
  gap: 10px;
}

.icon-btn {
  display: inline-flex;
  width: 36px;
  height: 36px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.06);
  color: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(12px);
}

.hero-copy {
  margin-top: 30px;
}

.hero-copy h1 {
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 44px;
  line-height: 1;
  letter-spacing: -1.4px;
}

.balance-title {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  margin-top: 22px;
  color: rgba(247, 242, 232, 0.42);
  font-size: 11px;
  letter-spacing: 2.2px;
  text-transform: uppercase;
}

.balance-value {
  display: flex;
  align-items: baseline;
  gap: 6px;
  margin-top: 16px;
}

.balance-value small {
  color: rgba(247, 242, 232, 0.56);
  font-size: 24px;
}

.balance-value strong {
  font-size: 64px;
  line-height: 0.92;
  letter-spacing: -2px;
  font-weight: 500;
}

.balance-stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 12px;
  margin-top: 28px;
  padding-top: 22px;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.balance-stats span {
  display: block;
  min-height: 30px;
  color: rgba(247, 242, 232, 0.38);
  font-size: 11px;
  font-weight: 700;
  line-height: 1.35;
  letter-spacing: 1.3px;
}

.balance-stats strong {
  display: block;
  margin-top: 10px;
  font-size: 30px;
  line-height: 1;
}

.hero-actions {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 14px;
  margin-top: 28px;
  padding-top: 18px;
  border-top: 1px solid rgba(255, 255, 255, 0.06);
}

.primary-btn,
.secondary-btn,
.module-btn,
.module-link,
.text-link,
.popup-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  border-radius: 999px;
  font-weight: 700;
}

.primary-btn,
.secondary-btn {
  height: 50px;
  font-size: 18px;
}

.primary-btn {
  border: 0;
  background: linear-gradient(180deg, #0f8749 0%, #0c6d3d 100%);
  color: #f6f1e8;
  box-shadow: 0 14px 34px rgba(10, 105, 58, 0.3);
}

.secondary-btn {
  border: 1px solid rgba(186, 150, 90, 0.28);
  background: transparent;
  color: #d7ba7d;
}

.content-sheet {
  position: relative;
  z-index: 1;
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #f8f5ee 0%, #f5f0e7 100%);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.74);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.section + .section {
  margin-top: 22px;
}

.section-tight {
  margin-top: 14px !important;
}

.section-head {
  display: flex;
  align-items: center;
  gap: 12px;
}

.section-label {
  color: #c0b5a8;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 2.2px;
  text-transform: uppercase;
}

.section-line {
  height: 1px;
  flex: 1;
  background: linear-gradient(90deg, rgba(202, 190, 176, 0.82), transparent);
}

.editorial-card,
.module-card,
.property-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 26px;
  background: rgba(255, 253, 249, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.editorial-card {
  margin-top: 14px;
  padding: 12px;
}

.editorial-card-inner {
  padding: 26px 20px;
  border-radius: 22px;
  background: linear-gradient(180deg, #fffdfa 0%, #fbf6ef 100%);
}

.editorial-mark {
  display: inline-flex;
  color: #8f7a56;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 1.4px;
  text-transform: uppercase;
}

.editorial-card h2 {
  margin-top: 10px;
  color: #2b2721;
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 28px;
  line-height: 1.2;
  letter-spacing: -0.8px;
}

.text-link {
  margin-top: 22px;
  padding: 0;
  border: 0;
  background: transparent;
  color: #19804f;
  font-size: 18px;
  justify-content: flex-start;
}

.module-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
}

.module-card {
  min-height: 216px;
  padding: 18px 16px;
}

.module-card-light {
  background: linear-gradient(180deg, #fffdfa 0%, #faf5ee 100%);
}

.module-card-dark {
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 34%),
    linear-gradient(180deg, #112517 0%, #08170f 100%);
  border-color: rgba(20, 42, 29, 0.88);
  color: #f7f2e8;
}

.module-head {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 16px;
  font-weight: 700;
}

.module-icon {
  display: inline-flex;
  width: 32px;
  height: 32px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
}

.icon-gold {
  background: rgba(176, 144, 90, 0.16);
  color: #9c7b40;
}

.icon-soft {
  background: rgba(92, 131, 103, 0.18);
  color: #bfd4c4;
}

.module-card h3 {
  margin-top: 18px;
  font-size: 21px;
  line-height: 1.3;
}

.module-card p {
  margin-top: 10px;
  line-height: 1.72;
  color: inherit;
  opacity: 0.68;
}

.module-btn {
  width: 100%;
  height: 46px;
  margin-top: 22px;
  border: 0;
  background: linear-gradient(180deg, #0f8749 0%, #0b6b3b 100%);
  color: #fff;
  font-size: 16px;
}

.module-link {
  margin-top: 22px;
  padding: 0;
  border: 0;
  background: transparent;
  color: #d7ba7d;
  font-size: 16px;
  justify-content: flex-start;
}

.property-track {
  display: grid;
  grid-auto-flow: column;
  grid-auto-columns: 78%;
  gap: 14px;
  margin-top: 16px;
  overflow-x: auto;
  scrollbar-width: none;
}

.property-track::-webkit-scrollbar {
  display: none;
}

.property-card {
  overflow: hidden;
}

.property-cover {
  position: relative;
  height: 214px;
  border-radius: 26px;
  overflow: hidden;
}

.property-image-overlay {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(180deg, rgba(18, 24, 33, 0.06) 0%, rgba(18, 24, 33, 0.72) 100%),
    radial-gradient(circle at top right, rgba(255, 255, 255, 0.12), transparent 28%);
}

.property-copy {
  position: absolute;
  right: 16px;
  bottom: 16px;
  left: 16px;
  z-index: 1;
  color: #fff;
}

.property-copy strong {
  display: block;
  font-size: 28px;
  line-height: 1;
}

.property-meta {
  display: flex;
  gap: 12px;
  margin-top: 8px;
  font-size: 16px;
}

.property-meta span:first-child {
  color: #ddc590;
  font-weight: 700;
}

.property-meta span:last-child {
  color: rgba(255, 255, 255, 0.82);
}

.property-bottom {
  padding: 12px 4px 4px;
}

.property-price {
  color: #312922;
  font-size: 18px;
  font-weight: 700;
}

.dots {
  display: flex;
  justify-content: center;
  gap: 6px;
  margin-top: 16px;
}

.dot {
  width: 6px;
  height: 6px;
  border-radius: 999px;
  background: #d7cfc6;
}

.dot.active {
  width: 18px;
  background: #2f281f;
}

.popup-mask {
  position: fixed;
  inset: 0;
  z-index: 120;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background: rgba(5, 17, 11, 0.6);
  backdrop-filter: blur(8px);
}

.popup-card {
  position: relative;
  width: min(100%, 340px);
  padding: 18px 16px 16px;
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: linear-gradient(180deg, #fffefd 0%, #f5efe6 100%);
  box-shadow: 0 28px 70px rgba(7, 17, 12, 0.32);
}

.popup-close {
  position: absolute;
  top: 14px;
  right: 14px;
  width: 30px;
  height: 30px;
  border: 0;
  border-radius: 50%;
  background: #efede8;
  color: #7c7266;
  font-size: 20px;
}

.popup-header {
  display: flex;
  align-items: center;
  gap: 10px;
  padding-right: 34px;
}

.popup-badge {
  display: inline-flex;
  width: 28px;
  height: 28px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: linear-gradient(180deg, #159756 0%, #0d7d46 100%);
  color: #fff;
}

.popup-header h3 {
  color: #2a251f;
  font-size: 28px;
  line-height: 1.15;
  font-family: Georgia, 'Times New Roman', serif;
}

.popup-body {
  max-height: 52vh;
  margin-top: 14px;
  padding: 0 4px 0 0;
  overflow-y: auto;
  color: #85796b;
  line-height: 1.78;
}

.popup-section + .popup-section {
  margin-top: 14px;
}

.popup-section strong {
  display: block;
  color: #4c4236;
  font-size: 15px;
  line-height: 1.6;
}

.popup-section ul {
  margin: 6px 0 0;
  padding-left: 18px;
}

.popup-primary {
  width: 100%;
  height: 46px;
  margin-top: 18px;
  border: 0;
  background: linear-gradient(180deg, #12854b 0%, #0d6e3f 100%);
  color: #fff;
  font-size: 17px;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.18s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

@media (max-width: 380px) {
  .hero-copy h1 {
    font-size: 40px;
  }

  .balance-value strong {
    font-size: 58px;
  }

  .module-grid {
    grid-template-columns: 1fr;
  }

  .property-track {
    grid-auto-columns: 84%;
  }
}
</style>
