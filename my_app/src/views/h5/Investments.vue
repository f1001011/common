<template>
  <div class="record-page">
    <section class="top-hero">
      <div class="top-bar">
        <button class="icon-btn" @click="router.back()"><ChevronLeft :size="18" /></button>
        <div class="page-title">Mis inversiones</div>
        <button class="icon-btn"><RotateCw :size="16" /></button>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <div class="switch-tabs">
          <button class="active">En progreso (0)</button>
          <button>Completado (0)</button>
        </div>

        <article class="summary-card">
          <span>Total ganado</span>
          <strong>$ 0</strong>

          <div class="summary-grid">
            <article>
              <span>Activas</span>
              <strong>0</strong>
            </article>
            <article>
              <span>Hoy</span>
              <strong>+0</strong>
            </article>
            <article>
              <span>Inversión</span>
              <strong>0</strong>
            </article>
          </div>
        </article>

        <div class="empty-wrap">
          <Briefcase :size="54" />
          <strong>No tiene inversiones activas</strong>
          <span>Explore nuestros productos para comenzar a invertir</span>
          <button @click="router.push({ name: 'Products' })">Explorar productos</button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { Briefcase, ChevronLeft, RotateCw } from 'lucide-vue-next'
import { useRouter } from 'vue-router'

const router = useRouter()
</script>

<style scoped>
.record-page {
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
}

.page-title {
  text-align: center;
  font-family: Georgia, 'Times New Roman', serif;
  font-size: 28px;
}

.content-sheet {
  border-radius: 32px 32px 0 0;
  background: linear-gradient(180deg, #faf6ee 0%, #f4efe6 100%);
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
  min-width: 126px;
  height: 38px;
  border: 0;
  border-radius: 999px;
  background: transparent;
  color: #a79b8e;
  font-weight: 600;
}

.switch-tabs button.active {
  background: #fff;
  color: #312922;
  box-shadow: 0 6px 16px rgba(16, 24, 40, 0.06);
}

.summary-card {
  margin-top: 18px;
  padding: 18px;
  border: 1px solid rgba(20, 87, 49, 0.84);
  border-radius: 24px;
  background:
    radial-gradient(circle at 100% 0%, rgba(176, 144, 90, 0.12), transparent 34%),
    linear-gradient(180deg, #1f6a3f 0%, #165c35 100%);
  color: #fff;
  box-shadow: 0 18px 34px rgba(18, 24, 38, 0.05);
}

.summary-card span {
  color: rgba(255, 255, 255, 0.7);
}

.summary-card > strong {
  display: block;
  margin-top: 8px;
  font-size: 40px;
}

.summary-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  margin-top: 18px;
  padding-top: 14px;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.summary-grid strong {
  display: block;
  margin-top: 6px;
  font-size: 20px;
}

.empty-wrap {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  padding: 82px 24px 0;
  color: #c5bbad;
  text-align: center;
}

.empty-wrap strong {
  color: #7b7062;
  font-size: 28px;
}

.empty-wrap span {
  line-height: 1.7;
}

.empty-wrap button {
  width: 220px;
  height: 44px;
  margin-top: 10px;
  border: 0;
  border-radius: 999px;
  background: linear-gradient(180deg, #cfb384 0%, #b0905a 100%);
  color: #1d231e;
  font-size: 16px;
  font-weight: 700;
}
</style>
