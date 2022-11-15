package com.bs.reward.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QueryAllPublishedRewardsVo {

    /**
     * 分页页数
     */
    private Integer pageNum;

    /**
     * 每页条数
     */
    private Integer pageSize;
}
