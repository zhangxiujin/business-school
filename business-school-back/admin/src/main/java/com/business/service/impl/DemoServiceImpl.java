package com.business.service.impl;

import com.business.common.utils.IdUtil;
import com.business.mapper.IDemoMapper;
import com.business.po.Demo;
import com.business.service.IDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("demoServiceImpl")
public class DemoServiceImpl implements IDemoService {

    @Autowired
    private IDemoMapper demoMapper;

    @Override
    public List<Demo> queryAllDemo() {
        return demoMapper.selectAllDemo();
    }

    @Override
    public void save(Demo demo) {
        demo.setId(IdUtil.generateId());
        demoMapper.insert(demo);
    }

    @Override
    public void test() {
        Demo demo = new Demo();
        int age = demo.getAge();
        System.out.println(demo.toString());
        System.out.println("test方法被调用");
    }
}
