package com.bs.common.context;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtils {

    public static HttpServletRequest getRequest() {
        return getRequestAttributes().getRequest();
    }

    public static HttpServletResponse getResponse() {
        return getRequestAttributes().getResponse();
    }

    public static String getToken() {
        return getRequest().getHeader("Token");
    }

    public static ServletRequestAttributes getRequestAttributes() {
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        return (ServletRequestAttributes) attributes;
    }

}