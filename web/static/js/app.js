// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import VueLocalStorage from 'vue-localstorage'

import App from "../components/app.vue"
import MainLayout from "../components/layout/main-layout.vue"
import Login from "../components/auth/login.vue"
import Logout from "../components/auth/logout.vue"
import Home from "../components/pages/home.vue"
import New from "../components/pages/new.vue"
import Edit from "../components/pages/edit.vue"

Vue.use(VueRouter)
Vue.use(VueResource)
Vue.use(VueLocalStorage)

Vue.http.options.root = '/api'

// Create the main component
Vue.component('app', App)

const router = new VueRouter({
  routes: [
    { path: '/login', component: Login },
    { path: '/logout', component: Logout },
    {
      path: '/', component: MainLayout,
      children: [
        { name: 'home', path: '/', component: Home },
        { path: '/topics/new', name: 'newTopic', component: New },
        { path: '/topics/:id/edit', name: 'editTopic', component: Edit, props: true }
      ]
    }
  ]
})

Vue.http.get('getUserId').then((resp) => {
  // And create the top-level view model:
  new Vue({
    el: '#app',
    router,
    localStorage: {
      user_id: {
        type: Number
      }
    },
    created() {
      this.$localStorage.set('user_id', resp.body.user_id);
    },
    render(createElement) {
      return createElement(App, {})
    }
  });
});