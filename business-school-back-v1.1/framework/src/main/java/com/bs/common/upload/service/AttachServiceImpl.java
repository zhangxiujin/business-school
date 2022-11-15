package com.bs.common.upload.service;

import com.bs.common.upload.mapper.AttachMapper;
import com.bs.common.upload.po.Attach;
import com.bs.common.utils.IdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AttachServiceImpl {

    @Autowired
    private AttachMapper attachMapper;

    /**
     * 保存附件信息到DB
     * @param attach
     * @return
     */
    public Long saveAttach(Attach attach) {
        Long fileId = IdUtil.nextId();
        attach.setFileId(fileId);
        attach.setCreateTime(new Date());
        attachMapper.insert(attach);
        return fileId;
    }

    /**
     * 批量保存
     */
    public void batchSave(List<Attach> attachList, Long businessId) {
        for (Attach attach : attachList) {
            attach.setFileId(IdUtil.nextId());
            attach.setCreateTime(new Date());
            attach.setBusinessId(businessId);
        }
        attachMapper.insertList(attachList);
    }

    /**
     * 通过fileid查询文件信息
     */
    public Attach queryById(Long fileId) {
        return attachMapper.selectByPrimaryKey(fileId);
    }

    /**
     * 删除附件
     */
    public void delAttachs(List<Attach> attachList) {
        StringBuilder ids = new StringBuilder();
        for (Attach attach : attachList) {
            ids.append(attach.getFileId() + ",");
        }
        String id = ids.substring(0, ids.length() - 1);
        attachMapper.deleteByIds(id);
    }
}
