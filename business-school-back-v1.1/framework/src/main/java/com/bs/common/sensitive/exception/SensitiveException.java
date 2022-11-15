package com.bs.common.sensitive.exception;

import com.bs.common.exception.BusinessException;

public class SensitiveException extends BusinessException {

    public SensitiveException(Integer code, String codeMsg) {
        super(code, codeMsg);
    }
}
