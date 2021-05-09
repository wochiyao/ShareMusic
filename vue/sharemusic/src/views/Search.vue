<template>
  <LoginState/>
  <div class="type">
    <h1>查询</h1>
    <hr/>
    <table>
      <th>音乐标题</th>
      <th>歌手</th>
      <th>出版时间</th>
      <tr v-for="music in musics" :key="music.id">
        <td class="playTitle" @click="play(music)">{{music.name}}</td>
        <td>{{music.singer}}</td>
        <td>{{music.time}}</td>
      </tr>
    </table><br>
    <div :class="{'changePage':!canChange}">
      <img @click="prevPage" class="prevPage" src="../assets/prevPage.png">&nbsp;
      <img @click="nextPage" class="prevPage" src="../assets/nextPage.png">
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import { mapState } from 'vuex'
import LoginState from '@/components/loginState.vue'
export default {
  data: function () {
    return { 
      canChange:true
    }
  },
  computed:{
    ...mapState(['musics']), 
    ...mapState(['totalMusics']), 
  },
  methods: {
    play:function(music){
      this.$store.commit('playMusic',music)
      this.$router.push({path:'/Music'})
      this.$store.dispatch('getComments')
      this.$store.dispatch('getPoint')
      this.$store.dispatch('getPoints')
      this.$store.dispatch('setPlayCount')
    },
    prevPage:function(){
      this.$store.commit('setPrevIndex')
    },
    nextPage:function(){
      this.$store.commit('setNextIndex')
    }
  },
  mounted:function(){
    if(this.$store.state.userName==="未登录"){
        this.$router.push({path:'/'})
        alert("还未登录！")
    }else{
      //this.$store.dispatch('getMusicType')
      //this.$store.dispatch('getMusicInfo')
      //this.$store.commit('setType',this.choiceType)
      const _this=this
      setTimeout(function(){
        if(_this.totalMusics.length>14){
          _this.canChange=true
        }else{
          _this.canChange=false
        }
      },200)
    }
  },
  components: {
    LoginState
  }
}
</script>
<style>
    .playTitle:hover{
      cursor: pointer;
      color:rgb(56, 177, 252);
      text-decoration: underline;
    }
    .prevPage:hover{
      cursor: pointer;
    }
    .prevPage:active{
      cursor: pointer;
      opacity: 0.6;
    }
    .changePage{
      display: none;
    }
</style>