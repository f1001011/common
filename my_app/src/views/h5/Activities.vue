<template>
  <div class="activities-page">
    <section class="activities-hero">
      <div class="hero-noise"></div>
      <div class="hero-glow hero-glow-left"></div>
      <div class="hero-glow hero-glow-right"></div>

      <div class="hero-copy">
        <span class="eyebrow">Rewards & campaigns</span>
        <h1>Centro de Actividades</h1>
        <p>Una capa de crecimiento pensada para retención, invitación y beneficio diario, con lectura clara y orden editorial.</p>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <article class="hero-card" @click="router.push({ name: 'VipRewards' })">
          <div class="hero-card-icon">
            <Crown :size="22" />
          </div>
          <div class="hero-card-copy">
            <span class="card-label">Core rewards</span>
            <strong>SVIP Recompensas Diarias</strong>
            <p>Compra productos para desbloquear recompensa diaria y construir un sistema de permanencia visible.</p>
          </div>
          <ChevronRight :size="18" />
        </article>

        <div class="list-head">
          <span class="section-label">MÓDULOS ACTIVOS</span>
          <div class="section-line"></div>
        </div>

        <div class="module-list">
          <article class="module-card">
            <div class="module-head">
              <div class="module-icon icon-green">
                <CalendarRange :size="18" />
              </div>
              <div class="module-copy">
                <strong>Salario semanal</strong>
                <span>Recompensa semanal basada en recarga acumulada</span>
              </div>
              <ChevronRight :size="18" />
            </div>

            <button class="module-btn">Participar</button>
          </article>

          <article class="module-card" @click="router.push({ name: 'PrizePool' })">
            <div class="module-head">
              <div class="module-icon icon-gold">
                <Trophy :size="18" />
              </div>
              <div class="module-copy">
                <strong>Premio acumulado</strong>
                <span>Invita amigos para participar en el premio acumulado diario</span>
              </div>
              <ChevronRight :size="18" />
            </div>

            <button class="module-btn">Participar</button>
          </article>

          <article class="module-card" @click="router.push({ name: 'LotteryWheel' })">
            <div class="module-head">
              <div class="module-icon icon-soft">
                <BadgeHelp :size="18" />
              </div>
              <div class="module-copy">
                <strong>Ruleta de la suerte</strong>
                <span>Gira la ruleta para obtener premios e incrementar participación</span>
              </div>
              <ChevronRight :size="18" />
            </div>

            <button class="module-btn">Participar</button>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { BadgeHelp, CalendarRange, ChevronRight, Crown, Trophy } from 'lucide-vue-next'

const router = useRouter()
</script>

<style scoped>
.activities-page {
  min-height: calc(100vh - 24px);
  background: linear-gradient(180deg, #102219 0 248px, #f4efe6 248px 100%);
}

.activities-hero {
  position: relative;
  overflow: hidden;
  padding: 20px 18px 34px;
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
  top: -26px;
  left: -30px;
  width: 130px;
  height: 130px;
  background: rgba(143, 167, 125, 0.12);
}

.hero-glow-right {
  top: 70px;
  right: -20px;
  width: 110px;
  height: 110px;
  background: rgba(195, 159, 96, 0.12);
}

.hero-copy {
  position: relative;
  z-index: 1;
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

.hero-copy p {
  max-width: 320px;
  margin-top: 12px;
  color: rgba(246, 240, 229, 0.54);
  line-height: 1.72;
}

.content-sheet {
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.64);
}

.sheet-inner {
  padding: 18px 18px 112px;
}

.hero-card,
.module-card {
  border: 1px solid rgba(234, 225, 214, 0.92);
  border-radius: 24px;
  background: rgba(255, 252, 248, 0.98);
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.hero-card {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 14px;
  align-items: center;
  padding: 18px 16px;
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 36%),
    linear-gradient(180deg, #1e231d 0%, #111510 100%);
  border-color: rgba(28, 32, 28, 0.84);
  color: #f6f0e5;
}

.hero-card-icon {
  display: inline-flex;
  width: 46px;
  height: 46px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: rgba(207, 179, 132, 0.14);
  color: #d9c190;
}

.hero-card-copy {
  display: flex;
  flex-direction: column;
}

.card-label,
.section-label {
  color: #b7aca0;
  font-size: 11px;
  letter-spacing: 1.7px;
  text-transform: uppercase;
}

.hero-card-copy strong {
  margin-top: 8px;
  font-size: 22px;
  line-height: 1.2;
}

.hero-card-copy p {
  margin-top: 8px;
  color: rgba(246, 240, 229, 0.62);
  line-height: 1.65;
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

.module-list {
  display: flex;
  flex-direction: column;
  gap: 14px;
  margin-top: 14px;
}

.module-card {
  padding: 18px 16px 16px;
}

.module-head {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 12px;
  align-items: start;
}

.module-icon {
  display: inline-flex;
  width: 38px;
  height: 38px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
}

.icon-green {
  background: rgba(92, 131, 103, 0.16);
  color: #5f7f66;
}

.icon-gold {
  background: rgba(176, 144, 90, 0.14);
  color: #9a7b44;
}

.icon-soft {
  background: rgba(129, 108, 156, 0.12);
  color: #7d689a;
}

.module-copy strong {
  display: block;
  color: #302821;
  font-size: 20px;
  line-height: 1.25;
}

.module-copy span {
  display: block;
  margin-top: 8px;
  color: #857b70;
  line-height: 1.68;
}

.module-btn {
  width: 100%;
  height: 42px;
  margin-top: 16px;
  border: 0;
  border-radius: 999px;
  background: linear-gradient(180deg, #cfb384 0%, #b0905a 100%);
  color: #1d231e;
  font-size: 15px;
  font-weight: 700;
}
</style>
