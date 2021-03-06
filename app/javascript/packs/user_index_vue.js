import Vue from 'vue'
import UserIndex from '../user_index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(UserIndex)
  }).$mount()
  document.body.appendChild(app.$el)
})