<template>
    <audio id="music" :src="musicSrc" autoplay preload="auto"></audio>
    <div @mousemove="Get" @mouseup="cancleSelect">
        <LoginState/>
        <div class="play" :style="heightStyle">
            <h1>评论</h1>
            <div class="mode">
                <div class="modeTitle">MODE:</div>&nbsp;
                <img @mousemove="writeComment" class="commentMode" src="../assets/comment.png">&nbsp;
                <img @mousemove="seeComment" class="commentMode" src="../assets/seekComment.png">
            </div>
            <div class="returnMenu">
                <img @click="returnMenu" class="menu" src="../assets/menu.png">
                <div class="menuTitle">返回上一页</div>
            </div>
            <hr>
            <div :style="writeMode">
                <textarea id="commentInput" placeholder="说点什么好呢......" maxlength="132" v-model="userComment"/><br>
                <button @click="upComment">评论</button><br>
                <img class="Point" @mousemove="onePoint" :src="onePointSrc">
                <img class="Point" @mousemove="twoPoint" :src="twoPointSrc">
                <img class="Point" @mousemove="threePoint" :src="threePointSrc">
                <img class="Point" @mousemove="fourPoint" :src="fourPointSrc">
                <img class="Point" @mousemove="fivePoint" :src="fivePointSrc">
                <br>您当前评分：{{this.$store.state.point}}<br>
                <label class="tip">*评论后的评分才有效</label>
            </div>
            <div id="seeComment" :style="seeMode">
                <div v-for="comment in comments" :key="comment.id">
                    <div class="commentContext"><label style="color:rgb(0, 119, 255)">{{comment.commentator}}</label>: {{comment.context}}</div><br>
                    <div class="commentTime">{{comment.time}}</div>
                    <br>
                </div >
            </div>
        </div>
        <div class="playItem">
            <div class="infoDiv"> 
                <table>
                    <tr><td class="musicTitle">{{this.$store.state.music.name}}</td></tr>
                    <tr><td class="musicSinger">{{this.$store.state.music.singer}}</td></tr>
                </table>
            </div>
            <div class="controlDiv">
                <img id="lastBtn" @click="prevMusic" src="../assets/last.png"/>
                <img id="playBtn" @click="playAudio" :src="playURL"/>
                <img id="nextBtn" @click="nextMusic" src="../assets/next.png"/>
            </div>
            <div class="pointDiv">
                评分：{{this.$store.state.musicPoint}}
            </div>
            <div class="progressDiv">
                <label class="current">
                    {{currentTime}}
                </label>
                <div id="progressBar" @click="select">
                    <div id="currentBar" :style="widthStyle"></div>
                    <button id="selectCircle" @mousedown="selectTime" @mouseup="cancleSelect" src="../assets/circle.png"></button>
                </div>
                <label class="duration">
                    {{durationTime}}
                </label>
            </div>
        </div>
    </div>
</template>

