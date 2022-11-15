package com.bs.common.upload.mapper;

import com.bs.common.upload.po.Attach;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.ids.DeleteByIdsMapper;

@Repository
public interface AttachMapper extends
        Mapper<Attach>, InsertListMapper<Attach>, DeleteByIdsMapper<Attach> {
}
