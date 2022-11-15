package com.bs.reward.task;

import com.bs.common.quartz.task.JobTask;
import com.bs.common.quartz.task.TaskData;
import com.bs.reward.mapper.RewardAnswerMapper;
import com.bs.reward.mapper.RewardMapper;
import com.bs.reward.po.Reward;
import com.bs.reward.po.RewardAnswer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RewardTimeOutTask extends JobTask {

    @Autowired
    private RewardAnswerMapper rewardAnswerMapper;
    @Autowired
    private RewardMapper rewardMapper;

    @Override
    public int execute(TaskData taskData) {
        //到期后有回答就不算超时
        RewardAnswer rewardAnswer = new RewardAnswer();
        rewardAnswer.setRewardId(Long.parseLong(taskData.getDataId()));
        int count = rewardAnswerMapper.selectCount(rewardAnswer);
        if (count == 0) {
            Reward reward = new Reward();
            reward.setRewardId(Long.parseLong(taskData.getDataId()));
            reward.setTimeOut(1);
            rewardMapper.updateByPrimaryKeySelective(reward);
        }
        return 1;
    }
}
