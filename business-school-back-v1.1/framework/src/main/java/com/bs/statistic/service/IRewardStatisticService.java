package com.bs.statistic.service;

import com.bs.statistic.bo.RewardStatisticBO;

public interface IRewardStatisticService {

    /**
     * 统计悬赏当天、本月、本周、本年度发布的数量
     * @return
     */
    RewardStatisticBO statisticRewardPublish();
}
