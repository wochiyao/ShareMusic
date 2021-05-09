<template>
    <div class="loginDiv">
        <div class="logoutDiv">退出</div>
        <div class="imageDiv" ><img class="logout" src="../assets/logout.png" @click="logout"/> </div>
        <div class="nameDiv">{{userName}}</div>
        <div class="imageDiv"><img class="user" src="../assets/user.png"> </div>
        <div @click="this.$router.push({path:'/'})" class="titleDiv">共享音乐网</div>
        <div class="searchDiv">
            <input v-model="search" placeholder="输入你想找的歌"/><button @click="searchMusic">查找</button>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
    data: function () {
    return { 
      search:''
    }
  },
    computed:{
        ...mapState(['userName']), 
    },
    methods:{
        logout:function(){
            if(this.userName!=="未登录"){
                this.$store.commit('logout')
                this.$router.push({path:'/'})
                alert("已退出登录")
            }else{
                alert("您还未登录")
            }
        },
        searchMusic:function(){
            this.$store.dispatch('search',{search:this.search,router:this.$router})
        },
    }
}
</script>
<style>
    .loginDiv{
        top: 0;
        left: 0;
        width: 100%;
        height: 60px;
        background-color: rgba(0,0,0,0.1);
        position: fixed;
        
    }
    .imageDiv{
        margin-top: 15px;
        float: right;
        margin-right: 3px;
    }
    .nameDiv{
        margin-top: 18px;
        height: 50px;
        float: right;
        margin-right: 1%;
        font-weight:lighter;
        font-size: 20px;
    }
    .titleDiv{
        font-weight:lighter;
        font-size: 30px;
        float: left;
        margin-top: 8px;
        margin-left:3%;
    }
    .titleDiv:hover{
        cursor: pointer;
    }
    .logout{
        width: 32px;
        height: 32px;
    }
    .logout:hover{
        cursor: pointer;
        opacity: 0.6;
    }
    .logout:active{
        cursor: pointer;
        opacity: 1;
    }
    .logoutDiv{
        margin-top: 18px;
        width: 40px;
        height: 50px;
        float: right;
        margin-right: 5px;
        font-weight:lighter;
        font-size: 20px;
    }
    .user{
        width: 32px;
        height: 32px;
    }
    .searchDiv{
        margin-top: 10px;
    }
    .searchDiv button{
        width: 60px;
        height: 34px;
        border-radius: 7px;
        background: #2ea44f;
        color: white;
        outline: none;
        margin-left: 5px;
    }
    .searchDiv button:hover{
        cursor: pointer;
    }
    .searchDiv button:active{
        opacity: 0.7;
    }
</style>