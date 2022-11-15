package com.bs.common.sensitive.init;

import com.bs.common.sensitive.mapper.SensitiveMapper;
import com.bs.common.sensitive.po.Sensitives;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class InitLoader implements CommandLineRunner {

    public static List<Sensitives> sensitives;

    @Autowired
    private SensitiveMapper sensitiveMapper;

    @Override
    public void run(String... args) throws Exception {
        List<Sensitives> sensitives = sensitiveMapper.selectAll();
        InitLoader.sensitives = sensitives;
    }
}
