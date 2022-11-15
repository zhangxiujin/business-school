package com.bs.reward.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.Id;
import java.util.Date;

@Data
public class RewardAnswer {
    @Id
    private Long answerId;
    private Long rewardId;
    private Long id;
    private String content;
    private Integer bestAnswer; //0否 1是
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date answerTime;
}
