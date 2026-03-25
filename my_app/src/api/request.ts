import axios, { InternalAxiosRequestConfig } from 'axios'
import { usePopup } from '@/composables/usePopup'
import router from '@/router'
import { API_BASE_URL, REQUEST_TIMEOUT } from '@/config.js'

const request = axios.create({
    baseURL: API_BASE_URL,
    timeout: REQUEST_TIMEOUT
})

request.interceptors.request.use(
    (config: InternalAxiosRequestConfig) => {
        const token = localStorage.getItem('token') || ''
        if (token) {
            config.headers.set('Authorization', `${token}`)
        } else {
            config.headers.delete('Authorization')
        }
        return config
    },
    error => Promise.reject(error)
)

request.interceptors.response.use(
    response => {
        const { showPopup } = usePopup()
        const payload = response.data ?? {}
        const { code, data, message } = payload

        if (code === 200) {
            return data
        }

        if (code === 402 || code === 10015) {
            localStorage.removeItem('token')
            showPopup(message || '登录已失效，请重新登录', 'warning')
            if (router.currentRoute.value.name !== 'Login') {
                router.push({ name: 'Login' })
            }
            return Promise.reject(new Error(message || 'Auth expired'))
        }

        showPopup(message || '请求失败', 'error')
        return Promise.reject(new Error(message || 'Request failed'))
    },
    error => {
        const { showPopup } = usePopup()
        showPopup(error.message || '网络异常，请稍后重试', 'error')
        return Promise.reject(error)
    }
)

export default request
