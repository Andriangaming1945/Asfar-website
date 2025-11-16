import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/Home.vue'
import UmkmView from '../views/font.vue'
import DetailView from '../views/Detail/Detail.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },

  {
    path: '/umkm',
    name: 'umkm',
    component: UmkmView
  },

  {
    path: '/detail/:id',
    name: 'detail',
    component: DetailView
  },
  
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router;
