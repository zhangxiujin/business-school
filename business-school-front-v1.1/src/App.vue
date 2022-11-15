<script setup>
import { RouterLink, RouterView } from 'vue-router'
// import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
  <header>
    <!--<img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />-->

    <!--<div class="wrapper">-->
      <!--<HelloWorld msg="You did it!" />-->

      <!--<nav>-->
        <!--<RouterLink to="/">Home</RouterLink>-->
        <!--<RouterLink to="/about">About</RouterLink>-->
      <!--</nav>-->
    <!--</div>-->
    <div class="nav" v-show="ifShowNav">
      <div class="item"><span><a href="/">首 页</a></span></div>
      <div class="item"><span><a href="/reward">悬 赏</a></span></div>
      <div class="search-item">
        <el-input
                style="margin-left: 100px; width: 400px;"
                v-model="input"
                placeholder="请输入要搜索的内容">

        </el-input>
      </div>
      <div class="login_item" :onclick="login" v-show="ifShowLogin"><span>登 录</span></div>
      <div class="personal-item"><span><i class="el-icon-user"></i>个人中心</span></div>
    </div>
  </header>

  <RouterView />
</template>

<script>
    export default {
        data() {
            return {
                activeIndex: '1',
                activeIndex2: '1',
                input: '',
                ifShowNav: true,
                ifShowLogin: true
            };
        },
        mounted() {
            this.ifShowNav = true;
            // if (window.location.href.split("?").length > 1) {
            //     if (window.location.href.split("?")[1] =='success=true') {
            //         this.ifShowLogin = false;
            //     }
            // }
            if (localStorage.getItem('Token') != undefined
                  && localStorage.getItem('Token') != null) {
                this.ifShowLogin = false;
            }
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },
            login() {
                this.ifShowNav = false;
                this.$router.push({name: 'login'});
                // window.location.href = window.location.href.split("/")[0] + '/login';
            },
            hiddenLoginBtn() {
                this.ifShowLogin = false;
            }
        }
    }
</script>

<style scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
}

.nav {
  /*border: 1px solid blue;*/
  height: 50px;
  width: 1440px;
  margin: 0 auto;
  background-color: #f2f2f2;
}

.nav .item {
  float: left;
  /*border: 1px solid blue;*/
  width: 100px;
  height: 100%;
  text-align: center;
  line-height: 50px;
  margin-left: 10px;
}

.nav .search-item {
  float: left;
  /*border: 1px solid blue;*/
  width: 500px;
  height: 100%;
  text-align: center;
  line-height: 50px;
  margin-left: 10px;
}

.nav .login_item {
  float: right;
  width: 100px;
  height: 100%;
  text-align: center;
  line-height: 50px;
}

.nav .personal-item {
  float: right;
  width: 100px;
  height: 100%;
  text-align: center;
  line-height: 50px;
  margin-right: 100px;
}

.nav .item, .nav .login_item:hover {
  cursor: pointer;
  color: blue;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}

/*@media (min-width: 1024px) {*/
  /*header {*/
    /*display: flex;*/
    /*place-items: center;*/
    /*padding-right: calc(var(--section-gap) / 2);*/
  /*}*/

  /*.logo {*/
    /*margin: 0 2rem 0 0;*/
  /*}*/

  /*header .wrapper {*/
    /*display: flex;*/
    /*place-items: flex-start;*/
    /*flex-wrap: wrap;*/
  /*}*/

  /*nav {*/
    /*text-align: left;*/
    /*margin-left: -1rem;*/
    /*font-size: 1rem;*/

    /*padding: 1rem 0;*/
    /*margin-top: 1rem;*/
  /*}*/
/*}*/
</style>
