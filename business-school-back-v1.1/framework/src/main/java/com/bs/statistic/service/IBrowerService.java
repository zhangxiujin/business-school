package com.bs.statistic.service;

import com.bs.statistic.vo.BrowerCountResVo;
import com.bs.statistic.vo.BrowerCountVo;
import com.bs.statistic.vo.CountVo;

public interface IBrowerService {

    /**
     * 统计浏览器次数
     */
    void count(CountVo countVo);

    /**
     * 查询浏览次数
     */
    BrowerCountResVo queryBrowerCount(BrowerCountVo browerCountVo);
}
