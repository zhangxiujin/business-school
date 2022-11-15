package com.bs.statistic.mapper;

import com.bs.statistic.po.Statistic;
import com.bs.statistic.vo.BrowerCountResVo;
import com.bs.statistic.vo.BrowerCountVo;
import org.springframework.stereotype.Repository;

@Repository
public interface BrowerMapper {

    int insertStatistic(Statistic statistic);

    BrowerCountResVo queryBrowerCount(BrowerCountVo browerCountVo);
}
