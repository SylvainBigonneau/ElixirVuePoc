<template>
    <div class="fixed-action-btn">
        <router-link class="btn-floating btn-large waves-effect waves-light red" v-bind:to="to">
            <i class="material-icons">{{icon}}</i>
        </router-link>
    </div>
</template>

<script>
    export default {
        props: ['to', 'icon']
    }
</script>
