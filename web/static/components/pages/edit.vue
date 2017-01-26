<template>
    <TopicForm v-bind:topic="topic" :onSubmit="submitTopic" />
</template>

<script>
    import TopicForm from '../forms/topic-form.vue'

    export default {
        components: { TopicForm },
        props: ['id'],
        data() {
            return {
                topic: {}
            }
        },
        created() {
            this.resource = this.$resource('topics{/id}');
            // fetch the data when the view is created and the data is
            // already being observed
            this.fetchData();
        },
        methods: {
            fetchData() {
                this.resource.get({ id: this.$route.params.id }).then((response) => {
                    this.topic = response.body;
                });
            },
            submitTopic(data) {
                this.resource.update({ id: this.$route.params.id }, { topic: data }).then((response) => {
                    this.$router.push({ name: 'home' });
                    Materialize.toast('Topic updated!', 4000);
                });
            }
        }
    }
</script>