# my_app 项目文档

## 1. 项目定位

`my_app` 当前已经收缩为一个新的前端认证项目，只保留以下能力：

- 登录
- 注册
- 多语言基础能力
- 全局弹窗提示
- 统一主题色注入

原来的首页、余额中心、商品页、VIP 页没有直接删除，已经归档到 `src/views/archive/`，后续需要时可以继续参考。

## 2. 技术栈

| 层 | 技术 |
|---|---|
| 框架 | Vue 3 |
| 语言 | TypeScript |
| 构建 | Vite 5 |
| 路由 | Vue Router 4 |
| 多语言 | Vue I18n 9 |
| 网络请求 | Axios |
| 动效 | @vueuse/motion |
| 图标 | lucide-vue-next |

## 3. 当前项目范围

当前只保留两个页面：

- `Login.vue`
- `Register.vue`

当前只保留两类请求：

- 登录接口
- 注册接口

当前路由只有：

- `/login`
- `/register`
- `/` 重定向到 `/login`

## 4. 目录结构

```text
my_app/
├── docs/
│   ├── PROJECT.md
│   └── 文档说明.md
├── src/
│   ├── api/
│   │   ├── auth.ts
│   │   └── request.ts
│   ├── components/
│   │   └── PopupModal.vue
│   ├── composables/
│   │   ├── usePopup.ts
│   │   └── useTheme.ts
│   ├── config/
│   │   ├── colors.ts
│   │   └── popupPresets.ts
│   ├── hooks/
│   │   └── useAuth.ts
│   ├── locales/
│   │   ├── zh.json
│   │   └── en.json
│   ├── router/
│   │   └── index.ts
│   ├── stypes/
│   │   └── README.md
│   ├── views/
│   │   ├── archive/
│   │   ├── Login.vue
│   │   └── Register.vue
│   ├── App.vue
│   ├── config.js
│   ├── config.d.ts
│   ├── env.d.ts
│   ├── i18n.ts
│   └── main.ts
├── index.html
├── package.json
└── vite.config.js
```

## 5. 后端配置

后端接口域名统一配置在：

- `src/config.js`

当前默认值：

```js
export const API_BASE_URL = 'http://127.0.0.1:8080'
export const REQUEST_TIMEOUT = 10000
```

如果后端域名调整，只改这一处，不要在业务文件里写死域名。

## 6. 接口约定

### 登录

- 路径：`POST /api/login`
- 参数：

```json
{
  "phone": "123456789",
  "pwd": "abc12345"
}
```

### 注册

- 路径：`POST /api/register`
- 参数：

```json
{
  "phone": "123456789",
  "pwd": "abc12345",
  "invitation_code": "1008"
}
```

`invitation_code` 为可选字段。

## 7. 样式目录规范

后续新增的样式文件，统一放到：

- `src/stypes/`

规范说明：

- 公共样式文件放在 `src/stypes/` 下
- 页面拆分出来的独立样式文件也放在 `src/stypes/` 下
- 不要把独立的 `.css` / `.scss` 文件散落到别的目录
- 如果只是当前单文件组件内部的小范围样式，可以继续写在 `.vue` 文件的 `<style>` 中

推荐命名方式：

- `src/stypes/auth.css`
- `src/stypes/login.css`
- `src/stypes/register.css`
- `src/stypes/theme.css`

## 8. 开发规则

- 新增接口时，先改 `src/api/`，不要在页面里直接写 `axios`
- 新增域名或请求超时配置时，只改 `src/config.js`
- 新增页面时，先补路由，再补多语言文案
- 弹窗统一通过 `usePopup()` 调用
- 颜色主题统一通过 `src/config/colors.ts` 管理
- 需要拆分的样式文件统一放到 `src/stypes/`

## 9. 启动命令

安装依赖：

```bash
npm install
```

本地开发：

```bash
npm run dev
```

生产构建：

```bash
npm run build
```

TypeScript 检查：

```bash
npx tsc --noEmit
```

## 10. 归档说明

已归档页面位置：

- `src/views/archive/Home.vue`
- `src/views/archive/BalanceCenter.vue`
- `src/views/archive/Products.vue`
- `src/views/archive/Vip.vue`

这些文件当前不参与路由和业务运行，仅作为历史页面参考。
