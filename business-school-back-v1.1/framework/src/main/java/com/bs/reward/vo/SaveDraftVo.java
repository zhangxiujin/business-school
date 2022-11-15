package com.bs.reward.vo;

import com.bs.common.upload.po.Attach;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Data
public class SaveDraftVo {
    private Long rewardId;

    @NotEmpty
    @Size(min = 1, max = 100, message = "标题长度范围在1~100之间")
    private String title;

    @Min(value = 1, message = "最小金额不能小于1")
    @Max(value = Integer.MAX_VALUE)
    private Integer amount;

    private Date endTime;

    @NotEmpty
    private String content;

    private List<Attach> attachList;
}
