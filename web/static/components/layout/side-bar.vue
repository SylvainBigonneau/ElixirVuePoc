<template>
    <ul id="slide-out" class="side-nav fixed">
        <li class="logo">
            <router-link :to="{ name: 'home'}" id="logo-container" class="brand-logo">
                <object id="front-page-logo" type="image/svg+xml" data="http://materializecss.com/res/materialize.svg">Your browser does not support SVG</object>
            </router-link>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select>
            <option value="" disabled selected>Choose your option</option>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
          </select>
                <label>Materialize Select</label>
            </div>
        </li>
    </ul>
</template>

<script>

    export default {}

</script>

<style>
    ul.side-nav.fixed li.logo {
      text-align: center;
      margin-top: 32px;
      margin-bottom: 80px;
    }

    ul.side-nav.fixed li {
      line-height: 44px;
    }

    ul.side-nav.fixed {
      overflow: hidden;
    }

    ul.side-nav.fixed li a {
      font-size: 13px;
      line-height: 44px;
      height: 44px;
      padding: 0 30px;
    }

    #logo-container {
      height: 57px;
      margin-bottom: 32px;
    }

    #front-page-logo {
      display: inline-block;
      height: 100%;
      pointer-events: none;
    }

    ul.side-nav.fixed li.logo #logo-container:hover {
      background-color: transparent;
    }

    ul.side-nav.fixed li.row {
        line-height: 1.5;
    }
</style>