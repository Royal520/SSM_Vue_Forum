<template>
  <el-container>
    <el-header>
      <div>
      <el-menu
        :default-active="activeIndex2" class="el-menu-demo" router mode="horizontal" @select="handleSelect"
        background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
        <el-row :gutter="20">
          <el-col :span="2"><el-menu-item index="/index">首页</el-menu-item></el-col>
          <el-col :span="4" :offset="8">
            <el-menu-item><el-input class="textarea" placeholder="请输入内容" prefix-icon="el-icon-search"></el-input></el-menu-item>
<!--            <el-input class="textarea" placeholder="请输入内容" prefix-icon="el-icon-search"></el-input>-->
          </el-col>
          <el-col :span="2"><el-submenu index="/user">
            <template slot="title">个人中心</template>
            <el-menu-item index="/changeInfor">更改个人信息</el-menu-item>
            <el-menu-item index="/myArticle"></el-menu-item>
            <el-menu-item index="/" @click="logout()">退出</el-menu-item>
          </el-submenu></el-col>
          <el-col :span="2" ><el-menu-item index="/login">登录</el-menu-item></el-col>
          <el-col :span="2" ><el-menu-item index="/news">消息</el-menu-item></el-col>
          <el-col :span="2"><el-menu-item index="/favorite">收藏</el-menu-item></el-col>
          <el-col :span="2"><el-menu-item index="/write">创作</el-menu-item></el-col>
        </el-row>

      </el-menu>
    </div></el-header>
  </el-container>
</template>

<script>
  import {logout} from "../network/user";

  export default {
        name: "tabbar",
        data:()=>{
        return {
            // 在此自动生成
            activeIndex2: "1",
        };},
        methods: {
            // 在此自动生成
            logout:()=>logout(),
            handleSelect: function () {
                console.log()
            },
            onButtonClick: function(){}
        },
        fillter: {},
    }
</script>

<style scoped>
  .el-header{
    padding: 0px;
  }
  .el-menu-item{
    text-align: center;
  }
  #search{

  }
  .textarea >>> .el-textarea__inner{
    font-family:"Microsoft" !important;
    font-size:20px !important;
    width: 10px !important;
  }
</style>
