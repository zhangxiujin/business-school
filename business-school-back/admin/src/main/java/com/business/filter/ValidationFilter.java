package com.business.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter
public class ValidationFilter extends HttpFilter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest _request = (HttpServletRequest) request;
        String username = _request.getParameter("username");
        String password = _request.getParameter("password");
        System.out.println(username + " - " + password);
        chain.doFilter(request, response);
    }
}
