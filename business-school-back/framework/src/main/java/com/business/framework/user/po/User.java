package com.business.framework.user.po;

import com.business.framework.common.utils.IdUtil;
import lombok.Data;
import org.springframework.data.annotation.Id;

import java.util.Date;
import java.util.UUID;

@Data
public class User {

    /**
     * 数据库的主键的值生成策略
     * 1.数据库自增(对于分布式数据库不适用)，比如主备，主从，双主，读写分离， kettle
     * 2.uuid(全局唯一)，适用于分布式系统
     * 3.雪花算法生成全局唯一自增趋势的id
     */
    @Id
    private Long id;
    private String username;
    private String password;
    private String phone;
    private int age;
    private String nickname;
    private int sex;
    private int enabled;
    private String description;
    private Date createTime;
    private Date updateTime;
}
