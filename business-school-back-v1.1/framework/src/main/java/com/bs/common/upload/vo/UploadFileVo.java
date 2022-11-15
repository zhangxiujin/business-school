package com.bs.common.upload.vo;

import com.bs.common.upload.po.Attach;
import lombok.Data;

import java.util.List;

/**
 * 上传文件的响应数据
 */
@Data
public class UploadFileVo {
    private List<Attach> attachList;
}