<script>
// @ is an alias to /src
import LoginState from '@/components/loginState.vue'
import pauseImg from '@/assets/pause.png'
import playImg from '@/assets/play.png'
import { mapState } from 'vuex'
import noPointImg from '@/assets/noPoint.png'
import choosePointImg from '@/assets/choosePoint.png'
export default {
  data: function () {
    return { 
        isPlay:true,
        playURL:playImg,
        currentTime:'00:00',
        interval:'',
        durationTime:'00:00',
        widthStyle:{
            width:'0px'
        },
        isSelectTime:false,
        x:'',
        musicSrc:'',
        writeMode:{
            display:'inherit'
        },
        seeMode:{
            display:'none'
        },
        heightStyle:{
            height:'550px'
        },
        userComment:'',
        onePointSrc:choosePointImg,
        twoPointSrc:this.$store.state.point>=2?choosePointImg:noPointImg,
        threePointSrc:this.$store.state.point>=3?choosePointImg:noPointImg,
        fourPointSrc:this.$store.state.point>=4?choosePointImg:noPointImg,
        fivePointSrc:this.$store.state.point>=5?choosePointImg:noPointImg,
     }
  },
  computed:{
    ...mapState(['comments']), 
    ...mapState(['totalMusics']), 
  },
  mounted:function(){
    const _this=this
    this.musicSrc=this.$store.state.music.url
    setTimeout(function(){
    var audio=document.getElementById('music')
    if(Math.ceil(Math.floor(audio.duration)/60)<10){
        _this.durationTime="0"+Math.floor(Math.ceil(audio.duration)/60)+":"
    }else{
        _this.durationTime=Math.floor(Math.ceil(audio.duration)/60)+":"
    }
    if(Math.ceil(audio.duration)%60<10){
        _this.durationTime+="0"+(Math.ceil(audio.duration))%60
    }else{
        _this.durationTime+=(Math.ceil(audio.duration))%60
    }
    if(_this.$store.state.point>=2){
        _this.twoPointSrc=choosePointImg
    }
    if(_this.$store.state.point>=3){
        _this.threePointSrc=choosePointImg
    }
    if(_this.$store.state.point>=4){
        _this.fourPointSrc=choosePointImg
    }
    if(_this.$store.state.point>=5){
        _this.fivePointSrc=choosePointImg
    }
    _this.playURL=pauseImg
    _this.getCurrentTime()
    _this.interval=setInterval(_this.getCurrentTime,1000); 
    },1000);
  },
  unmounted:function(){
    clearInterval(this.interval)
  },
  methods: {
    playAudio:function(){
        var audio=document.getElementById('music')
        if(this.isPlay==false){
            if(audio.readyState==4){
                audio.play()
                this.isPlay=true
                this.playURL=pauseImg
                this.interval=setInterval(this.getCurrentTime,1000); 
            }
        }else{
            audio.pause()
            this.isPlay=false
            this.playURL=playImg
        }
    },
    getCurrentTime:function(){
        const _this=this
        var currentTime=document.getElementById('music').currentTime
        if(Math.ceil(Math.floor(currentTime)/60)<10){
            _this.currentTime="0"+Math.floor(Math.ceil(currentTime)/60)+":"
        }else{
            _this.currentTime=Math.floor(Math.ceil(currentTime)/60)+":"
        }
        
        if(Math.ceil(currentTime)%60<10){
            _this.currentTime+="0"+(Math.ceil(currentTime))%60
        }else{
            _this.currentTime+=(Math.ceil(currentTime))%60
        }
        if(this.isSelectTime==false){
            this.widthStyle.width=document.getElementById('music').currentTime/document.getElementById('music').duration*1000+"px"
        }
        if(currentTime==document.getElementById('music').duration){
            this.playURL=playImg
            this.currentTime="00:00"
            this.widthStyle.width="0px"
            this.isPlay=false
        }
    },
    selectTime:function(){
        this.isSelectTime=true
    },
    cancleSelect:function(){
        if(this.isSelectTime==true){
            var audio=document.getElementById('music')
            audio.currentTime=this.x/1000*audio.duration
            this.getCurrentTime()
        }
        this.isSelectTime=false
    },
    Get:function(e){
        if(this.isSelectTime==true){
            if(e.clientX-document.getElementById('progressBar').offsetLeft<=1000 && e.clientX-document.getElementById('progressBar').offsetLeft>=0){
                this.widthStyle.width=e.clientX-document.getElementById('progressBar').offsetLeft+"px"
                this.x=e.clientX-document.getElementById('progressBar').offsetLeft
            }
        }
    },
    returnMenu:function(){
        this.$router.go(-1)
    },
    writeComment:function(){
        this.writeMode.display="inherit"
        this.seeMode.display="none"
        this.heightStyle.height=550+"px"
    },
    seeComment:function(){
        this.writeMode.display="none"
        this.seeMode.display="inherit"
        this.$store.dispatch('getComments')
        if(document.getElementById('seeComment').clientHeight>269){
            this.heightStyle.height=64*this.comments.length+150+"px"
        }
    },
    upComment:function(){
        if(this.userComment!==''){
            this.$store.dispatch("upComment",{userComment:this.userComment})
            alert("提交成功")
        }
    },
    nextMusic:function(){
        var index=0;
        const _this=this
        this.totalMusics.find(function(ele){
            if(ele.id!=_this.$store.state.music.id){
                index+=1
            }else{
                _this.$store.commit("nextMusic",index)
                var audio=document.getElementById('music')
                setTimeout(function(){
                    _this.musicSrc=_this.$store.state.music.url
                    _this.playURL=pauseImg
                    _this.$store.dispatch('getPoints')
                    _this.$store.dispatch('getPoint')
                    _this.$store.dispatch('setPlayCount')
                },100)
                setTimeout(function(){
                    if(_this.$store.state.point==1){
                        _this.onePoint()
                    }
                    if(_this.$store.state.point==2){
                        _this.twoPoint()
                    }
                    if(_this.$store.state.point==3){
                        _this.threePoint()
                    }
                    if(_this.$store.state.point==4){
                        _this.fourPoint()
                    }
                    if(_this.$store.state.point==5){
                        _this.fivePoint()
                    }
                    if(Math.ceil(Math.floor(audio.duration)/60)<10){
                        _this.durationTime="0"+Math.floor(Math.ceil(audio.duration)/60)+":"
                    }else{
                        _this.durationTime=Math.floor(Math.ceil(audio.duration)/60)+":"
                    }
                    if(Math.ceil(audio.duration)%60<10){
                        _this.durationTime+="0"+(Math.ceil(audio.duration))%60
                    }else{
                        _this.durationTime+=(Math.ceil(audio.duration))%60
                    }
                },500)
                setTimeout(function(){
                    if(Math.ceil(Math.floor(audio.duration)/60)<10){
                        _this.durationTime="0"+Math.floor(Math.ceil(audio.duration)/60)+":"
                    }else{
                        _this.durationTime=Math.floor(Math.ceil(audio.duration)/60)+":"
                    }
                    if(Math.ceil(audio.duration)%60<10){
                        _this.durationTime+="0"+(Math.ceil(audio.duration))%60
                    }else{
                        _this.durationTime+=(Math.ceil(audio.duration))%60
                    }
                },3000)
                return true
            }
        })
    },
    prevMusic:function(){
        var index=0;
        const _this=this
        this.totalMusics.find(function(ele){
            if(ele.id!=_this.$store.state.music.id){
                index+=1
            }else{
                console.log("2")
                _this.$store.commit("prevMusic",index)
                var audio=document.getElementById('music')
                _this.$store.dispatch('setPlayCount')
                setTimeout(function(){
                    _this.playURL=pauseImg
                    _this.musicSrc=_this.$store.state.music.url
                    _this.$store.dispatch('getPoints')
                    _this.$store.dispatch('getPoint')
                },100)
                setTimeout(function(){
                    if(_this.$store.state.point==1){
                        _this.onePoint()
                    }
                    if(_this.$store.state.point==2){
                        _this.twoPoint()
                    }
                    if(_this.$store.state.point==3){
                        _this.threePoint()
                    }
                    if(_this.$store.state.point==4){
                        _this.fourPoint()
                    }
                    if(_this.$store.state.point==5){
                        _this.fivePoint()
                    }
                    if(Math.ceil(Math.floor(audio.duration)/60)<10){
                        _this.durationTime="0"+Math.floor(Math.ceil(audio.duration)/60)+":"
                    }else{
                        _this.durationTime=Math.floor(Math.ceil(audio.duration)/60)+":"
                    }
                    if(Math.ceil(audio.duration)%60<10){
                        _this.durationTime+="0"+(Math.ceil(audio.duration))%60
                    }else{
                        _this.durationTime+=(Math.ceil(audio.duration))%60
                    }
                },500)
                setTimeout(function(){
                    var audio=document.getElementById('music')
                    if(Math.ceil(Math.floor(audio.duration)/60)<10){
                        _this.durationTime="0"+Math.floor(Math.ceil(audio.duration)/60)+":"
                    }else{
                        _this.durationTime=Math.floor(Math.ceil(audio.duration)/60)+":"
                    }
                    if(Math.ceil(audio.duration)%60<10){
                        _this.durationTime+="0"+(Math.ceil(audio.duration))%60
                    }else{
                        _this.durationTime+=(Math.ceil(audio.duration))%60
                    }
                },3000)
            }
        })
    },
    onePoint:function(){
        this.onePointSrc=choosePointImg
        this.twoPointSrc=noPointImg
        this.threePointSrc=noPointImg
        this.fourPointSrc=noPointImg
        this.fivePointSrc=noPointImg
        this.$store.commit('setPoint',1)
    },
    twoPoint:function(){
        this.onePointSrc=choosePointImg
        this.twoPointSrc=choosePointImg
        this.threePointSrc=noPointImg
        this.fourPointSrc=noPointImg
        this.fivePointSrc=noPointImg
        this.$store.commit('setPoint',2)
    },
    threePoint:function(){
        this.onePointSrc=choosePointImg
        this.twoPointSrc=choosePointImg
        this.threePointSrc=choosePointImg
        this.fourPointSrc=noPointImg
        this.fivePointSrc=noPointImg
        this.$store.commit('setPoint',3)
    },
    fourPoint:function(){
        this.onePointSrc=choosePointImg
        this.twoPointSrc=choosePointImg
        this.threePointSrc=choosePointImg
        this.fourPointSrc=choosePointImg
        this.fivePointSrc=noPointImg
        this.$store.commit('setPoint',4)
    },
    fivePoint:function(){
        this.onePointSrc=choosePointImg
        this.twoPointSrc=choosePointImg
        this.threePointSrc=choosePointImg
        this.fourPointSrc=choosePointImg
        this.fivePointSrc=choosePointImg
        this.$store.commit('setPoint',5)
    },
    select:function(e){
        if(e.clientX-document.getElementById('progressBar').offsetLeft<=1000 && e.clientX-document.getElementById('progressBar').offsetLeft>=0){
            this.widthStyle.width=e.clientX-document.getElementById('progressBar').offsetLeft+"px"
            this.x=e.clientX-document.getElementById('progressBar').offsetLeft
        }else if(e.clientX-document.getElementById('progressBar').offsetLeft>1000){
            this.widthStyle.width=1000+"px"
            this.x=1000
        }
        var audio=document.getElementById('music')
        audio.currentTime=this.x/1000*audio.duration
        this.getCurrentTime()
    }
  },
  components: {
    LoginState
  }
}
</script>
<style>
    .playItem{
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100px;
        position: fixed;
        background-color: rgba(0,0,0,0.1);
    }
    #lastBtn{
        margin-right: 10px;
        margin-bottom: 6px;
    }
    #lastBtn:hover{
        cursor: pointer;
    }
    #playBtn{
        margin-top: 10px;
    }
    #playBtn:hover{
        cursor: pointer;
    }
    #nextBtn{
        margin-left: 10px;
        margin-bottom: 6px;
    }
    #nextBtn:hover{
        cursor: pointer;
    }
    #progressBar{
        width: 1014px;
        height: 3px;
        background: grey;
        margin-right: auto;
        margin-left: auto;
    }
    .progressDiv{
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 15px;
    }
    .current{
        float: left;
        width: 0px;
        font-size: 18px;
        font-weight: lighter;
        margin-top: -9px;
        margin-left: -8px;
    }
    .duration{
        float: right;
        width: 0px;
        font-size: 18px;
        font-weight: lighter;
        margin-top: -13px;
        margin-right: 38px;
    }
    #currentBar{
        width: 0px;
        height: 3px;
        background: rgb(0, 174, 255);
        margin-right: auto;
        margin-left: auto;
        float: left;
    }
    #selectCircle{
        float: left;
        width: 16px;
        height: 16px;
        border: 0px;
        border-radius: 8px;
        margin-top: -6px;
        margin-left: -2px;
        background-image: url("../assets/circle.png");
        outline:none;
    }
    #selectCircle:hover{
        cursor: pointer;
    }
    #selectCircle:active{
        cursor:pointer;
        border: 0px;
        outline:none;
    }
    .musicTitle{
        font-weight: lighter;
        font-size: 30px;
    }
    .musicSinger{
        font-weight: lighter;
        font-size: 15px;
    }
    .controlDiv{
        width: 500px;
        margin-left: auto;
        margin-right: auto;
    }
    .infoDiv{
        float: left;
        margin-top: 15px;
        margin-left: 30px;
    }
    #commentInput{
        width: 380px;
        height: 100px;
        resize:none;
        font-size: 18px;
        background-color: white;
        border:1.1px solid;
        border-color: rgb(175, 175, 175);
        font-weight: lighter;
        border-radius: 12px;
        padding: 10px;
        margin-top: 60px;
    }
    #commentInput:focus{
    outline: none;
    border-color: rgb(0, 119, 255);  
    }
    .play button{
        border: 1.1px solid;
        border-radius: 7px;
        background: #2ea44f;
        color: white;
        outline: none;
        width: 80px;
        height: 35px;
        font-weight: lighter;
        font-size: 18px;
        margin-top: 40px;
        margin-bottom: 40px;
    }
    .play button:hover{
        cursor: pointer;
    }
    .play button:active{
        cursor: pointer;
        opacity: 0.7;
    }
    .commentMode{
        margin-top: 0px;
        
    }
    .commentMode:hover{
        cursor: pointer;
    }
    .mode{
        float: left;
        margin-top: -25px;
        margin-left: 10px;
    }
    .modeTitle{
        float: left;
        margin-top: 1px;
    }
    .menu{
        margin-top: 5px;
    }
    .menu:hover{
        cursor: pointer;
    }
    .returnMenu{
        float: right;
        margin-top: -29px;
    }
    .menuTitle{
        float: right;
        margin-top: 4px;
        margin-right: 10px;
    }
    #seeComment{
        width: 440px;
        margin-left: auto;
        margin-right: auto;
    }
    .commentTime{
        float: right;
        border-bottom: 1px solid;
        border-color: rgb(194, 193, 193);
        width: 440px;
        text-align: right;
    }
    .commentContext{
        float: left;
        text-align: left;
        margin-top: 15px;
    }
    .Point{
        margin-left: 5px;
        margin-right: 5px;
    }
    .pointDiv{
        float: right;
        font-size: 30px;
        margin-right: 30px;
        margin-top: -30px;
    }
    .tip{
        font-size: 12px;
        opacity: 0.7;
    }
</style>