import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Login from '@/views/Login.vue'
import Register from '@/views/Register.vue'
import AppLayout from '@/views/h5/AppLayout.vue'
import Home from '@/views/h5/Home.vue'
import Products from '@/views/h5/Products.vue'
import ProductDetail from '@/views/h5/ProductDetail.vue'
import Activities from '@/views/h5/Activities.vue'
import VipRewards from '@/views/h5/VipRewards.vue'
import PrizePool from '@/views/h5/PrizePool.vue'
import LotteryWheel from '@/views/h5/LotteryWheel.vue'
import SharePage from '@/views/h5/SharePage.vue'
import Profile from '@/views/h5/Profile.vue'
import Investments from '@/views/h5/Investments.vue'
import RecordHistory from '@/views/h5/RecordHistory.vue'
import PlaceholderPage from '@/views/h5/PlaceholderPage.vue'
import { setLocale } from '@/i18n'

const routes: Array<RouteRecordRaw> = [
  { path: '/', redirect: { name: 'Home' } },
  { path: '/login', name: 'Login', component: Login },
  { path: '/register', name: 'Register', component: Register },
  {
    path: '/app',
    component: AppLayout,
    children: [
      { path: '', redirect: { name: 'Home' } },
      { path: 'home', name: 'Home', component: Home },
      { path: 'products', name: 'Products', component: Products },
      { path: 'product/:id', name: 'ProductDetail', component: ProductDetail },
      { path: 'activities', name: 'Activities', component: Activities },
      { path: 'activities/vip', name: 'VipRewards', component: VipRewards },
      { path: 'activities/prize-pool', name: 'PrizePool', component: PrizePool },
      { path: 'activities/lottery', name: 'LotteryWheel', component: LotteryWheel },
      { path: 'team', name: 'Team', component: SharePage },
      { path: 'profile', name: 'Profile', component: Profile },
      { path: 'profile/investments', name: 'Investments', component: Investments },
      { path: 'profile/records/:type', name: 'RecordHistory', component: RecordHistory }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, _from, next) => {
  if (to.query.lang) {
    setLocale(to.query.lang as string)
  }
  next()
})

export default router
