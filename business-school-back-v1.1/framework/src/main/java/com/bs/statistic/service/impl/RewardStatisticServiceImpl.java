package com.bs.statistic.service.impl;

import com.bs.statistic.bo.RewardStatisticBO;
import com.bs.statistic.mapper.RewardStatisticMapper;
import com.bs.statistic.service.IRewardStatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RewardStatisticServiceImpl implements IRewardStatisticService {

    @Autowired
    private RewardStatisticMapper rewardStatisticMapper;

    @Override
    public RewardStatisticBO statisticRewardPublish() {
        Integer currentDayCount = rewardStatisticMapper.statisticCurrentDay();
        Integer currentWeekCount = rewardStatisticMapper.statisticCurrentWeek();
        Integer monthCount = rewardStatisticMapper.statisticCurrentMonth();
        Integer yearCount = rewardStatisticMapper.statisticCurrentYear();
        return new RewardStatisticBO(currentDayCount, monthCount, currentWeekCount, yearCount);
    }
}
