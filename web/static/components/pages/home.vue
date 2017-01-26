<template>
    <div>
        <h5>Topics</h5>
        <ul class="collection">
            <li class="collection-item" v-for="topic in topics">
                {{ topic.title }}
                <div class="right" v-if="user_id === topic.user.id">
                    <router-link :to="{ name: 'editTopic', params: { id: topic.id }}">
                        Edit
                    </router-link>
                    <a href="#" v-on:click="deleteTopic(topic.id)">Delete</a>
                </div>
            </li>
        </ul>
        <fab v-if="user_id" icon="add" to="newTopic" />
    </div>
</template>

<script>
    import Fab from '../ui/fab.vue'

    export default {
        components: {Fab},
        data() {
            return {
                topics: [],
                user_id: null
            }
        },
        created() {
            this.resource = this.$resource('topics{/id}');
            this.user_id = this.$localStorage.get('user_id');
            // fetch the data when the view is created and the data is
            // already being observed
            this.fetchData();
        },
        watch: {
            // call again the method if the route changes
            '$route': 'fetchData'
        },
        methods: {
            fetchData() {
                this.resource.get().then((response) => {
                    this.topics = response.body
                });
            },
            deleteTopic(id) {
                this.resource.delete({id}).then((response) => {
                    this.fetchData();
                });
            }
        }
    }
</script>