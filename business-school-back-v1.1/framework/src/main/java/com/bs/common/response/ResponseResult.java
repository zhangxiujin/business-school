package com.bs.common.response;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 用来存放http响应数据的
 */
@Data
@AllArgsConstructor
public class ResponseResult {
    /**
     * http状态码(业务相关的)
     */
    private Integer code;
    /**
     * 业务的具体错误消息
     */
    private String codeMsg;
    /**
     * 业务相关数据
     */
    private Object data;
    /**
     * 分页相关-总条数
     */
    private Long total;

    /**
     * 无参构造
     */
    public ResponseResult() {
        this.code = ResponseEnum.SUCCESS.getCode();
        this.codeMsg = ResponseEnum.SUCCESS.getCodeMsg();
    }

    public ResponseResult(Integer code, String codeMsg) {
        this.code = code;
        this.codeMsg = codeMsg;
    }

    public ResponseResult(Object data) {
        this();
        this.data = data;
    }

    public ResponseResult(Object data, Long total) {
        this(data);
        this.total = total;
    }
}
