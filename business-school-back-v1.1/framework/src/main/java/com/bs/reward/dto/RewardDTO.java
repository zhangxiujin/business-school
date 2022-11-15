package com.bs.reward.dto;

import com.bs.reward.po.Reward;
import com.bs.user.po.User;
import lombok.Data;

@Data
public class RewardDTO {
    private Integer answerCount;
    private Reward reward;
    private User user;
}
