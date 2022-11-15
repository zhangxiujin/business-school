package com.bs.reward.dto;

import com.bs.reward.po.RewardAnswer;
import lombok.Data;

@Data
public class RewardAnswerDTO {
    private RewardAnswer rewardAnswer;
    private String nickname;
    private String username;
}
