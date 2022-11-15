package com.business.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;

/**
 * 实体类
 */
//@Data // setter gettter toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Demo {
    private String id;
    private String name;
    private String password;
    private int age;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date timestamp;
}
