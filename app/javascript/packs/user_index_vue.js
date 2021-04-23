import Vue from 'vue'
import UserIndex from '../user_index.vue'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(UserIndex)
  }).$mount()
  document.body.appendChild(app.$el)
})