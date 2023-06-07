package com.solidisitiweb.tum4world;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class FilterVisited implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest hreq = (HttpServletRequest) servletRequest;


        System.out.println("Pagina visitata: " +  hreq.getRequestURL());
        // aggiungi una visita a database
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
       // Filter.super.destroy();
    }
}
