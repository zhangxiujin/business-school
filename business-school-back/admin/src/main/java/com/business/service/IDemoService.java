package com.business.service;


import com.business.po.Demo;

import java.util.List;

public interface IDemoService {

    void save(Demo demo);

    void test();

    List<Demo> queryAllDemo();
}
