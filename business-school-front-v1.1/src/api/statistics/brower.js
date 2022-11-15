import request from '../../utils/request.js'

export function browerCount(params) {
    return request({
        url: '/statistics/browerCount',
        method: 'post',
        data: params
    })
}
