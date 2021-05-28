// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios'
import store from './store';
import './assets/css/basic.css'
Vue.prototype.$axios=axios;
Vue.config.productionTip = false
Vue.use(ElementUI)
axios.defaults.withCredentials = true;
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
