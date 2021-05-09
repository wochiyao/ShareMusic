import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Register from '../views/Register.vue'
import Index from '../views/Index.vue'
import Music from '../views/Music.vue'
import Search from '../views/Search.vue'
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Register',
    name: 'Register',
    component: Register
  },
  {
    path: '/Index',
    name: 'Index',
    component: Index
  },
  {
    path: '/Music',
    name: 'Music',
    component: Music
  },
  {
    path: '/Search',
    name: 'Search',
    component: Search
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
