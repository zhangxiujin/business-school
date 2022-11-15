package com.bs.statistic.bo;

import lombok.Data;

/**
 * 统计悬赏当天、本周、本月、本年发布的数量
 */
@Data
public class RewardStatisticBO {

    private Integer currentDayCount;
    private Integer currentMonthCount;
    private Integer currentWeekCount;
    private Integer currentYearCount;

    public RewardStatisticBO(Integer currentDayCount, Integer currentMonthCount, Integer currentWeekCount, Integer currentYearCount) {
        this.currentDayCount = currentDayCount;
        this.currentMonthCount = currentMonthCount;
        this.currentWeekCount = currentWeekCount;
        this.currentYearCount = currentYearCount;
    }
}
