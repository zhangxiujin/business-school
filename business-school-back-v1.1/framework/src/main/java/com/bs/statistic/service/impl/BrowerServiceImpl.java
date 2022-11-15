package com.bs.statistic.service.impl;

import com.bs.common.context.ServletUtils;
import com.bs.common.utils.IdUtil;
import com.bs.statistic.mapper.BrowerMapper;
import com.bs.statistic.po.Statistic;
import com.bs.statistic.service.IBrowerService;
import com.bs.statistic.vo.BrowerCountResVo;
import com.bs.statistic.vo.BrowerCountVo;
import com.bs.statistic.vo.CountVo;
import com.bs.user.po.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class BrowerServiceImpl implements IBrowerService {

    @Autowired
    private BrowerMapper browerMapper;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public void count(CountVo countVo) {
        Statistic statistic = new Statistic();
        statistic.setStatisticId(IdUtil.nextId());
        statistic.setOperatorId(getCurrentUserId());
        statistic.setCatalog(countVo.getCatalog());
        statistic.setOperateTime(new Date(System.currentTimeMillis()));
        statistic.setBusinessId(countVo.getBusinessId());
        browerMapper.insertStatistic(statistic);
    }

    @Override
    public BrowerCountResVo queryBrowerCount(BrowerCountVo browerCountVo) {
        return browerMapper.queryBrowerCount(browerCountVo);
    }

    private Long getCurrentUserId() {
        String token = ServletUtils.getToken();
        if (StringUtils.isNotEmpty(token)) {
            User user =(User) redisTemplate.opsForValue().get(token);
            return user == null ? null : user.getId();
        }
        return null;
    }
}
