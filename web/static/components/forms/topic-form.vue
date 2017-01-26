<template>
    <form v-on:submit="submitTopic">
        <div class="form-group">
            <input v-model="topic.title" placeholder="Title" class="form-control">
        </div>

        <input type="submit" value="Save Topic" class="btn btn-primary">
    </form>
</template>

<script>
    export default {
        props: {
            onSubmit: {
                type: Function
            },
            topic: {
                type: Object,
                default() {
                    return {
                        title: ''
                    }
                }
            }
        },
        methods: {
            submitTopic(event) {
                event.preventDefault();
                this.onSubmit(this.topic);
            }
        }
    }
</script>