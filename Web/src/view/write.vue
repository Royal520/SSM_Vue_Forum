<template>
  <div style="position: fixed">
    <!-- 标题 -->
    <el-form :inline="true" :model="article" class="demo-form-inline">
      <el-form-item label="标题">
        <el-input  class="title" v-model="article.title" placeholder="请输入标题"></el-input>
      </el-form-item>
      <el-form-item label="板块">
        <el-select v-model="article.plate" placeholder="板块">
          <el-option v-for="item in plates"  :label='item.name' :value='item.id' :key="item.id" >{{item.name}}</el-option>
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-tag
          :key="tag"
          v-for="tag in dynamicTags"
          closable
          :disable-transitions="false"
          @close="handleClose(tag)">
          {{tag}}
        </el-tag>
        <el-input
          class="input-new-tag"
          v-if="inputVisible"
          v-model="inputValue"
          ref="saveTagInput"
          size="small"
          @keyup.enter.native="handleInputConfirm"
          @blur="handleInputConfirm"
        >
        </el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showInput">+ New Tag</el-button>
      </el-form-item>

    </el-form>
    <!-- 富文本编辑框 -->
    <div id="websiteEditorElem"></div>
    <!-- 提交按钮 -->
    <div><el-button type="primary" @click='submit' class='submit'>发布</el-button></div>

  </div>

</template>

<script>
    import E from 'wangeditor'
    import {writeArticle} from "../network/article"
    import {getPlate} from "../network/plate";

    export default {
        name: 'write',
        data () {
            return {
                Editor: '',
                name: '',
                plates:'',
                article:{
                    title:'',
                    labels:[],
                    plate:'',
                    txt:''
                },
                dynamicTags: [],
                inputVisible: false,
                inputValue: ''
            }
        },
        methods: {
            // 设置保存发送后台数据事件
            submit () {
                this.article.txt=this.Editor.txt.html()
                this.article.labels=this.dynamicTags
                if(this.article.txt!=null && this.article.title!=null && this.article.plate!=null && this.article.labels!=null){
                    writeArticle(this.article).then(rep=>{
                        alert(rep)
                        if(rep=="success"){
                            this.$router.push("/user")
                        }
                    })
                }else{
                    console.log("请输入title和内容")}
            },
            handleClose(tag) {
                this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
            },

            showInput() {
                this.inputVisible = true;
                this.$nextTick(_ => {
                    this.$refs.saveTagInput.$refs.input.focus();
                });
            },

            handleInputConfirm() {
                let inputValue = this.inputValue;
                if (inputValue) {
                    this.dynamicTags.push(inputValue);
                }
                this.inputVisible = false;
                this.inputValue = '';
            }

        },



        mounted(){
            // wangeditor
            this.Editor = new E('#websiteEditorElem')
            // 创建一个富文本编辑器
            //获取板块内容
            getPlate().then(rep => {
                this.plates = rep
            })
            this.Editor.create()
            // 富文本内容
            this.Editor.txt.html()
        }

    }





</script>

<style scoped>

  .title{
    width: 300px;
    position: center;
  }
  .w-e-menu {
    z-index: 2 !important;
  }
  .w-e-text-container {
    z-index: 1 !important;
  }
  .el-form{
    z-index: 3 !important;
  }
  .el-tag + .el-tag {
    margin-left: 10px;
  }
  .button-new-tag {
    margin-left: 10px;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
    padding-bottom: 0;
  }
  .input-new-tag {
    width: 90px;
    margin-left: 10px;
    vertical-align: bottom;
  }
</style>
