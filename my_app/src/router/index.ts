import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import { setLocale } from '@/i18n'

const routes: Array<RouteRecordRaw> = [
    { path: '/', redirect: { name: 'Login' } },
    { path: '/login', name: 'Login', component: Login },
    { path: '/register', name: 'Register', component: Register },
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
