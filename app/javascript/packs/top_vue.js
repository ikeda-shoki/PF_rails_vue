import Vue from 'vue'
import Top from '../top.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Top)
  }).$mount()
  document.body.appendChild(app.$el)
})
