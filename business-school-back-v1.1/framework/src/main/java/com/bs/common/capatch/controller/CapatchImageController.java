//package com.bs.common.capatch.controller;
//
//import com.bs.common.capatch.exception.CapatchImageFailException;
//import com.bs.common.capatch.service.CapatchImageServiceImpl;
//import com.bs.common.response.ResponseResult;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.io.IOException;
//import java.util.Map;
//
//@RestController
//@RequestMapping("capatchImage")
//public class CapatchImageController {
//
//    @Autowired
//    private CapatchImageServiceImpl capatchImageService;
//
//    @PostMapping("/generateCode")
//    public ResponseResult generateCode() throws IOException, CapatchImageFailException {
//        Map<String, Object> map  = capatchImageService.generateImageBase64();
//        return new ResponseResult(map);
//    }
//}
