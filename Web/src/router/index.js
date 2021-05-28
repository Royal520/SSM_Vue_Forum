import Vue from 'vue'
import Router from 'vue-router'

//安装插件
Vue.use(Router)

//懒加载
const login = ()=>import('../components/login')
const home = ()=>import('../components/home')

const routes=[
  {
    path:"",
    redirect:"/index"
  },
  {
    path: '/login',
    name: 'login',
    component: login
  },
  {
    path:'/home',
    component:home
  },
  {
    path:'/index',
    component: ()=> import('../view/index')
  },
  {
    path:'/plate/:id',
    component: ()=> import('../components/plate'),
    meta: {
      title: 'plate'
    }
  },
  {
    path:'/article/:id',
    component:()=>import('../components/article'),
    meta:{
      title: 'article'
    }
  },
  {
    path:'/write',
    component:()=>import('../view/write')
  },
  {
    path:'/changeInfor',
    component:()=>import('../view/changeInfor'),
  },
  {
    path:'/test',
    component:()=>import('../components/test'),
  }

]

const router =new Router({
  routes,
  mode:'history'
})


export default  router
