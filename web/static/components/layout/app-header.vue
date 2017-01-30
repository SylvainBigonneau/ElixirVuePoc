<template>
  <nav class="light-blue">
    <div class="nav-wrapper container">
      <a href="#" data-activates="slide-out" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="material-icons">menu</i></a>
      <router-link :to="{ name: 'home'}" class="brand-logo">
          Discussions
      </router-link>
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
    mounted() {
      (function ($) {
        $(function () {

          $('.button-collapse').sideNav();

        }); // end of document ready
      })(jQuery);
      this.user_id = this.$localStorage.get('user_id');
    }
  }
</script>