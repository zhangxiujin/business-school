package com.bs.reward.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.bs.common.context.ServletUtils;
import com.bs.common.quartz.scheduler.QuartzTaskScheduler;
import com.bs.common.response.ResponseEnum;
import com.bs.common.sensitive.exception.SensitiveException;
import com.bs.common.sensitive.init.InitLoader;
import com.bs.common.sensitive.mapper.SensitiveMapper;
import com.bs.common.sensitive.po.Sensitives;
import com.bs.common.upload.mapper.AttachMapper;
import com.bs.common.upload.po.Attach;
import com.bs.common.upload.service.AttachServiceImpl;
import com.bs.common.utils.IdUtil;
import com.bs.common.utils.ImportUtil;
import com.bs.reward.bo.RewardAnswerBO;
import com.bs.reward.bo.RewardBO;
import com.bs.reward.dto.RewardAnswerDTO;
import com.bs.reward.dto.RewardDTO;
import com.bs.reward.mapper.RewardMapper;
import com.bs.reward.po.Reward;
import com.bs.reward.po.RewardAnswer;
import com.bs.reward.service.IRewardService;
import com.bs.reward.task.RewardTaskData;
import com.bs.reward.task.RewardTimeOutTask;
import com.bs.reward.vo.PublishVo;
import com.bs.reward.vo.SaveDraftVo;
import com.bs.user.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class RewardServiceImpl implements IRewardService {

    @Autowired
    private RewardMapper rewardMapper;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private QuartzTaskScheduler quartzTaskScheduler;
    @Autowired
    private SensitiveMapper sensitiveMapper;
    @Autowired
    private AttachServiceImpl attachService;
    @Autowired
    private AttachMapper attachMapper;

    @Override
    public List<RewardBO> queryRewardsByUserId(Long userId) {
        List<RewardDTO> rewardDTOS = rewardMapper.selectRewardsByUserId(userId);
        List<RewardBO> rewardBOS = BeanUtil.copyToList(rewardDTOS, RewardBO.class);
        for (int i = 0; i < rewardBOS.size(); i++) {
            System.out.println(rewardBOS.get(i).toString());
        }
        return rewardBOS;
    }

    @Override
    public List<RewardDTO> queryAllPublishedRewards() {
        List<RewardDTO> rewardDTOS = rewardMapper.selectAllPublishedRewards();
        return rewardDTOS;
    }

    @Override
    public RewardBO queryRewardDetail(Long rewardId) {
        Map<String, Object> stringObjectMap = rewardMapper.selectRewardDetailById(rewardId);
        Reward reward = BeanUtil.copyProperties(stringObjectMap, Reward.class);
        User user = BeanUtil.copyProperties(stringObjectMap, User.class);
        RewardBO rewardBO = new RewardBO();
        rewardBO.setReward(reward);
        rewardBO.setUser(user);
        return rewardBO;
    }

    @Override
    public List<RewardAnswerBO> queryRewardAnswersById(Long rewardId) {
        List<RewardAnswerDTO> rewardAnswerDTOS = rewardMapper.selectRewardAnswersById(rewardId);
        return BeanUtil.copyToList(rewardAnswerDTOS, RewardAnswerBO.class);
    }

    @Override
    public Long saveRewardAnswer(RewardAnswer rewardAnswer, HttpServletRequest request) {
        Long answerId = IdUtil.nextId();
        rewardAnswer.setAnswerId(answerId);
        rewardAnswer.setAnswerTime(new Date(System.currentTimeMillis()));
        rewardAnswer.setBestAnswer(0);
        rewardAnswer.setId(getCurrentLoginUserId(request));
        rewardMapper.insertRewardAnswer(rewardAnswer);
        return answerId;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long publishReward(PublishVo publishVo) {
        //敏感词校验
        List<Sensitives> sensitives = InitLoader.sensitives;
        for (Sensitives sensitive : sensitives) {
            if (publishVo.getTitle().contains(sensitive.getWord())) {
                throw new SensitiveException(ResponseEnum.TITLE_SENSITIVE.getCode(),
                        ResponseEnum.TITLE_SENSITIVE.getCodeMsg());
            }
            if (publishVo.getContent().contains(sensitive.getWord())) {
                throw new SensitiveException(ResponseEnum.CONTENT_SENSITIVE.getCode(),
                        ResponseEnum.CONTENT_SENSITIVE.getCodeMsg());
            }
        }
        Reward reward = BeanUtil.copyProperties(publishVo, Reward.class, new String[]{});
        Long rewardId = IdUtil.nextId();
        reward.setRewardId(rewardId);
        reward.setId(getCurrentLoginUserId(ServletUtils.getRequest()));
        reward.setPublishedTime(new Date());
        reward.setStatus("11");
        reward.setVerify(1);  //0未通过 1审核中 2通过
        rewardMapper.insert(reward);
        createScheduleTask(rewardId, publishVo.getEndTime());
        return rewardId;
    }

    @Transactional
    @Override
    public Long saveDraft(SaveDraftVo saveDraftVo) {
        if (saveDraftVo.getRewardId() == null) {
            Reward reward = BeanUtil.copyProperties(saveDraftVo, Reward.class, new String[]{});
            Long rewardId = IdUtil.nextId();
            reward.setRewardId(rewardId);
            reward.setId(getCurrentLoginUserId(ServletUtils.getRequest()));
            reward.setStatus("10");
            rewardMapper.insert(reward);
            //保存附件
            attachService.batchSave(saveDraftVo.getAttachList(), rewardId);
            return rewardId;
        } else {
            Reward reward = BeanUtil.copyProperties(saveDraftVo, Reward.class);
            rewardMapper.updateByPrimaryKeySelective(reward);
            //修改附件
            //删除所有的附件
            Example example = new Example(Attach.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("business_id", reward.getRewardId());
            attachMapper.deleteByExample(example);
            //保存当前留存的附件
            attachService.batchSave(saveDraftVo.getAttachList(), reward.getRewardId());
            return reward.getRewardId();
        }

    }

    /**
     * 敏感此入库
     */
    @Override
    public void importSensitive() throws IOException {
        List<String> words = ImportUtil.importSensitive(new File("E:\\idea-workspace-classes\\business-school-back-v1.1\\framework\\target\\classes\\sensitives"));
        List<Sensitives> sensitives = words.stream().map(word -> {
            Sensitives sensitive = new Sensitives(IdUtil.nextId(), word, new Date());
            return sensitive;
        }).collect(Collectors.toList());
        sensitiveMapper.insertList(sensitives);
    }

    /**
     * 获取当前登录人的用户id
     */
    private Long getCurrentLoginUserId(HttpServletRequest request) {
        String token = request.getHeader("Token");
        User user = (User) redisTemplate.opsForValue().get(token);
        return user.getId();
    }

    /**
     * 创建定时任务
     */
    private void createScheduleTask(Long id, Date endTime) {
        int status = quartzTaskScheduler.scheduler(
                RewardTimeOutTask.class, new RewardTaskData(id), endTime);
    }

}
