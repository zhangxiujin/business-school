package com.bs.common.sensitive.mapper;

import com.bs.common.sensitive.po.Sensitives;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.ConditionMapper;
import tk.mybatis.mapper.common.ExampleMapper;
import tk.mybatis.mapper.common.base.select.SelectAllMapper;
import tk.mybatis.mapper.common.special.InsertListMapper;
import tk.mybatis.mapper.common.special.InsertUseGeneratedKeysMapper;

import java.util.List;

@Repository
public interface SensitiveMapper extends
        SelectAllMapper<Sensitives>,
        ConditionMapper<Sensitives>,
        ExampleMapper<Sensitives>,
        InsertListMapper<Sensitives>,
        InsertUseGeneratedKeysMapper<Sensitives> {

    void batchInserts(List<Sensitives> sensitives);
}
