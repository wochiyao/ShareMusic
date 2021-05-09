<template>
  <div class="body">
  <router-view/>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.body{
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  position:fixed;
  background: #f8f8f8;
  overflow-x: auto;
}
h1{
  color:#2f2f2f;
  font-weight: lighter;
}
input{
  width: 288px;
  height: 32px;
  font-size: 16px;
  background-color: white;
  border:1.1px solid;
  border-color: #c2c2c2;
  outline: none;
  border-radius: 7px;
  padding-left: 12px;
}
input:focus{
    outline: none;
    border-color: rgb(0, 119, 255);  
}
.login{
  width: 350px;
  margin-top: 140px;
  height: 310px;
  margin-left: auto;
  margin-right: auto;
  border:1px solid;
  border-color: #c2c2c2;
  background-color:white;
  border-radius: 20px;
  font-weight: lighter;
}
.login .loginBtn{
  width: 305px;
  height: 40px;
  border: 1.1px solid;
  border-radius: 7px;
  background-color: #2ea44f;
  color: white;
  margin-top: 10px;
  background: #2ea44f;
  font-weight:lighter;
  font-size: 16px;
  margin-bottom: 15px;
}
.login .loginBtn:hover{
    background-color: #2c974b;
    cursor: pointer;
}
.login .loginBtn:focus{
    outline: none;
}
.login .loginBtn:active{
    background-color: #2ea44f;
}
.login label{
  color: rgb(0, 119, 255);
  
}
.login label:hover{
  cursor: pointer;
  text-decoration:underline;
}
.firstInput{
  margin-top: 10px;
}
.lastInput{
  margin-bottom: 10px;
}
.type{
  width: 600px;
  margin-top: 140px;
  height: 600px;
  margin-left: auto;
  margin-right: auto;
  border:1px solid;
  border-color: #c2c2c2;
  background-color:white;
  border-radius: 20px;
  font-weight: lighter;
}
.play{
  width: 600px;
  margin-top: 140px;
  height: 550px;
  margin-left: auto;
  margin-right: auto;
  border:1px solid;
  border-color: #c2c2c2;
  background-color:white;
  border-radius: 20px;
  font-weight: lighter;
}
</style>
