<template>
  <div id="top">
    <div class="container">
      <div class="post-form">
        <input v-model="post.title" placeholder="タイトル">
        <input v-model="post.introduction" placeholder="説明">
        <button @click="addPost">データを送信する</button>
      </div>
      <div v-if="errored">
        <p>データ送信エラーです。入力してください</p>
      </div>
      <div class="post-items">
        <div class="post-item" v-for="(post, index) in posts" :key="post.id">
          <p>{{ post.title }}</p>
          <p>{{ post.post_introduction }}</p>
          <button @click="postDelete(post.id, index)">この投稿を削除する</button>
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
      user_id: 1,
      posts: [],
      errored: false,
      post: {
        title: "",
        introduction: "",
        user_id: 1,
      }
    }
  },
  mounted() {
    axios.get('/api/v1/posts/top.json')
      .then(response => {
        this.posts = response.data;
      })
      console.log(this.posts)
  },
  methods: {
    addPost() {
      if (this.post.title === "" || this.post.introduction === "") {
        this.errored = true
      }
      else {
        axios.post('/api/v1/posts',{
          post: {
            title: this.post.title,
            post_introduction: this.post.introduction,
            user_id: this.post.user_id
          }
        })
        .then(response => {
          this.posts.unshift(response.data)
          this.post.title = "";
          this.post.introduction = "";
        }, error => {
          console.log(error, response)
        })
      }
    },
    postDelete(post_id, index) {
      axios.delete('/api/v1/posts/' + post_id)
        .then(response => {
          this.posts.splice(index, 1);
        }, error => {
          console.log(error, response);
        })
    }
  }
}
</script>

<style scoped>

</style>
