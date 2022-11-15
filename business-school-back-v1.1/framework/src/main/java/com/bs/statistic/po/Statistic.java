package com.bs.statistic.po;

import lombok.Data;

import java.util.Date;

/**
 * 统计类
 */
@Data
public class Statistic {
    private Long statisticId;
    private Long operatorId;
    private Date operateTime;
    private String catalog;
    private Long businessId;
}
