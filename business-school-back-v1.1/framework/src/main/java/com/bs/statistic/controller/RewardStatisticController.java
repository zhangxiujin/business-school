package com.bs.statistic.controller;

import com.bs.common.response.ResponseResult;
import com.bs.statistic.bo.RewardStatisticBO;
import com.bs.statistic.service.IRewardStatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 悬赏统计控制层
 */
@RestController
@RequestMapping("/reward-statistic")
public class RewardStatisticController {

    @Autowired
    private IRewardStatisticService rewardStatisticService;

    @GetMapping("statisticPublishCount")
    public ResponseResult statisticPublishCount() {
        RewardStatisticBO rewardStatisticBO = rewardStatisticService.statisticRewardPublish();
        return new ResponseResult(rewardStatisticBO);
    }

}
