<template>
  <LoginState/>
  <div class="login">
    <h1>登录</h1>
    <div>
      <input class="firstInput" placeholder="请输入用户名" v-model="user" />
      <br />
      <input class="lastInput" type="password" placeholder="请输入密码" v-model="pwd" />
      <br />
      <button class="loginBtn" @click="check">登录</button><br>
      未有账号？<label @click="register">创建一个账户</label>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import LoginState from '@/components/loginState.vue'
export default {
  data: function () {
    return { user: '', pwd: '' }
  },
  mounted:function(){
    if(this.$store.state.userName!=="未登录"){
      this.$router.push({path:'/index'})
    }
  },
  methods: {
    check: function () {
      this.$store.dispatch('loginCheck',{user:this.user,pwd:this.pwd,router:this.$router})
    },
    register:function () {
      this.$router.push({path:'/Register'})
    }
  },
  components: {
    LoginState
  }
}
</script>
