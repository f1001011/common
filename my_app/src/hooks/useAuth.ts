import { useRouter } from 'vue-router'
import { loginByPhone as loginApi, register as registerApi } from '../api/auth'

export function useAuth() {
  const router = useRouter()

  const login = async (phone: string, password: string) => {
    const res = await loginApi({ phone, pwd: password })
    const token = (res as any)?.token
    if (token) localStorage.setItem('token', token)
    router.push({ name: 'Home' })
    return res
  }

  const register = async (phone: string, password: string, invitationCode = '') => {
    const payload: { phone: string; pwd: string; invitation_code?: string } = {
      phone,
      pwd: password,
    }
    const normalizedCode = invitationCode.trim()
    if (normalizedCode) {
      payload.invitation_code = normalizedCode
    }

    const res = await registerApi(payload)
    const token = (res as any)?.token
    if (token) localStorage.setItem('token', token)
    router.push({ name: 'Login' })
    return res
  }

  const logout = () => {
    localStorage.removeItem('token')
    router.push({ name: 'Login' })
  }

  return { login, register, logout }
}
