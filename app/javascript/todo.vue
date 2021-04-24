<template>
  <div class="todo">
    <div class="container">
      <h1>Todoリスト</h1>
      <div class="todo-form">
        <input v-model="newTask" placeholder="to doを追加してください">
        <div @click="createTask">
          <button>追加</button>
        </div>
      </div>
      <ul>
        <li v-for="(task, index) in tasks" :key="task.id">
          <input type="checkbox" v-model="task.is_done" @click="update(task.id, index)">
          <span :class="{done: task.is_done}">{{ task.name }}</span>
          <button @click="deleteTask(task.id, index)">削除</button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      tasks: [],
      newTask: ""
    }
  },
  mounted() {
    this.fetchTasks();
  },
  methods: {
    fetchTasks() {
      axios.get('/api/v1/tasks')
        .then(response => {
          for(let i = 0; i < response.data.tasks.length; i++) {
            this.tasks.push(response.data.tasks[i]);
          }
        }, error => {
          console.log(error, response);
        })
    },
    createTask() {
      if(this.newTask == '') return;

      axios.post('/api/v1/tasks', { task: { name: this.newTask} })
        .then(response => {
          this.tasks.unshift(response.data);
          this.newTask = "";
        }, error => {
          console.log(error, response);
        });
    },
    deleteTask(task_id, index) {
      axios.delete('/api/v1/tasks/' + task_id)
        .then(response => {
          this.tasks.splice(index, 1);
        }, error => {
          console.log(error, response);
        })
    },
    update(task_id) {
      axios.put('/api/v1/tasks/' + task_id)
        .then(response => {
        }, error => {
          console.log(error);
        })
    }
  }
}
</script>

<style lang="scss" scoped>
  li > span.done {
    text-decoration: line-through;
  }
</style>