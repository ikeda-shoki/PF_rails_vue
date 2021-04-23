<template>
  <div id="user_index">
    <p>{{ message }}</p>
    <p>{{ count }}</p>
    <div class="user-profile" v-for="user in userInfo" :key="user.account_name">
      <h3>{{ user.account_name }}</h3>
      <p>{{ user.user_introduction }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "池田翔稀",
      userInfo: [],
      count: 0,
    }
  },
  created() {
    axios.get('/api/v1/users.json')
      .then(response => {
        this.userInfo = response.data;
        console.log(response.data)
      })
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>