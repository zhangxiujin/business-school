package com.bs.reward.task;

import com.bs.common.quartz.task.TaskData;

import java.io.Serializable;

public class RewardTaskData implements Serializable, TaskData {
    private Long id;

    public RewardTaskData(Long id) {
        this.id = id;
    }
    @Override
    public String getDataId() {
        return id + "";
    }
}
