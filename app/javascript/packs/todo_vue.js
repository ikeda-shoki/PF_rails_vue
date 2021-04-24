import Vue from 'vue'
import Todo from '../todo.vue'
import Router from '../packs/router.js'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    Router,
    render: h => h(Todo)
  }).$mount()
  document.body.appendChild(app.$el)
})