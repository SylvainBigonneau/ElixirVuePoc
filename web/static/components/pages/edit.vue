<template>
    <TopicForm v-bind:topic="topic" :onSubmit="submitTopic" />
</template>

<script>
    import Vue from 'vue'
    import TopicForm from '../forms/topic-form.vue'

    export default {
        components: { TopicForm },
        props: ['id'],
        data() {
            return {
                topic: {}
            }
        },
        beforeRouteEnter(to, from, next) {
            let resource = Vue.resource('topics{/id}');
            resource.get({ id: to.params.id }).then((response) => {
                next(vm => {
                    vm.topic = response.body;
                })
            });
        },
        created() {
            this.resource = this.$resource('topics{/id}');
        },
        watch: {
            $route() {
                this.topic = {}
                this.resource.get({ id: this.id }).then((response) => {
                    this.topic = response.body;
                })
            }
        },
        methods: {
            submitTopic(data) {
                this.resource.update({ id: this.id }, { topic: data }).then((response) => {
                    this.$router.push({ name: 'home' });
                    Materialize.toast('Topic updated!', 4000);
                });
            }
        }
    }
</script>