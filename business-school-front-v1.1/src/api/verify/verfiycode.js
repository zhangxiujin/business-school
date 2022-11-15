import request from '@/utils/request.js';

/*
    请求图形码
 */
export function imageVerifyCode() {
    return request({
        url: 'captcha/captchaImage',
        method: 'get'
    });
}

/**
 * 短信验证码
 */
export function getSmsCode(phone) {
    return request({
        url: 'sms/send?phone='+ phone,
        method: 'post'
    });
}
