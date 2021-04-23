<template>
  <div id="top">
    <div class="container">
      <div class="post-form">
        <input v-model="title" placeholder="タイトル">
        <input v-model="post_introduction" placeholder="説明">
        <button @click="addPost">データを送信する</button>
      </div>
      <div class="post-items">
        <div class="post-item" v-for="post in posts" :key="post.name">
          <p>{{ post.title }}</p>
          <p>{{ post.post_introduction }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "Hello year!",
      title: "",
      post_introduction: "",
      user_id: 1,
      posts: [],
    }
  },
  created() {
    axios.get('/api/v1/posts/top.json')
      .then(response => {
        this.posts = response.data;
        console.log('update')
      })
  },
  methods: {
    addPost() {
      axios.post('/api/v1/posts.json',{
        title: this.title,
        post_introduction: this.post_introduction,
        user_id: 1,
      })
       .then(response => {
         console.log(response.data);
       })
      this.title = "";
      this.post_introduction = "";
    }
  }
}
</script>

<style scoped>

</style>
