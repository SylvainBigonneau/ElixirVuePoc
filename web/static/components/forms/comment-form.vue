<template>
    <form v-on:submit="submitComment">
        <div class="form-group">
            <input v-model="comment.content" placeholder="Write a comment..." class="form-control">
        </div>

        <input type="submit" value="Post comment" class="btn btn-primary">
    </form>
</template>

<script>
    export default {
        props: {
            onSubmit: {
                type: Function
            },
            comment: {
                type: Object,
                default() {
                    return {
                        content: ''
                    }
                }
            }
        },
        methods: {
            submitComment(event) {
                event.preventDefault();
                this.onSubmit(this.comment);
            }
        }
    }
</script>
