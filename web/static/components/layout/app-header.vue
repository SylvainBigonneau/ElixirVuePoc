<template>
  <nav class="light-blue">
    <div class="nav-wrapper container">
      <a href="/" class="brand-logo">
          Discussions
        </a>
      <ul class="right">
        <li v-if="user_id">
          <a href="/auth/signout">Sign out</a>
        </li>
        <li v-else>
          <a href="/auth/github">Sign in with Github</a>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>

  export default {
    data() {
      return {
        user_id: null
      }
    },
    created() {
      this.user_id = this.$localStorage.get('user_id');
    }
  }
</script>