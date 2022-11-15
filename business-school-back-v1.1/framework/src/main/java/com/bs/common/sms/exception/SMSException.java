package com.bs.common.sms.exception;

import com.bs.common.exception.BusinessException;

public class SMSException extends BusinessException {

    public SMSException(Integer code, String codeMsg) {
        super(code, codeMsg);
    }
}
