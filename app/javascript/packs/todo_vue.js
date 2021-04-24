import Vue from 'vue'
import Todo from '../todo.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Todo)
  }).$mount()
  document.body.appendChild(app.$el)
})