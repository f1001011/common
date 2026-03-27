<template>
  <div class="app-shell">
    <div class="phone-frame">
      <router-view />
      <SupportFab />
      <BottomTabBar />
    </div>
  </div>
</template>

<script setup lang="ts">
import BottomTabBar from '@/components/h5/BottomTabBar.vue'
import SupportFab from '@/components/h5/SupportFab.vue'
</script>

<style scoped>
.app-shell {
  min-height: 100vh;
  padding: 12px;
  background: linear-gradient(180deg, #edf2fa 0%, #f4f6fb 100%);
}

.phone-frame {
  position: relative;
  width: min(100%, 404px);
  min-height: calc(100vh - 24px);
  margin: 0 auto;
  overflow: hidden;
  border: 1px solid rgba(27, 48, 34, 0.08);
  border-radius: 24px;
  background: #f8f5ed;
  box-shadow:
    0 26px 70px rgba(27, 48, 34, 0.1),
    inset 0 1px 0 rgba(255, 255, 255, 0.7);
}

.phone-frame::before {
  content: '';
  position: absolute;
  inset: 0;
  pointer-events: none;
  border-radius: inherit;
  box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.35);
}
</style>
