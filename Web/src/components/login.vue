<template>
  <div class="login-backend">
    <div class="login-wrapper" v-if="toLogin">
        <el-input class="text-input"
                  placeholder="用户名"
                  v-model="username"
                  prefix-icon="el-icon-user-solid"
                  clearable>
        </el-input>
        <el-input class="text-input"
                  placeholder="请输入密码"
                  v-model="password"
                  type="password"
                  prefix-icon="el-icon-view">
        </el-input>
        <el-button type="primary" round class="errorbutton" @click="login">登录</el-button>
        <el-button type="success" round class="errorbutton" @click="changeType">注册</el-button>
    </div>
    <div class="login-wrapper" v-else>
<!--      <el-link type="success" class="login-tip" @click="changeType">已有账号？去登陆</el-link>-->
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item  prop="name">
          <el-input class="text-input" placeholder="你的昵称" v-model="ruleForm.name" prefix-icon="el-icon-user-solid"
                    auto-complete="off" clearable>
          </el-input>
        </el-form-item>
        <el-form-item  prop="pass">
          <el-input class="text-input" type="password" placeholder="密码" v-model="ruleForm.pass"
                    prefix-icon="el-icon-view" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item  prop="checkPass">
          <el-input class="text-input" type="password" placeholder="确认密码" v-model="ruleForm.checkPass"
                    prefix-icon="el-icon-view" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item>
                      <el-button type="primary" round class="errorbutton" @click="submitForm('ruleForm')">注册</el-button>
<!--                      <el-button @click="resetForm('ruleForm')">重置</el-button>-->
                      <el-button type="success" round class="errorbutton" @click="changeType">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>

        import axios from 'axios'
        export default {
            name: 'login',
            data() {
                var checkName =async (rule, value, callback) => {
                    let regExp = /^[a-zA-Z0-9_\u4e00-\u9fa5-]{1,7}$/
                    if (!value) {
                        return callback(new Error('用户名不能为空'));
                    }else if(!regExp.test(value)){
                        return callback(new Error('用户名过长'));
                    }else if ( await this.existName(value)) {
                                  callback(new Error('用户名已存在'));
                              } else {
                                      callback();
                              }
                };
                var validatePass = (rule, value, callback) => {
                    var regex = new RegExp('(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[^a-zA-Z0-9]).{8,16}');
                    if (value === '') {
                        callback(new Error('请输入密码'));
                    }else if(!regex.test(value)){
                        callback(new Error('应含字母、数字、特殊字符且长度在8-16位'));
                    } else {
                        if (this.ruleForm.checkPass !== '') {
                            this.$refs.ruleForm.validateField('checkPass');
                        }
                        callback();
                    }
                };
                var validatePass2 = (rule, value, callback) => {
                    if (value === '') {
                        callback(new Error('请再次输入密码'));
                    } else if (value !== this.ruleForm.pass) {
                        callback(new Error('两次输入密码不一致!'));
                    } else {
                        callback();
                    }
                };
                return {
                    ruleForm: {
                        pass: '',
                        checkPass: '',
                        name: ''
                    },
                    rules: {
                        pass: [
                            { validator: validatePass, trigger: 'blur' }
                        ],
                        checkPass: [
                            { validator: validatePass2, trigger: 'blur' }
                        ],
                        name: [
                            { validator: checkName, trigger: 'blur' }
                        ]
                    },
                    toLogin: true,
                    username: '',
                    password: '',
                    phone: '',
                    verifiCode: '',
                    exits:false
                };
            },
            mounted () {
                this.toLogin = this.$route.query.type
            },
            methods: {
                submitForm(formName) {
                    this.$refs[formName].validate((valid) => {
                        if (valid) {
                            let param = new URLSearchParams()
                            param.append('username', this.ruleForm.name)
                            param.append('password',this.ruleForm.pass)
                            axios({
                                url:'http://127.0.0.1:8080/user/register',
                                method:'post',
                                data:param,
                            }).then(data=>{
                                this.$router.push('/index')
                            }).catch()
                        } else {
                            console.log('error submit!!');
                            return false;
                        }
                    });
                },
                resetForm(formName) {
                    this.$refs[formName].resetFields();
                },
                login () {
                    if(this.username==''||this.password==''){
                        this.message="请输入用户名和密码"
                    }
                    else{
                        let param = new URLSearchParams()
                        param.append('username', this.username)
                        param.append('password', this.password)
                        axios( {method: 'post',
                            url: 'http://127.0.0.1:8080/user/Login',
                            data: param}).then(data=>{
                            if(data.data=="success"){
                                // 这里是需要请求后台进行验证，然后根据结果是否登陆成功。
                                //1.存储登录状态
                                //2.重定向到上一页
                                // this.$store.dispatch('login/login')
                                this.$router.push({ path: '/' })
                                console.log(data)
                            }else{
                                console.log("错误")
                            }
                        })

                    }

                },
                existName:async (name)=>{
                    console.log("begin"+this.name)
                    this.name=false
                    let param = new URLSearchParams()
                    param.append('username', name)
                    await axios( {method: 'post',
                        url: 'http://127.0.0.1:8080/user/checkName',
                        data: param}).then((data)=>{
                            if(data.data=="error"){
                                console.log("用户名存在")
                                this.exits=true
                                console.log(this.exits)
                            }else{
                                this.exits=false
                                console.log("after no "+ this.exits)

                            }
                    })
                    console.log("finall "+this.exits)
                    return this.exits
                },
                changeType () {
                    this.toLogin = !this.toLogin
                }
            }
        }
</script>

<style scoped >
  body{ text-align:center}
    .login-backend {
        width: 100%;
        height: 100%;
        padding-top: 0px;
      }
      .login-wrapper {
        text-align: center; /*让div内部文字居中*/
        background-color: #fff;
        border-radius: 20px;
        width: 300px;
        height: 350px;
        margin: auto;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
      }

    .el-input{
      /*width: 350px;*/
      position: center;
    }
    .login-button{
      margin-top: 50px;
      width: 100%;
    }

    .errorbutton{
      margin-top: 50px;
    }

      .login-tip{
             margin-top: 10px;
             float: right;
           }
</style>
