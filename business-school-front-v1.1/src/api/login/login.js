import request from '@/utils/request.js';

/*
    用户登录方法
 */
export function userLogin(param) {
    return request({
        url: 'login',
        method: 'post',
        data: param
    });
}

/*
    用户登出方法
 */
//TODO

