<template>
  <div id="top">
    <div class="container">
      <div class="post-form">
        <input v-model="title" placeholder="タイトル">
        <input v-model="post_introduction" placeholder="説明">
        <button @click="addPost">データを送信する</button>
      </div>
      <div v-if="errored">
        <p>データ送信エラーです。入力してください</p>
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
      errored: false,
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
      if (this.title === "" || this.post_introduction === "") {
        this.errored = true
        console.log('777')
      }
      else {
        axios.post('/api/v1/posts.json',{
          title: this.title,
          post_introduction: this.post_introduction,
          user_id: 1,
        })
        .then(() => {
          window.location = "/"
        })
        .catch(error => {
          console.log(error)
          this.errored = true
        })
        this.title = "";
        this.post_introduction = "";
      }
    }
  }
}
</script>

<style scoped>

</style>
