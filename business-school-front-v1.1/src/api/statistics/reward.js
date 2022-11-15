import request from '../../utils/request.js'

export function statisticPublishCount() {
    return request({
        url: '/reward-statistic/statisticPublishCount',
        method: 'get'
    })
}
