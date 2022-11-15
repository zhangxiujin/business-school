package com.bs.reward.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Id;
import java.util.Date;

//@Data
@Getter
@Setter
public class Reward extends Object {
    @Id
    private Long rewardId;
    private Long id;
    private String title;
    private String content;
    private String status;
    private Integer verify;
    private Integer amount;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    private Integer shield=0;
    private Integer del=0;
    private Integer bestAnswer=0;
    private Integer top=0;
    private Integer recommend=0;
    private Integer timeOut=0;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime = new Date();
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date publishedTime;

    @Override
    public int hashCode() {
        return this.rewardId.intValue();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof Reward) {
            Reward reward = (Reward) obj;
            if (this.rewardId.equals(reward.rewardId)) {
                return true;
            }
            return false;
        }
        return false;
    }
}
