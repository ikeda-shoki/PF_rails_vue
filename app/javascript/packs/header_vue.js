import Vue from 'vue'
import Header from '../components/Header.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Header)
  }).$mount()
  document.body.appendChild(app.$el)
})