package com.business.controller;

import com.business.po.Demo;
import com.business.service.IDemoService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/demoController")
public class DemoController {

//    @Autowired
    @Resource(name = "demoServiceImpl")
    private IDemoService demoService;

    @RequestMapping("/save")
    public String save(Demo demo) {
        demoService.save(demo);
        return "success";
    }

    @RequestMapping("/run")
//    @ResponseBody
    public String run() {
        demoService.test();
        System.out.println("run方法被调用");
        return "success";
    }

    @RequestMapping("/queryAllDemo")
    public List<Demo> queryAllDemo() {
        return demoService.queryAllDemo();
    }
}
