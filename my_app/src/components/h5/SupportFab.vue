<template>
  <button class="support-fab" aria-label="support">
    <Headphones :size="22" />
  </button>
</template>

<script setup lang="ts">
import { Headphones } from 'lucide-vue-next'
</script>

<style scoped>
.support-fab {
  position: absolute;
  right: 18px;
  bottom: 112px;
  z-index: 14;
  width: 50px;
  height: 50px;
  border: 0;
  border-radius: 50%;
  background: linear-gradient(180deg, #31c16b 0%, #17934d 100%);
  color: #fff;
  box-shadow:
    0 14px 30px rgba(22, 163, 74, 0.26),
    0 0 0 5px rgba(255, 255, 255, 0.74);
}
</style>
