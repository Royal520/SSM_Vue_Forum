<template>
  <div class="login-wrapper">
    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item  prop="name">
        <el-input class="text-input" placeholder="用户名" v-model="ruleForm.name" prefix-icon="el-icon-user-solid"
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

      <el-form-item >
        <el-input class="text-input" type="text" placeholder="电话号码" v-model="ruleForm.phone"
                  prefix-icon="el-icon-phone" autocomplete="off"></el-input>
      </el-form-item>

      <el-form-item >
        <el-input class="text-input" type="text" placeholder="邮箱" v-model="ruleForm.mail"
                  prefix-icon="el-icon-mail" autocomplete="off"></el-input>
      </el-form-item>


      <el-form-item>
        <el-button type="primary" round class="errorbutton" @click="submitForm('ruleForm')">修改</el-button>
      </el-form-item>
    </el-form>
    {{$store.state.user}}
  </div>
</template>

<script>

    import {getUserDetail,updateUser,checkName} from "../network/user";

    export default {
        name: 'changeInfor',
        data() {
            var checkName =async (rule, value, callback) => {
                let regExp = /^[a-zA-Z0-9_\u4e00-\u9fa5-]{1,7}$/
                if (!value) {
                    return callback(new Error('用户名不能为空'));
                }else if(!regExp.test(value)){
                    return callback(new Error('用户名过长'));
                }else if (value!=this.username && await this.existName(value)) {
                    callback(new Error('用户名已存在'));
                } else {
                    callback();
                }
            };
            var validatePass = (rule, value, callback) => {
                var regex = new RegExp('(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[^a-zA-Z0-9]).{8,16}');
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else if (!regex.test(value)) {
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
                    name: '',
                    phone:'',
                    mail:''
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
                username: '',
                password: '',
                verifiCode: '',
                exits:false
            };
        },
        mounted () {
            getUserDetail().then(rep=>{
                if(rep!=""){
                    console.log(rep +"不是null")
                    this.ruleForm.name=rep.username
                    this.ruleForm.phone=rep.phone
                    this.ruleForm.mail=rep.mail
                    this.username=rep.username
                }else{
                    console.log(rep + "null")
                    this.$router.push('/login')
                }
            })
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        console.log(this.ruleForm)
                        let param = new URLSearchParams()
                        param.append('username', this.ruleForm.name)
                        param.append('password',this.ruleForm.pass)
                        param.append('phone',this.ruleForm.phone)
                        param.append('mail',this.ruleForm.mail)
                        updateUser(param).then(data=>{
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
            existName:async (name)=>{
                await checkName(name).then(data=>{
                    if(data=="error") this.exits=true
                    else this.exits=false
                })
                return this.exits
            },
        }
    }
</script>

<style scoped>

  body{ text-align:center}
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
