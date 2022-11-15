<!--<script setup>-->
<!--import { RouterLink, RouterView } from 'vue-router'-->
<!--import HelloWorld from './components/HelloWorld.vue'-->
<!--</script>-->

<template>
    <!--<header>-->
    <!--<img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />-->

    <!--<div class="wrapper">-->
    <!--<HelloWorld msg="You did it!" />-->

    <!--<nav>-->
    <!--<RouterLink to="/">Home</RouterLink>-->
    <!--<RouterLink to="/about">About</RouterLink>-->
    <!--</nav>-->
    <!--</div>-->
    <!--</header>-->

    <!--<RouterView />-->
    <!--<div style="border: 1px blue solid; width: 100px; height: 100px;">-->
    <!--</div>-->

    <!--<img src="./static/imgs/background_2160_1506.png" alt="">-->
    <div id="container">
        <div id="login_form">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item>
            <span
                    style="
                    margin-top: 50px;
                    font-weight: bold;
                    font-size: 18px;"
            >
              验证码登录
            </span>
                </el-form-item>
                <br/>
                <el-form-item>
                    <el-input
                            v-model="form.phone"
                            placeholder="请输入手机号"
                            style="width: 80%; height: 120%;"
                    ></el-input>
                </el-form-item>
                <el-form-item>
                    <el-input
                            v-model="form.smsCode"
                            placeholder="请输入验证码"
                            style="width: 40%;height: 120%;"
                    ></el-input>
                    <el-button
                            type="info"
                            style="margin-left: 5px;height: 120%;"
                            @click="getCode"
                    >
                        获取验证码
                    </el-button>
                </el-form-item>
                <el-form-item>
                    <el-input
                            v-model="form.code"
                            placeholder="请输入图形验证码"
                            style="width: 50%;height: 120%;"
                    ></el-input>
                    <img :src="form.base64" @click="imageCode" style="width: 85px; height: 28px;">
                </el-form-item>
                <el-form-item>
                    <el-button
                            type="primary"
                            @click="login"
                            style="width: 80%;height: 120%;"
                    >
                        登 录
                    </el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
    import { userLogin } from '../api/login/login';
    import {imageVerifyCode, getSmsCode} from '../api/verify/verfiycode'

    export default {
        data() {
            return {
                form: {
                    //手机号
                    phone: null,
                    // 短信验证码
                    code: null,
                    smsCode: null,
                    base64: null,
                    imgUUID: null
                    // date1: '',
                    // date2: '',
                    // delivery: false,
                    // type: [],
                    // resource: '',
                    // desc: ''
                }
            }
        },
        created() {
            this.imageCode()
        },
        methods: {
            //用户登录方法
            login() {
                var param = {
                    username: this.form.phone,
                    smsCode: this.form.smsCode,
                    code: this.form.code,
                    uuid: this.form.imgUUID
                }
                userLogin(param).then(response => {
                    // console.log(response);
                    if (response.data != undefined && response.data != null
                        && response.data.token != undefined && response.data.token != null) {
                        localStorage.setItem('Token', response.data.token);
                    }
                    if (response.data != undefined && response.data != null
                        && response.data.user != undefined && response.data.user != null) {
                        localStorage.setItem('User', response.data.user);
                    }
                    //页面跳转
                    // this.$router.push({name: 'home'})
                    if (window.location.href.indexOf('?state=expired') != -1) {
                        this.$router.go(-1);
                    } else {
                        window.location.href = window.location.href.split("/login")[0];
                    }
                });
            },
            //请求图形验证码
            imageCode() {
                imageVerifyCode().then(response => {
                    this.form.base64 = 'data:image/jpg;base64,' + response.data.imageBase64str;
                    console.log(this.form.base64)
                    this.form.imgUUID = response.data.imageUUID;
                });
            },
            //短信验证码
            getCode() {
                getSmsCode(this.form.phone).then(response => {
                    this.form.smsCode = response.data;
                });
            }
        }
    }
</script>

<style scoped>

    /*#app {*/
    /*width: 100vw;*/
    /*height: 100vh;*/
    /*}*/

    #container {
        /*margin-left: auto;*/
        /*margin-right: auto;*/
        /*margin: 0 auto;*/
        /*padding: 0;*/
        background: url("/src/static/imgs/background_1440_1004.png") no-repeat;
        background-size: cover;
        /*height: 1920px;*/
        /*width: 1080px;*/
        top: 0;
        position: absolute;
        height: 100vh;
        width: 100vw;
    }

    #login_form {
        width: 350px;
        height: 500px;
        margin-top: 7%;
        margin-left: 65%;
        /*padding-left: 1000px;*/
        /*padding-top: 200px;*/
        /*border: 1px red solid;*/
        background-color: snow;
    }



    /*header {*/
    /*line-height: 1.5;*/
    /*max-height: 100vh;*/
    /*}*/

    /*.logo {*/
    /*display: block;*/
    /*margin: 0 auto 2rem;*/
    /*}*/

    /*nav {*/
    /*width: 100%;*/
    /*font-size: 12px;*/
    /*text-align: center;*/
    /*margin-top: 2rem;*/
    /*}*/

    /*nav a.router-link-exact-active {*/
    /*color: var(--color-text);*/
    /*}*/

    /*nav a.router-link-exact-active:hover {*/
    /*background-color: transparent;*/
    /*}*/

    /*nav a {*/
    /*display: inline-block;*/
    /*padding: 0 1rem;*/
    /*border-left: 1px solid var(--color-border);*/
    /*}*/

    /*nav a:first-of-type {*/
    /*border: 0;*/
    /*}*/

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
