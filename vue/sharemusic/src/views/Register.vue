<template>
  <LoginState/>
  <div class="login">
    <h1>注册</h1>
    <div>
        <input class="firstInput" placeholder="请输入用户名" v-model="user" /><br/>
        <input type="password" placeholder="请输入密码" v-model="pwd" /><br/>
        <input class="lastInput" type="password" placeholder="请再次输入密码" v-model="repwd" /><br/>
        <button class="loginBtn" @click="register">注册</button><br>
        已有账号？<label @click="login">登录你的账户</label>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import LoginState from '@/components/loginState.vue'
export default {
  data: function () {
    return { user: '', pwd: '' ,repwd:''}
  },
  methods: {
    login: function () {
      this.$router.push({path:'/'})
    },
    register:function () {
      if(this.pwd===this.repwd && this.user!="" && this.pwd!=""){
        this.$store.dispatch('register',{user:this.user,pwd:this.pwd,router:this.$router})
      }else{
          alert("注册失败")
      }
    }
  },
  components: {
    LoginState
  }
}
</script>