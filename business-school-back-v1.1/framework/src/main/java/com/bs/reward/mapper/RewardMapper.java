package com.bs.reward.mapper;

import com.bs.reward.dto.RewardAnswerDTO;
import com.bs.reward.dto.RewardDTO;
import com.bs.reward.po.Reward;
import com.bs.reward.po.RewardAnswer;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

@Repository
public interface RewardMapper extends Mapper<Reward>, InsertListMapper<Reward> {

    /**
     * 通过用户id查询用户自己发布的悬赏
     * @param userId 用户id
     * @return 集合
     */
    List<RewardDTO> selectRewardsByUserId(Long userId);

    /**
     * 查询所有已发布的悬赏
     * @return
     */
    List<RewardDTO> selectAllPublishedRewards();

    /**
     * 通过悬赏id查询悬赏信息
     */
    Map<String, Object> selectRewardDetailById(Long rewardId);

    /**
     * 通过悬赏id查询相应回答
     */
    List<RewardAnswerDTO> selectRewardAnswersById(Long rewardId);

    /**
     * 保存悬赏回答
     */
    int insertRewardAnswer(RewardAnswer rewardAnswer);


}
