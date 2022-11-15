package com.bs.statistic.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface RewardStatisticMapper {

    /**
     * 统计当天悬赏发布的数量
     * @return 数量
     */
    Integer statisticCurrentDay();

    /**
     * 统计本周
     */
    Integer statisticCurrentWeek();

    /**
     * 统计本月
     */
    Integer statisticCurrentMonth();

    /**
     * 统计本年
     */
    Integer statisticCurrentYear();
}
