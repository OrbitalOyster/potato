import { createRouter, createWebHistory } from 'vue-router'
import ErrorView from '#views/ErrorView.vue'
import HomeView from '#views/HomeView.vue'
import LoginView from '#views/LoginView.vue'
import { useLoginStore } from '#stores/useLoginStore.ts'

/* Typings */
declare module 'vue-router' {
  interface RouteMeta {
    title: string
  }
}

/* Routes */
const routes = [{
    component: LoginView,
    name: 'Login',
    path: '/login',
    meta: { title: 'Вход' },
  }, {
    component: HomeView,
    name: 'Home',
    path: '/',
    meta: { title: 'Главная' },
  }, {
    component: ErrorView,
    name: 'Error',
    path: '/error',
    meta: { title: 'Ошибка' },
  }],
  router = createRouter({
    history: createWebHistory(),
    routes,
  })

/* Error handler */
router.onError(async (err, to) => {
  console.log('Router error', err, to)
  await router.push({ name: 'Error' })
})

/* Auth guards */
router.beforeEach(async (to, from) => {
  console.log(`Navigating from ${from.path} to ${to.path}`)
  /* Error page */
  if (to.name === 'Error')
    return true
  /* Log in status */
  const loggedIn = await useLoginStore().check()
  if (to.name === 'Login')
    /* Logged in users get redirected from login page to home page */
    return loggedIn ? { name: 'Home' } : true
  /* Default handler */
  return loggedIn ? true : { name: 'Login' }
})

/* Set document title */
router.afterEach(to => document.title = `${to.meta.title} - Gooseberry.js`)

export default router
