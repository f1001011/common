<template>
  <nav class="tabbar">
    <button
      v-for="item in tabs"
      :key="item.name"
      :class="['tab-item', { active: isActive(item.name) }]"
      @click="router.push({ name: item.name })"
    >
      <component :is="item.icon" :size="18" />
      <span>{{ item.label }}</span>
    </button>
  </nav>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { Gift, Briefcase, Home, User, Users } from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()

const tabs = computed(() => [
  { name: 'Home', label: 'Inicio', icon: Home },
  { name: 'Products', label: 'Productos', icon: Briefcase },
  { name: 'Activities', label: 'Actividades', icon: Gift },
  { name: 'Team', label: 'Equipo', icon: Users },
  { name: 'Profile', label: 'Perfil', icon: User }
])

const isActive = (name: string) => {
  if (name === 'Products') {
    return route.name === 'Products' || route.name === 'ProductDetail'
  }
  if (name === 'Activities') {
    return ['Activities', 'VipRewards', 'PrizePool', 'LotteryWheel'].includes(String(route.name))
  }
  if (name === 'Team') {
    return route.name === 'Team'
  }
  if (name === 'Profile') {
    return ['Profile', 'Investments', 'RecordHistory'].includes(String(route.name))
  }
  return route.name === name
}
</script>

<style scoped>
.tabbar {
  position: sticky;
  bottom: 0;
  z-index: 15;
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 2px;
  padding: 10px 14px calc(12px + env(safe-area-inset-bottom));
  background: transparent;
}

.tabbar::before {
  content: '';
  position: absolute;
  inset: 0 12px 0 12px;
  border-radius: 22px;
  background:
    radial-gradient(circle at top center, rgba(255, 255, 255, 0.05), transparent 36%),
    linear-gradient(180deg, #17301f 0%, #13281b 100%);
  box-shadow: 0 -8px 24px rgba(28, 52, 37, 0.12);
}

.tab-item {
  position: relative;
  z-index: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  padding: 8px 2px 6px;
  border: 0;
  background: transparent;
  color: rgba(255, 255, 255, 0.38);
  font-size: 9px;
  font-weight: 600;
  cursor: pointer;
  transition: color 0.18s ease;
}

.tab-item.active {
  color: #d7b868;
}

.tab-item.active::before {
  content: '';
  position: absolute;
  top: -2px;
  left: 50%;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  background: #d7b868;
  transform: translateX(-50%);
}
</style>
