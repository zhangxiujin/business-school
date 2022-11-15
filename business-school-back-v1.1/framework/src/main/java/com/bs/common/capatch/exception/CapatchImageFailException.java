package com.bs.common.capatch.exception;

import com.bs.common.exception.BusinessException;

public class CapatchImageFailException extends BusinessException {

    public CapatchImageFailException(Integer code, String codeMsg) {
        super(code, codeMsg);
    }
}
