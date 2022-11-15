package com.bs.reward.service;

import com.bs.reward.bo.RewardAnswerBO;
import com.bs.reward.bo.RewardBO;
import com.bs.reward.dto.RewardDTO;
import com.bs.reward.po.RewardAnswer;
import com.bs.reward.vo.PublishVo;
import com.bs.reward.vo.SaveDraftVo;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface IRewardService {
    /**
     * 通过用户id查询悬赏
     * @param userId
     * @return
     */
    List<RewardBO> queryRewardsByUserId(Long userId);

    List<RewardDTO> queryAllPublishedRewards();

    RewardBO queryRewardDetail(Long rewardId);

    List<RewardAnswerBO> queryRewardAnswersById(Long rewardId);

    /**
     * 保存悬赏回答
     */
    Long saveRewardAnswer(RewardAnswer rewardAnswer, HttpServletRequest request);

    /**
     * 发布悬赏
     */
    Long publishReward(PublishVo publishVo);

    /**
     * 草稿
     */
    Long saveDraft(SaveDraftVo saveDraftVo);

    /**
     * 导入敏感词
     */
    void importSensitive() throws IOException;

}
