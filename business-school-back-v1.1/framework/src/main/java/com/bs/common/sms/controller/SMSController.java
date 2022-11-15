package com.bs.common.sms.controller;

import com.bs.common.response.ResponseResult;
import com.bs.common.sms.service.SMSServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sms")
public class SMSController {

    @Autowired
    private SMSServiceImpl smsService;

    @PostMapping("/send")
    public ResponseResult sendSMS(@RequestParam("phone") String phone) {
        String code = smsService.send(phone);
        return new ResponseResult(code);
    }
}
