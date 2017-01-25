<template>
    <div>
        <h5>Topics</h5>
        <ul class="collection">
            <li class="collection-item" v-for="topic in topics">
                {{ topic.title }}
            </li>
        </ul>
        <fab icon="add" to="/new" />
    </div>
</template>

<script>
    import Fab from '../ui/fab.vue'

    export default {
        components: {Fab},
        data() {
            return {
                topics: []
            }
        },
        created() {
            // fetch the data when the view is created and the data is
            // already being observed
            this.fetchData()
        },
        watch: {
            // call again the method if the route changes
            '$route': 'fetchData'
        },
        methods: {
            fetchData() {
                let resource = this.$resource('topics{/id}');
                resource.get().then((response) => {
                    this.topics = response.body
                });
            }
        }
    }
</script>