import request from './request'

export const loginByPhone = (data: { phone: string; pwd: string }) =>
  request.post('/api/login', data)

export const register = (data: {
  phone: string
  pwd: string
  invitation_code?: string
}) => request.post('/api/register', data)
