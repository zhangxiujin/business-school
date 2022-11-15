package com.bs.user.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String username;
    private String password;
    private String phone;
    private Integer age;
    private String nickname;
    private Integer sex;
    private Integer enabled;
    private String description;
    private Date createTime;
    private Date updateTime;
}
