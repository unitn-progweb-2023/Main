package com.solidisitiweb.tum4world;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "donazioni", value = "/dashboard/donazioni")
public class Donazioni extends HttpServlet {

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

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO DONAZIONE " +
                                                                "VALUES(?, CURRENT_TIMESTAMP, ?)");
            pstmt.setInt(1, Integer.parseInt(request.getParameter("importo")));
            pstmt.setString(2, username);

            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
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