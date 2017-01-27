<template>
    <div>
        <h5>{{ topic.title }}</h5>
        <CommentForm :onSubmit="submitComment" />
        <ul class="collection">
            <li class="collection-item" v-for="comment in topic.comments">
                {{ comment.content }}
            </li>
        </ul>
    </div>
</template>

<script>
    import Vue from 'vue'
    import CommentForm from '../forms/comment-form.vue'

    export default {
        components: { CommentForm },
        props: ['id'],
        data() {
            return {
                topic: {},
                comments: []
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
        watch: {
            $route() {
                this.topic = {};
                this.fetchData();
            }
        },
        methods: {
            fetchData() {
                let resource = this.$resource('topics{/id}');
                resource.get({ id: this.id }).then((response) => {
                    this.topic = response.body;
                });
            },
            submitComment(data) {
                let commentsResource = this.$resource(`topics/${this.topic.id}/comments{/id}`);
                commentsResource.save({}, { comment: data }).then((response) => {
                    data.content = '';
                    this.fetchData();
                    Materialize.toast('Comment posted!', 4000);
                });
            }
        }
    }
</script>