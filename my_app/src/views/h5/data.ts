export interface InvestmentProduct {
  id: number
  name: string
  price: string
  dailyIncome: string
  days: number
  maturityAmount: string
  detailTitle: string
  detailText: string
  cover: string
}

export const investmentProducts: InvestmentProduct[] = [
  {
    id: 1,
    name: 'Financiar 1',
    price: '100.000',
    dailyIncome: '6.000',
    days: 15,
    maturityAmount: '190.000',
    detailTitle: 'Financiar 1',
    detailText: 'Este producto ofrece ingresos diarios estables y un ciclo corto pensado para usuarios que prefieren una rentabilidad clara y visible.',
    cover: 'linear-gradient(180deg, rgba(17,24,39,0.06) 0%, rgba(17,24,39,0.55) 100%), linear-gradient(135deg, #7085d9 0%, #c48d4e 100%)'
  },
  {
    id: 2,
    name: 'Financiar 2',
    price: '300.000',
    dailyIncome: '22.000',
    days: 15,
    maturityAmount: '630.000',
    detailTitle: 'Financiar 2',
    detailText: 'Plan de inversión de ticket medio con retorno diario visible y liquidación acumulada al finalizar el ciclo.',
    cover: 'linear-gradient(180deg, rgba(17,24,39,0.06) 0%, rgba(17,24,39,0.55) 100%), linear-gradient(135deg, #5c83a3 0%, #bca06c 100%)'
  },
  {
    id: 3,
    name: 'Producto ideal',
    price: '10.000',
    dailyIncome: '4.000',
    days: 5,
    maturityAmount: '20.000',
    detailTitle: 'Producto ideal',
    detailText: 'Este producto tiene como objetivo proporcionar a los usuarios una comprensión del retorno diario y de la acreditación automática al saldo disponible.',
    cover: 'linear-gradient(180deg, rgba(17,24,39,0.06) 0%, rgba(17,24,39,0.55) 100%), linear-gradient(135deg, #8ab1d6 0%, #d4ba93 100%)'
  },
  {
    id: 4,
    name: 'Financiar 4',
    price: '10.000.000',
    dailyIncome: '600.000',
    days: 15,
    maturityAmount: '19.000.000',
    detailTitle: 'Financiar 4',
    detailText: 'Inversión inmobiliaria destacada con ciclo de 15 días y acreditación diaria. Ideal para reproducir la tarjeta de la pantalla principal.',
    cover: 'linear-gradient(180deg, rgba(17,24,39,0.06) 0%, rgba(17,24,39,0.55) 100%), linear-gradient(135deg, #6aa0d8 0%, #253b63 100%)'
  },
  {
    id: 5,
    name: 'VIC3',
    price: '50.000',
    dailyIncome: '3.000',
    days: 365,
    maturityAmount: '1.145.000',
    detailTitle: 'VIC3',
    detailText: 'Producto de ciclo largo orientado a usuarios con preferencia por una inversión anual y rentabilidad fija.',
    cover: 'linear-gradient(180deg, rgba(17,24,39,0.06) 0%, rgba(17,24,39,0.55) 100%), linear-gradient(135deg, #8fb18f 0%, #7b5d40 100%)'
  }
]
