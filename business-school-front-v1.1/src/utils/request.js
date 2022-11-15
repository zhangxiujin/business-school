import axios from 'axios'
import app from '../main'

//创建一个axios实例
const service = axios.create({
    baseURL: 'http://localhost:8081/bs/',
    timeout: 60000, //请求超时时间(ms)
    withCredentials: true, //异步请求携带cookie
    headers: {
        //设置后端需要的参数类型
        'Content-Type': 'application/json',
        'token': localStorage.getItem("Token"),
        'X-Requested-With': 'XMLHttpRequest'
    }
})

//添加请求拦截器
service.interceptors.request.use(
    function(config){
        //发送请求前的处理
        return config;
    },
    function(error) {
        //请求错误的处理
        console.log(error);
        return Promise.reject(error);
    }
)

//添加响应拦截器
service.interceptors.response.use(
    function(response) {
        // console.log(response)
        if (response.data.code == 109 || response.data.code == 108) {
            //token过期，跳转到登录页面
            // app.$router.push({path: '/login', query: {state: 'expired'}});
            window.location.href = window.location.href.split("/")[0] + "/login?state=expired";
            return Promise.reject();
        } else if (response.data.code == 110) {
            alert(response.data.codeMsg);
            return Promise.reject();
        } else if (response.data.code == 9999) {
            alert('系统错误，请联系管理员!')
            return Promise.reject();
        } else {
            const data = response.data;
            const code = data.statusCode;
            return data;
        }
    },
    function(error) {
        console.log(error);
        if (error.response.status == 403) {
            window.location.href = window.location.href.split("/")[0] + "/login?state=expired";
        }
        return Promise.reject(error);
    }
)

export default service;
