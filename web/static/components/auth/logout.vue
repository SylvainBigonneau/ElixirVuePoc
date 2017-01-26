<template>

</template>

<script>
    export default {
        created() {
            this.$localStorage.set('connected', false)
            Materialize.toast('Disconnected succesfully!', 4000);
            this.$router.push({ name: 'home' });
        }
    }
</script>