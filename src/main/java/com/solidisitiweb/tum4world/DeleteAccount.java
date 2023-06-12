package com.solidisitiweb.tum4world;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "deleteAccount", value = "/dashboard/deleteAccount")
public class DeleteAccount extends HttpServlet {

    String dbURL = "jdbc:derby://localhost:1527/Tum4World";
    String user = "App";
    String password = "pw";
    Connection conn = null;
    public void init() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException | NullPointerException e) {
            System.out.println(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = (String) request.getSession().getAttribute("username");
        try {
            Statement stmt = conn.createStatement();
            String sql = "DELETE FROM ACCOUNT WHERE username='" + username + "'";
            stmt.executeUpdate(sql);
            stmt.close();
            request.getSession().removeAttribute("username");
            request.getSession().removeAttribute("tipoUtente");
            response.sendRedirect(response.encodeURL("../cancellazioneconfermata.jsp"));
        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
            response.sendRedirect(response.encodeURL("../error.jspjsp"));
        }
    }

    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}