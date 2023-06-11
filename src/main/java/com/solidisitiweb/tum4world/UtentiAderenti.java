package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import com.solidisitiweb.tum4world.model.Aderente;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "utentiAderenti", value = "/dashboard/utentiAderenti")
public class UtentiAderenti extends HttpServlet {

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
        ArrayList<Aderente> accounts = new ArrayList<>();
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM ACCOUNT WHERE Type = 'AD'";
            ResultSet results = stmt.executeQuery(sql);
            while (results.next()) {
                Aderente a = new Aderente();
                a.setNome(results.getString("Nome"));
                a.setCognome(results.getString("Cognome"));
                a.setEmail(results.getString("Email"));
                a.setDataDiNascita(results.getString("DataDiNascita"));
                a.setCellulare(results.getString("Cellulare"));
                a.setUsername(results.getString("Username"));
                accounts.add(a);
            }
            results.close();
            stmt.close();

        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
            response.sendRedirect(response.encodeURL("/error.html"));
        }

        try (PrintWriter out = response.getWriter()) {
            String userJson = gson.toJson(accounts);
            out.println(userJson);
            out.flush();
        }
        catch (IOException e) {
            System.err.println(e);
            response.sendRedirect(response.encodeURL("/error.html"));
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