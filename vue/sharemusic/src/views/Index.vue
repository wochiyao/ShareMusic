<template>
  <LoginState/>
  <div class="type">
    <h1>分类</h1>
    <template v-for="type in types" :key="type.id">
      <label :class="isChoice[type.id-1]?'choice':''" @mouseover="chooseType(type.id)">{{type.typeName}}</label>
    </template>
    <hr/>
    <table>
      <th>音乐标题</th>
      <th>歌手</th>
      <th>出版时间</th>
      <th>播放次数</th>
      <tr v-for="music in musics" :key="music.id">
        <td class="playTitle" @click="play(music)">{{music.name}}</td>
        <td>{{music.singer}}</td>
        <td>{{music.time}}</td>
        <td>{{music.playCount}}</td>
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
      isChoice:[true,false,false,false],
      choiceType:"华语",
      canChange:true
    }
  },
  computed:{
    ...mapState(['types']), 
    ...mapState(['musics']), 
    ...mapState(['totalMusics']), 
  },
  methods: {
    chooseType:function(type){
      for(var i=0;i<this.types.length;i++){
        if(i!=type-1){
          this.isChoice[i]=false
        }else{
          this.isChoice[type-1]=true
        }
      }
      for(var j=0;j<this.types.length;j++){
        if(this.isChoice[j]==true){
          this.choiceType=this.types[j].typeName
        }
      } 
      this.$store.commit('setType',this.choiceType)
      this.$store.dispatch('getMusicInfo')
      const _this=this
      setTimeout(function(){
        if(_this.totalMusics.length>14){
          _this.canChange=true
        }else{
          _this.canChange=false
        }
      },10)
    },
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
      this.$store.dispatch('getMusicType')
      this.$store.dispatch('getMusicInfo')
      this.$store.commit('setType',this.choiceType)
    }
  },
  components: {
    LoginState
  }
}
</script>
<style>
    .type table{
      width: 600px;
    }
    .type label{
      margin-left: 20px;
      margin-right: 20px;
      font-size: 20px;
    }
    .choice{
      color:rgb(56, 177, 252);
    }
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