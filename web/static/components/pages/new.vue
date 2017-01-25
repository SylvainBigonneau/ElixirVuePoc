<template>
    <form v-on:submit="submitTopic">
        <div class="form-group" >
            <input v-model="title" placeholder="Title" class="form-control">
        </div>

        <input type="submit" value="Save Topic" class="btn btn-primary">
    </form>
</template>

<script>
    export default {
        methods: {
            submitTopic(event) {
                event.preventDefault();
                let resource = this.$resource('topics{/id}');
                resource.save({}, { topic: {title: this.title }}).then((response) => {
                    this.$router.push({ name: 'home' });
                    Materialize.toast('Topic created!', 4000);
                });
            }
        }
    }
</script>