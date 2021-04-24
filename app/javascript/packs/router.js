import Vue from 'vue/dist/vue.esm.js';
import Router from 'vue-router';
import Index from '../components/Index.vue';
import Show from '../components/Show.vue';

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    { path: "/",
      name: 'top',
      component: Index
    },
    { path: "/show",  component: Show }
  ]
})