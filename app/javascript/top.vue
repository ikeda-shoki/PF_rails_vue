<template>
  <div id="top">
    <div class="post-form">
      <input v-model="title" placeholder="タイトル">
      <input v-model="post_introduction" placeholder="説明">
      <button @click="addPost">データを送信する</button>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello year!",
      title: "",
      post_introduction: "",
      user_id: 1,
    }
  },
  methods: {
    addPost() {
      axios.post('/api/v1/posts'), {
        title: this.title,
        post_introduction: this.post_introduction,
        user_id: 1,
      }
      this.title = "";
      this.post_introduction = "";
    }
  }
}
</script>

<style scoped>

</style>
