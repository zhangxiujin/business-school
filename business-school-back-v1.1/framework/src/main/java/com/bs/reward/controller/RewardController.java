package com.bs.reward.controller;

import cn.hutool.core.bean.BeanUtil;
import com.bs.common.init.SpringContextUtil;
import com.bs.common.lucene.service.ILuceneService;
import com.bs.common.response.ResponseResult;
import com.bs.common.upload.po.Attach;
import com.bs.common.upload.service.AttachServiceImpl;
import com.bs.reward.bo.RewardAnswerBO;
import com.bs.reward.bo.RewardBO;
import com.bs.reward.dto.RewardDTO;
import com.bs.reward.po.Reward;
import com.bs.reward.po.RewardAnswer;
import com.bs.reward.service.IRewardService;
import com.bs.reward.vo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/reward")
public class RewardController {
    @Autowired
    private IRewardService rewardService;
    @Autowired
    private AttachServiceImpl attachService;
    @Autowired
    private ILuceneService luceneService;

    /**
     * 通过用户id查询用户发布的悬赏
     * @param userId
     * @return
     */
    @GetMapping("/queryRewardsByUserId")
    public ResponseResult queryRewardsByUserId(@RequestParam("userId") Long userId) {
        List<RewardBO> rewardBOS = rewardService.queryRewardsByUserId(userId);
        return new ResponseResult(rewardBOS);
    }

    /**
     * 查询所有发布的悬赏
     */
    @GetMapping("/queryAllPublishedRewards")
    public ResponseResult queryAllPublishedRewards(QueryAllPublishedRewardsVo params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize()).setReasonable(true);
        List<RewardDTO> rewardDTOS = rewardService.queryAllPublishedRewards();
        List<RewardBO> rewardBOS = BeanUtil.copyToList(rewardDTOS, RewardBO.class);
        return new ResponseResult(rewardBOS, new PageInfo(rewardDTOS).getTotal());
    }

    /**
     * 通过悬赏id查询悬赏相关详请及回答
     * @param queryRewardDetailVo
     * @return
     */
    @GetMapping("/queryRewardDetail")
    public ResponseResult queryRewardDetail(QueryRewardDetailVo queryRewardDetailVo) {
        RewardBO detail = rewardService.queryRewardDetail(queryRewardDetailVo.getRewardId());
        List<RewardAnswerBO> rewardAnswerBOS = rewardService.queryRewardAnswersById(queryRewardDetailVo.getRewardId());
        Map<String, Object> map = new HashMap<>();
        map.put("detail", detail);
        map.put("answers", rewardAnswerBOS);
        return new ResponseResult(map);
    }

    /**
     * 保存悬赏回答信息
     */
    @PostMapping("/saveRewardAnswer")
    public ResponseResult saveRewardAnswer(HttpServletRequest request,
                       @RequestBody SaveRewardAnswerVo saveRewardAnswerVo) {
        RewardAnswer rewardAnswer = new RewardAnswer();
        rewardAnswer.setContent(saveRewardAnswerVo.getContent());
        rewardAnswer.setRewardId(saveRewardAnswerVo.getRewardId());
        Long answerId = rewardService.saveRewardAnswer(rewardAnswer, request);
        return new ResponseResult(answerId);
    }

    /**
     * 发布悬赏
     */
    @Transactional(rollbackFor = Exception.class)
    @PostMapping("/publish")
    public ResponseResult publish(@Valid @RequestBody PublishVo publishVo) {
        Long id = rewardService.publishReward(publishVo);
        List<Attach> attachList = publishVo.getAttachList();
        if (attachList != null && attachList.size() > 0) {
            attachService.batchSave(attachList, id);
        }
        return new ResponseResult(id);
    }

    /**
     * 保存草稿
     */
    @PostMapping("/saveDraft")
    public ResponseResult saveDraft(@Valid @RequestBody SaveDraftVo saveDraftVo) {
        Long id = rewardService.saveDraft(saveDraftVo);
        return new ResponseResult(id);
    }

    /**
     * 导入敏感此到mysql中
     */
    @PostMapping("/importSensitives")
    public ResponseResult importSensitives() throws IOException {
        rewardService.importSensitive();
        return new ResponseResult();
    }

    @GetMapping("/run")
    public String run(){
        System.out.println("run方法被调用");
        return "success";
    }

    @GetMapping("/destroy")
    public String destroy(){
        System.out.println("destroy方法被调用");
        ApplicationContext applicationContext = SpringContextUtil.getApplicationContext();
        AnnotationConfigApplicationContext context = (AnnotationConfigApplicationContext )applicationContext;
        context.close();
        return "success";
    }

    @GetMapping("/queryList")
    public String queryList() throws InterruptedException {
        System.out.println("调用queryList方法前");
        Thread.sleep(1000);
        System.out.println("调用queryList方法后");
        return "success";
    }

    @GetMapping("/search")
    public void search(@RequestParam("key") String key) throws InvalidTokenOffsetsException, IOException, ParseException {
        List<Reward> list = luceneService.searchBlog(key);
        list.stream().forEach(it -> {
            System.out.println(it.getTitle());
        });
    }

}
