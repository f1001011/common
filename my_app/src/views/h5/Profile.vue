<template>
  <div class="profile-page">
    <section class="profile-hero">
      <div class="hero-glow hero-glow-left"></div>
      <div class="hero-glow hero-glow-right"></div>

      <article class="identity-card">
        <div class="identity-top">
          <div class="avatar"></div>
          <div class="identity-copy">
            <strong>3123658001</strong>
            <span>Nuevo</span>
          </div>
        </div>

        <div class="invite-chip">
          <span>Código de invitación:</span>
          <strong>MZV5AVDK</strong>
        </div>
      </article>

      <article class="balance-card">
        <span>SALDO DISPONIBLE</span>
        <strong>$ 3.000</strong>
        <div class="balance-row">
          <span>Saldo congelado</span>
          <strong>$ 0</strong>
        </div>
      </article>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <button class="download-card">
          <div class="download-icon"><Smartphone :size="18" /></div>
          <div class="download-copy">
            <strong>Descargar App</strong>
            <span>Mejor experiencia en tu dispositivo</span>
          </div>
          <ChevronRight :size="18" />
        </button>

        <div class="menu-list">
          <button class="menu-card" @click="router.push({ name: 'Investments' })">
            <div class="menu-icon icon-gold"><LineChart :size="18" /></div>
            <div class="menu-copy">
              <strong>Mis inversiones</strong>
              <span>Revisa activos, rendimiento y estado de tu cartera</span>
            </div>
            <ChevronRight :size="18" />
          </button>

          <button class="menu-card" @click="openRecord('recharge')">
            <div class="menu-icon icon-green"><History :size="18" /></div>
            <div class="menu-copy">
              <strong>Historial de recargas</strong>
              <span>Consulta cada entrada de capital en un solo lugar</span>
            </div>
            <ChevronRight :size="18" />
          </button>

          <button class="menu-card" @click="openRecord('withdraw')">
            <div class="menu-icon icon-green"><Wallet :size="18" /></div>
            <div class="menu-copy">
              <strong>Historial de retiros</strong>
              <span>Supervisa salidas, estados y solicitudes recientes</span>
            </div>
            <ChevronRight :size="18" />
          </button>

          <button class="menu-card" @click="openRecord('transactions')">
            <div class="menu-icon icon-green"><ReceiptText :size="18" /></div>
            <div class="menu-copy">
              <strong>Transacciones</strong>
              <span>Accede a todos los movimientos consolidados</span>
            </div>
            <ChevronRight :size="18" />
          </button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ChevronRight, History, LineChart, ReceiptText, Smartphone, Wallet } from 'lucide-vue-next'

const router = useRouter()

const openRecord = (type: string) => {
  router.push({ name: 'RecordHistory', params: { type } })
}
</script>

<style scoped>
.profile-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #102219 0 238px, #f4efe6 238px 100%);
}

.profile-hero {
  position: relative;
  padding: 18px 18px 32px;
  color: #f6f0e5;
}

.hero-glow {
  position: absolute;
  border-radius: 50%;
  filter: blur(52px);
}

.hero-glow-left {
  top: -24px;
  left: -26px;
  width: 126px;
  height: 126px;
  background: rgba(143, 167, 125, 0.12);
}

.hero-glow-right {
  top: 72px;
  right: -16px;
  width: 112px;
  height: 112px;
  background: rgba(195, 159, 96, 0.14);
}

.identity-card,
.balance-card,
.download-card,
.menu-card {
  position: relative;
  z-index: 1;
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.identity-card {
  padding: 18px;
  background: rgba(255, 252, 248, 0.98);
  color: #312922;
}

.identity-top {
  display: flex;
  align-items: center;
  gap: 14px;
}

.avatar {
  width: 66px;
  height: 66px;
  border: 3px solid rgba(255, 255, 255, 0.9);
  border-radius: 50%;
  background:
    radial-gradient(circle at 50% 36%, #ffffff 0 24%, transparent 25%),
    radial-gradient(circle at 50% 75%, #2d2d2d 0 18%, transparent 19%),
    linear-gradient(180deg, #f8f8f8 0%, #dddddd 100%);
}

.identity-copy strong {
  display: block;
  font-size: 26px;
}

.identity-copy span {
  display: inline-flex;
  margin-top: 8px;
  padding: 4px 10px;
  border-radius: 999px;
  background: #f3f0ea;
  color: #a79b8e;
  font-size: 12px;
}

.invite-chip {
  display: flex;
  justify-content: space-between;
  margin-top: 18px;
  padding: 14px 16px;
  border-radius: 18px;
  background: #fbf8f2;
}

.invite-chip span {
  color: #a79b8e;
}

.invite-chip strong {
  color: #8b6d3a;
}

.balance-card {
  margin-top: 16px;
  padding: 18px;
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 34%),
    linear-gradient(180deg, #1f241e 0%, #121612 100%);
  border-color: rgba(31, 36, 30, 0.84);
}

.balance-card span {
  color: rgba(246, 240, 229, 0.46);
  font-size: 11px;
  letter-spacing: 2px;
  text-transform: uppercase;
}

.balance-card > strong {
  display: block;
  margin-top: 10px;
  color: #f6f0e5;
  font-size: 42px;
}

.balance-row {
  display: flex;
  justify-content: space-between;
  margin-top: 18px;
  padding-top: 14px;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.balance-row strong {
  color: #f6f0e5;
}

.content-sheet {
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.download-card {
  width: 100%;
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 12px;
  align-items: center;
  padding: 16px;
  border-color: rgba(31, 36, 30, 0.84);
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 34%),
    linear-gradient(180deg, #1f241e 0%, #121612 100%);
  color: #f6f0e5;
}

.download-icon {
  display: inline-flex;
  width: 40px;
  height: 40px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: rgba(207, 179, 132, 0.14);
  color: #d9c190;
}

.download-copy {
  text-align: left;
}

.download-copy strong {
  display: block;
  font-size: 18px;
}

.download-copy span {
  display: block;
  margin-top: 4px;
  color: rgba(246, 240, 229, 0.6);
}

.menu-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-top: 16px;
}

.menu-card {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 12px;
  align-items: center;
  padding: 16px;
  background: rgba(255, 252, 248, 0.98);
}

.menu-icon {
  display: inline-flex;
  width: 38px;
  height: 38px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
}

.icon-gold {
  background: rgba(176, 144, 90, 0.14);
  color: #8b6d3a;
}

.icon-green {
  background: rgba(92, 131, 103, 0.14);
  color: #5f7f66;
}

.menu-copy {
  text-align: left;
}

.menu-copy strong {
  display: block;
  color: #312922;
  font-size: 18px;
}

.menu-copy span {
  display: block;
  margin-top: 6px;
  color: #8b8175;
  line-height: 1.65;
}
</style>
