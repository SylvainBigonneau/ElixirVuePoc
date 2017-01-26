<template>
    <TopicForm :onSubmit="submitTopic" />
</template>

<script>
    import TopicForm from '../forms/topic-form.vue'

    export default {
        components: {TopicForm},
        methods: {
            submitTopic(data) {
                let resource = this.$resource('topics{/id}');
                resource.save({}, { topic: data}).then((response) => {
                    this.$router.push({ name: 'home' });
                    Materialize.toast('Topic created!', 4000);
                });
            }
        }
    }
</script>