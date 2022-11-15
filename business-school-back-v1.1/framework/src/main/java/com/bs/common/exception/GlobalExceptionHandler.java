package com.bs.common.exception;

import cn.hutool.json.JSONObject;
import com.bs.common.response.ResponseEnum;
import com.bs.common.response.ResponseResult;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 全局异常处理
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(BusinessException.class)
    public ResponseResult businessExceptionHandle(
            BusinessException e, HttpServletRequest request) {
        e.printStackTrace();
        log.error(e.getMessage());
        return new ResponseResult(e.getCode(), e.getCodeMsg());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseResult arguemnt(MethodArgumentNotValidException e) {
        e.printStackTrace();
        log.error(e.getMessage());
        return new ResponseResult(ResponseEnum.ARGUMENT_CHECK_FAIL.getCode(), wrapErrors(e.getBindingResult().getAllErrors()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseResult exceptionHandle(Exception e) {
        e.printStackTrace();
        log.error(e.getMessage());
        return new ResponseResult(ResponseEnum.SYSTEM_ERROR.getCode(),
                ResponseEnum.SYSTEM_ERROR.getCodeMsg());
    }

    private String wrapErrors(List<ObjectError> errors) {
        if (errors != null && errors.size() > 0) {
            return errors.get(0).getDefaultMessage();
        }
        return "参数错误，请联系管理员";
    }


}
