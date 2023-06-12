package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import com.solidisitiweb.tum4world.model.Visita;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "visite", value = "/dashboard/visite")
public class GetVisite extends HttpServlet {

    String dbURL = "jdbc:derby://localhost:1527/Tum4World";
    String user = "App";
    String password = "pw";
    Connection conn = null;
    Gson gson;
    public void init() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException | NullPointerException e) {
            System.out.println(e);
        }
        gson = new Gson();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        ArrayList<Visita> arrVisite = new ArrayList<>();
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM VISITE";
            ResultSet results = stmt.executeQuery(sql);
            while (results.next()) {
                Visita v = new Visita();
                v.setPage(results.getString("Pagina"));
                v.setVisit((results.getInt("NumVisite")));
                arrVisite.add(v);
            }
            results.close();
            stmt.close();

        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
            response.sendRedirect(response.encodeURL("error.jsp"));
        }

        try (PrintWriter out = response.getWriter()) {
            String visiteJson = gson.toJson(arrVisite);
            out.println(visiteJson);
            out.flush();
        }
        catch (IOException e) {
            System.err.println(e);
            response.sendRedirect(response.encodeURL("error.jsp"));
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