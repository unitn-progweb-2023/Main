package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
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

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // response.setContentType("text/html");
        // response.setCharacterEncoding("utf-8");

        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO DONAZIONE " +
                                                                "VALUES(?, CURRENT_TIMESTAMP, ?)");
            pstmt.setInt(1, Integer.parseInt(request.getParameter("importo")));
            pstmt.setString(2, username);

            pstmt.executeUpdate();
            pstmt.close();
            request.getRequestDispatcher("./aderente.jsp").forward(request, response);
        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
            response.sendRedirect("/error.html");
        } catch (ServletException e) {
            throw new RuntimeException(e);
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