<template>
  <comment :comments="commentData"></comment>
</template>

<script>
    import * as CommentData from '../mockdata'
    import comment from '../components/Comment'

    export default {
        name:"test",
        components: {
            comment
        },
        data() {
            return {
                commentData: []
            }
        },
        created() {
            this.commentData = CommentData.comment.data;
        },
    }
</script>
