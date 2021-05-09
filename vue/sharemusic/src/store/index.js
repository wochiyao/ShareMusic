import { createStore } from 'vuex'
import axios from 'axios'

export default createStore({
  state: {
    userName:"未登录",
    musics:[],
    totalMusics:[],
    types:[],
    type:'华语',
    music:'',
    comments:[],
    page:'14',
    indexPage:'1',
    indexMusic:'14',
    totalPage:'',
    pageMusic:'14',
    point:'5',
    points:'',
    musicPoint:'5.0',
  },
  mutations: {
    loginUser:function(state,param){
      state.userName=param
    },
    logout:function(state){
      state.userName="未登录"
    },
    getMusics:function(state,param){
      state.musics=param
    },
    getMusicTypes:function(state,param){
      state.types=param
    },
    setType:function(state,param){
      state.type=param
    },
    playMusic:function(state,param){
      state.music=param
    },
    setComments:function(state,param){
      state.comments=param
    },
    setTotalMusics:function(state,param){
      state.totalMusics=param
      state.musics=[""]
      if(param.length>=state.page){
        for (let index = 0; index < state.page; index++) {
          state.musics.push(state.totalMusics[index])
        }
      }else{
        for (let index = 0; index < param.length; index++) {
          state.musics.push(state.totalMusics[index])
        }
      }
      state.totalPage=Math.floor(state.totalMusics/state.page)
      state.indexPage=1
      state.indexMusic=14
    },
    setNextIndex:function(state){
      if(state.pageMusic==14){
        state.indexPage=state.indexPage*1+1;
        state.musics=[""]
        let index=0
        state.pageMusic=1
        for (index = state.indexMusic; index < state.totalMusics.length; index++) {
          state.musics.push(state.totalMusics[index])
          state.pageMusic++
        }
        state.indexMusic=index
      }
    },
    nextMusic:function(state,param){
      if(param+1!=state.totalMusics.length)
        state.music=state.totalMusics[param*1+1]
    },
    prevMusic:function(state,param){
      if(param!=0)
        state.music=state.totalMusics[param*1-1]
    },
    setPrevIndex:function(state){
      if(state.indexPage!=1){
        state.indexPage=state.indexPage*1-1;
        state.musics=[""]
        let index=0
        for (index = state.indexMusic-state.pageMusic*1+1-state.page; index < state.page; index++) {
          state.musics.push(state.totalMusics[index])
        }
        state.pageMusic=14
        state.indexMusic=index
      }
    },
    setPoint:function(state,param){
      if(param!=''){
        state.point=param
      }else{
        state.point=5
      }
      
    },
    setPoints:function(state,param){
      if(param.length!=0){
        state.points=param
        var totalPoint=0
        for (let index = 0; index < param.length; index++) {
          totalPoint = param[index].point*1+totalPoint*1;
        }
        state.musicPoint=totalPoint/param.length
        state.musicPoint=state.musicPoint.toFixed(1)
      }else{
        state.musicPoint=5.0
        state.musicPoint=state.musicPoint.toFixed(1)
      }
      
    }
  },
  actions: {
    loginCheck:function(context,info){
      axios({
        url:'http://localhost:8080/ShareMusic/LoginServlet',
        methods:'get',
        params:{user:info.user,pwd:info.pwd}
      }).then(function(resp){
        if(resp.data===info.user+"loginSuccessful"){
          context.commit("loginUser",info.user)
          info.router.push({ path: '/index' })
        }else{
          alert("登录失败")
        }
      })
    },
    register:function(context,info){
      axios({
        url:'http://localhost:8080/ShareMusic/RegisterServlet',
        methods:'get',
        params:{user:info.user,pwd:info.pwd}
      }).then(function(resp){
        if(resp.data===info.user+"registerSuccessful"){
          context.commit("loginUser",info.user)
          info.router.push({ path: '/index' })
        }else{
          alert("注册失败")
        }
      })
    },
    getMusicInfo:function(context){
      axios({
        url:'http://localhost:8080/ShareMusic/GetMusicServlet',
        methods:'get',
        params:{type:this.state.type}
      }).then(function(resp){
        context.commit("setTotalMusics",resp.data)
      })
    },
    getMusicType:function(context){
      axios({
        url:'http://localhost:8080/ShareMusic/GetMusicTypeServlet',
        methods:'get',
      }).then(function(resp){
        context.commit("getMusicTypes",resp.data)
      })
    },
    getComments:function(context){
      axios({
        url:'http://localhost:8080/ShareMusic/GetMusicCommentServlet',
        methods:'get',
        params:{mid:this.state.music.id}
      }).then(function(resp){
        context.commit("setComments",resp.data)
      })
    },
    upComment:function(context,info){
      axios({
        url:'http://localhost:8080/ShareMusic/SetMusicCommentServlet',
        methods:'get',
        params:{context:info.userComment,commentator:this.state.userName,mid:this.state.music.id,point:this.state.point}
      })
    },
    getPoint:function(context){
      axios({
        url:'http://localhost:8080/ShareMusic/GetMusicPointServlet',
        methods:'get',
        params:{mid:this.state.music.id,userName:this.state.userName}
      }).then(function(resp){
        context.commit("setPoint",resp.data)
      })
    },
    getPoints:function(context){
      axios({
        url:'http://localhost:8080/ShareMusic/GetMusicPointsServlet',
        methods:'get',
        params:{mid:this.state.music.id}
      }).then(function(resp){
        context.commit("setPoints",resp.data)
      })
    },
    search:function(context,info){
      axios({
        url:'http://localhost:8080/ShareMusic/SearchMusicServlet',
        methods:'get',
        params:{search:info.search}
      }).then(function(resp){
        context.commit("setTotalMusics",resp.data)
        info.router.push({path:'/Search'})
      })
    },
    setPlayCount:function(){
      axios({
        url:'http://localhost:8080/ShareMusic/SetPlayCountServlet',
        methods:'get',
        params:{id:this.state.music.id}
      })
    }
  },
  modules: {
  }
})
