package com.business.mapper;

import com.business.po.Demo;

import java.util.List;

//@Repository
public interface IDemoMapper {

    int insert(Demo demo);

    List<Demo> selectAllDemo();
}
