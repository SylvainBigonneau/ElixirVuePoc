<template>

</template>

<script>
    export default {
        created() {
            this.$localStorage.remove('user_id');
            Materialize.toast('Disconnected succesfully!', 4000);
            this.$router.push({ name: 'home' });
        }
    }
</script>