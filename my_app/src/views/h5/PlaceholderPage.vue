<template>
  <div class="placeholder-page">
    <div class="placeholder-card">
      <component :is="currentIcon" :size="42" />
      <h2>{{ title }}</h2>
      <p>{{ desc }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Briefcase, Gift, User, Users } from 'lucide-vue-next'

const props = defineProps<{
  title: string
  desc: string
  icon?: string
}>()

const iconMap = {
  briefcase: Briefcase,
  gift: Gift,
  user: User,
  users: Users
}

const currentIcon = computed(() => iconMap[props.icon as keyof typeof iconMap] ?? Briefcase)
</script>

<style scoped>
.placeholder-page {
  min-height: calc(100vh - 28px);
  padding: 26px 18px 110px;
  background: linear-gradient(180deg, #faf6ed 0%, #f5f8f2 100%);
}

.placeholder-card {
  display: flex;
  min-height: 260px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 14px;
  border-radius: 24px;
  background: #fff;
  color: #1f2937;
  box-shadow: 0 12px 30px rgba(16, 24, 40, 0.08);
}

.placeholder-card p {
  color: #6b7280;
  font-size: 14px;
}
</style>
