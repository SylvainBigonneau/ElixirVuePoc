<template>
  <nav class="light-blue">
    <div class="nav-wrapper container">
      <a href="/" class="brand-logo">
          Discussions
        </a>
      <ul class="right">
        <li v-if="connected">
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
        connected: false
      }
    },
    created() {
      this.connected = this.$localStorage.get('connected');
    }
  }
</script>