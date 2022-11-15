import request from '../../utils/request.js'

export function queryMyPublished() {
    return request({
        url: '/',
        method: 'get'
    })
}

export function loadPublishedList(params) {
    return request({
        url: '/reward/queryAllPublishedRewards?pageNum='+params.pageNum+'&pageSize='+params.pageSize,
        method: 'get'
    })
}

export function queryRewardDetail(id) {
    return request({
        url: '/reward/queryRewardDetail?rewardId='+id,
        method: 'get'
    })
}

export function saveAnswer(params) {
    return request({
        url: '/reward/saveRewardAnswer',
        method: 'post',
        data: params
    })
}

/**
 * 发布悬赏
 * @param params
 * @returns {AxiosPromise}
 */
export function publish(params) {
    return request({
        url: '/reward/publish',
        method: 'post',
        data: params
    })
}

//保存草稿
export function saveDraft(params) {
    return request({
        url: '/reward/saveDraft',
        method: 'post',
        data: params
    })
}
