import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'element-plus/theme-chalk/index.css'
import ElementPlus from 'element-plus'
import locale from 'element-plus/lib/locale/lang/zh-cn'

import './assets/main.css'

const app = createApp(App)

app.use(router)
app.use(ElementPlus, {locale})

app.mount('#app')

export default app
