
<template>
  <div class="main">
    <el-container class="layout-container">
      <el-aside>
        <div>{{user.username}}</div>
        <div>{{user.levelid}}</div>
        <div></div>
      </el-aside>
      <el-main>
        <el-container class="layout-container">
          <el-main>
            <div>
              <h1>
                {{article.title}}
                {{article.likenumber}}
                {{article.browse}}
                {{article.time}}
              </h1>
              <!--          { "id": 1, "authorid": null, "plateid": 1, "text": "time": 1619588133000, "likenumber": 3, "browse": 5, "title": "C语言的输出",
              "label": null,
              "user": { "id": 1, "username": "Royal", "password": "12345678", "mail": "2678405901@qq.com", "phone": "13720240032", "levelid": 8, "uuid": null, "time": 1618976096000, "stateid": 1, "fans": null, "focus": null, "comments": null, "replys": null, "articles": null, "browses": null, "status": null, "level": null },
               "comments": [ { "articleid": 1, "userid": 1, "commentid": 1, "fatherid": 0, "replyid": null, "time": 1619372396000, "likenumber": 1, "sort": null, "content": "我的评论", "comments": null }, { "articleid": 1, "userid": 1, "commentid": 2, "fatherid": 0, "replyid": null, "time": 1619509635000, "likenumber": null, "sort": null, "content": "一号说的对", "comments": null } ] }}-->
            </div>
            <div v-html="article.text"></div>
          </el-main>
          <el-footer>
            <template>
              <comment :comments="comments" v-if="comments.length>0"></comment>
            </template>
          </el-footer>
        </el-container>

      </el-main>
    </el-container>
  </div>


</template>

<script>
  import {getArticleByArticleid,writeArticle,submitComment,getComment} from "../network/article";
  import comment from "./comment"

  export default {
        name: "article",

      components: {
          comment
      },
        data:()=>{
            return{
                article:"",
                user:"",
                articleid:'',
                comments:'',
                userComment:'',
                commentData: []
            }
        },
            created(){
                this.articleid=this.$route.params.id
                getArticleByArticleid(this.articleid).then(rep=>{
                    this.article=rep
                    this.user=rep.user
                    this.comments=rep.comments
                    console.log(this.comments)

                })
            },
        methods:{
            submitComment(){
                if(this.userComment!=''){
                    submitComment(this.userComment,0,this.articleid).then(rep=>{
                        if(rep==true){
                            getComment(0,this.articleid).then(rep=>this.comments=rep)
                        }
                    })
                }
            }
        }
    }
</script>

<style scoped>
  .layout-container{
    height: 100%;
  }
  .main{
    width:100%;
    height:100%;
    border:hidden;
    /*background-color: #3a8ee6;*/
  }
  .el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 100%;
  }


  .el-main {
    background-color: #E9EEF3;
    color: #333;
    /*text-align: center;*/
    /*line-height: 160px;*/
  }

  .plate-item {
    /*width: 28%;*/
    margin: 0 8px 10px 0;
    text-align: left;
    height: 80px;
    color: #bbb;
    background-color: #f6f6f6;
    border-radius: 5px;
    padding: 6px 16px;
  }
</style>
