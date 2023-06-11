package com.solidisitiweb.tum4world;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class FilterLogged implements Filter {
    String dbURL = "jdbc:derby://localhost:1527/Tum4World";
    String user = "App";
    String password = "pw";
    Connection conn = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException | NullPointerException e) {
            System.out.println(e);
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest hreq = (HttpServletRequest) servletRequest;
        String username = (String) hreq.getSession().getAttribute("username");
        String type;
        String urlPagina = String.valueOf(hreq.getRequestURL()).split(";")[0];
        if(urlPagina.endsWith("/simpatizzante.jsp")){
            type = "SI";
        }
        else if(urlPagina.endsWith("/aderente.jsp")){
            type = "AD";
        }
        else if(urlPagina.endsWith("/amministratore.jsp")){
            type = "AM";
        }
        else {
            HttpServletResponse hres = (HttpServletResponse) servletResponse;
            hres.sendRedirect(hres.encodeURL("../login.jsp"));
            return;
        }

        if(username != null){
            try {
                String sql = "SELECT * FROM ACCOUNT WHERE Username=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                ResultSet results = pstmt.executeQuery();

                if(results.next()){
                    if(results.getString("Type").equals(type)){
                        filterChain.doFilter(servletRequest,servletResponse);
                    }
                    else {
                        HttpServletResponse hres = (HttpServletResponse) servletResponse;
                        hres.sendRedirect(hres.encodeURL("../login.jsp"));
                    }
                } else {
                    HttpServletResponse hres = (HttpServletResponse) servletResponse;
                    hres.sendRedirect(hres.encodeURL("../login.jsp"));
                }
                results.close();
                pstmt.close();
            } catch (SQLException | NullPointerException e) {
                System.err.println(e);
            }
        }
        else {
            HttpServletResponse hres = (HttpServletResponse) servletResponse;
            hres.sendRedirect(hres.encodeURL("../login.jsp"));
        }
    }

    @Override
    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
