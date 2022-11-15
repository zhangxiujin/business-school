package com.bs.statistic.controller;

import com.bs.common.response.ResponseResult;
import com.bs.statistic.service.IBrowerService;
import com.bs.statistic.vo.BrowerCountResVo;
import com.bs.statistic.vo.BrowerCountVo;
import com.bs.statistic.vo.CountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 浏览相关统计
 */
@RestController
@RequestMapping("/statistics")
public class BrowerController {

    @Autowired
    private IBrowerService browerService;

    /**
     * 统计浏览次数
     */
    @PostMapping("/browerCount")
    public ResponseResult count(@RequestBody CountVo countVo) {
        browerService.count(countVo);
        return new ResponseResult();
    }

    /**
     * 查询浏览次数
     */
    @GetMapping("/queryBrowerCount")
    public ResponseResult queryBrowerCount(BrowerCountVo browerCountVo) {
        BrowerCountResVo browerCountResVo = browerService.queryBrowerCount(browerCountVo);
        return new ResponseResult(browerCountResVo);
    }
}
