<template>
  <div class="main">
      <el-container class="layout-container">
          <el-main>

            <el-col :span="8" v-for="(item,index) in plates" :key="index">
              <div class="plate-item" @click="divClick(item.id) ">
                <h4>{{item.name}}</h4>
                <P >{{item.introduce}}</P>
              </div>
            </el-col>

          </el-main>
          <el-aside></el-aside>
      </el-container>
  </div>


</template>

<script>
  import {getPlate} from "../network/plate"
    export default {
        name: 'index',
        data:()=>{
            return{
                plates:"",
                trending:""
            }
        },
        created() {
          getPlate().then(rep=>{
              this.plates=rep;
          })
        },
        methods:{
            divClick(id){
                this.$router.push('/plate/'+id)
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
