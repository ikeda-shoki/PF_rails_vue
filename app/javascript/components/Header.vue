<template>
  <header>
    <div class="container">
      <div class="header-left">
        <h1>Enjoy Cooking</h1>
      </div>
      <div class="header-right">
        <ul class="header-lists">
          <li class="header-list" v-for="list in lists" :key="list.name">
            <a :href="list.path">{{ list.name }}</a>
          </li>
        </ul>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  data() {
    return {
      lists: [
        {
          name: "Top",
          path: "/"
        },
        {
          name: "このサイトについて",
          path: "/users"
        },
        {
          name: "Log In",
          path: "/users/sign_in"
        },
        {
          name: "Sign Up",
          path: "/users/sign_up"
        },
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
  $background-color: #d0bfc7;
  $white-font: #f7f7f7;

  header {
    background-color: $background-color;
    width: 100%;
    height: 70px;

    .container {
      display: flex;
      align-items: center;
      height: 100%;
    }

    .header-left {
      color: $white-font;
      font-size: 40px;
      font-weight: bold;
    }

    .header-right {
      margin-left: auto;

      .header-lists {
        display: flex;
        align-items: center;

        .header-list {
          margin-left: 20px;

          a {
            color: $white-font
          }
        }
      }
    }
  }

</style>