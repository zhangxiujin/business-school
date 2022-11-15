package com.bs.common.lucene.init;

import com.bs.common.lucene.service.ILuceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(value = 3)
public class SearchRunner implements ApplicationRunner {
    @Autowired
    private ILuceneService service;

    @Override
    public void run(ApplicationArguments arg0) throws Exception {
        service.creatIndex();
    }
}