<template>
  <div class="record-page">
    <section class="top-hero">
      <div class="top-bar">
        <button class="icon-btn" @click="router.back()"><ChevronLeft :size="18" /></button>
        <div class="page-title">{{ currentTitle }}</div>
        <button class="icon-btn"><RotateCw :size="16" /></button>
      </div>
    </section>

    <section class="content-sheet">
      <div class="sheet-inner">
        <div class="tabs">
          <button class="active">Todos</button>
          <button>Pendiente</button>
          <button>Completado</button>
          <button>Cancelado</button>
        </div>

        <div class="empty-wrap">
          <History :size="56" />
          <strong>{{ emptyTitle }}</strong>
          <span>{{ emptyDesc }}</span>
          <button @click="goProducts">{{ actionText }}</button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ChevronLeft, History, RotateCw } from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()

const currentType = computed(() => String(route.params.type || 'recharge'))

const currentTitle = computed(() => {
  return {
    recharge: 'Historial de recargas',
    withdraw: 'Historial de retiros',
    transactions: 'Transacciones'
  }[currentType.value] || 'Historial'
})

const emptyTitle = computed(() => {
  return {
    recharge: 'Sin historial de recargas',
    withdraw: 'Sin historial de retiros',
    transactions: 'Sin transacciones'
  }[currentType.value] || 'Sin historial'
})

const emptyDesc = computed(() => {
  return {
    recharge: 'Realice una recarga para ver su historial aquí',
    withdraw: 'Los retiros aparecerán aquí después de enviar una solicitud',
    transactions: 'Todas sus transacciones se mostrarán en esta sección'
  }[currentType.value] || 'No hay datos disponibles'
})

const actionText = computed(() =>
  currentType.value === 'transactions' ? 'Explorar productos' : currentType.value === 'withdraw' ? 'Retirar' : 'Recargar'
)

const goProducts = () => {
  router.push({ name: 'Products' })
}
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

.tabs {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 8px;
}

.tabs button {
  height: 38px;
  border: 0;
  border-radius: 999px;
  background: rgba(255, 251, 246, 0.9);
  color: #a79b8e;
  font-weight: 600;
}

.tabs button.active {
  background: #fff;
  color: #312922;
  box-shadow: 0 6px 16px rgba(16, 24, 40, 0.06);
}

.empty-wrap {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  padding: 92px 24px 0;
  color: #c5bbad;
  text-align: center;
}

.empty-wrap strong {
  color: #7b7062;
  font-size: 28px;
}

.empty-wrap span {
  color: #b1a698;
  line-height: 1.72;
}

.empty-wrap button {
  width: 180px;
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
