package com.bs.common.sensitive.po;

import lombok.Data;

import javax.persistence.Id;
import java.util.Date;

/**
 * 敏感词库实体类
 */
@Data
public class Sensitives {
    private Long id;  //主键
    private String word; //敏感词
    private Date createTime; //创建时间

    public Sensitives(Long id, String word, Date createTime) {
        this.id = id;
        this.word = word;
        this.createTime = createTime;
    }
}
