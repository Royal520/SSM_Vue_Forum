<template>
  <div class="main">
    <el-container class="layout-container">
      <el-main>
        <el-col :span="24" v-for="(item,index) in articles" :key="index">
          <div class="plate-item" @click="articleClick(item.id) ">
            <el-col :span="24">{{item.title}}</el-col>
            <el-col :span="8"><h4>{{item.authorid}}</h4></el-col>
            <el-col :span="8" :offset="8">            <h4>--{{new Date(item.time).toLocaleString()}}--{{item.likenumber}}--{{item.browse}}</h4>
            </el-col>

          </div>
        </el-col>

      </el-main>
      <el-aside></el-aside>
    </el-container>
  </div>



</template>

<script>
    import{getPlateArticle} from '../network/plate'
    export default {
        name: "plate",
        data:()=>{
            return{
                articles:"",
                plateId:""
            }
        },
        created(){
            this.plateId=this.$route.params.id
            console.log("created plate"+this.plateId)
            getPlateArticle(this.plateId).then(rep=>this.articles=rep)
        },
        methods:{
            timeFormat:time=>{
               let date=new Date(time)
                let year= data.getFullYear()
                let month=data.getMonth()
                let day=data.getDay()
                return year+"-"
            },
            articleClick(id){ this.$router.push('/article/'+id)}
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
    text-align: center;
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
