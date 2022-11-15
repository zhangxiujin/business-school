package com.bs.statistic.vo;

import lombok.Data;

@Data
public class BrowerCountVo {
    private Long businessId;
    private String type;  //天、月、季、年
}
