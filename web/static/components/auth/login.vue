<script>
    export default {
        created() {
            if (this.$route.query.failed) {
                Materialize.toast('Login failed!')
            } else {
                this.$localStorage.set('user_id', this.$route.query.id)
                Materialize.toast(`Welcome back, ${this.$route.query.email}!`, 4000)
            }
            this.$router.push({ name: 'home' });
        }
    }
</script>