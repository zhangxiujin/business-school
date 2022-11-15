package com.bs.common.upload.po;

import lombok.Data;

import javax.persistence.Id;
import java.util.Date;

@Data
public class Attach {
    @Id
    private Long fileId;
    private Long businessId;
    /* 前端 传参 --- start */
    private String fileName;
    private Long fileSize;
    private String fileExt;
    private String fileUrl;
    /* 前端 传参 --- end */
    private Date createTime;
}
