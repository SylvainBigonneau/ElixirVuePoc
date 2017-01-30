<template>
  <div>
    <SideBar />
    <main>
      <AppHeader />

      <div class="container">

        <p class="alert alert-info" role="alert"></p>
        <p class="alert alert-danger" role="alert"></p>

        <router-view></router-view>

      </div>
    </main>
  </div>
</template>

<script>
  import AppHeader from './app-header.vue'
  import SideBar from './side-bar.vue'

  export default {
    components: { AppHeader, SideBar },
    mounted() {
      $(document).ready(function () {
        $('select').material_select();
      });
    }
  }
</script>

<style>
    header, main, footer {
      padding-left: 300px;
    }

    @media only screen and (max-width : 992px) {
      header, main, footer {
        padding-left: 0;
      }
    }
</style>