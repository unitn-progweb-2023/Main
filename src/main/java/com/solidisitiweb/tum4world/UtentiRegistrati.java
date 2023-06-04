package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import com.solidisitiweb.tum4world.model.Account;
import com.solidisitiweb.tum4world.model.Aderente;
import com.solidisitiweb.tum4world.model.Amministratore;
import com.solidisitiweb.tum4world.model.Simpatizzante;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;


@WebServlet(name = "utentiRegistrati", value = "/dashboard/utentiRegistrati")
public class UtentiRegistrati extends HttpServlet {

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
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM ACCOUNT";
            ResultSet results = stmt.executeQuery(sql);
            while (results.next()) {
                Account a;
                String type = results.getString("Type");
                if(type.equals("SI")){
                    a = new Simpatizzante();
                }else if(type.equals("AD")){
                    a = new Aderente();
                }else{
                    a = new Amministratore();
                }
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
            response.sendRedirect("error.html");
        }

        try (PrintWriter out = response.getWriter()) {
            System.out.println("array.size()");
            Gson gson = new Gson();
            System.out.println("all ok");
            //String userJson = gson.toJson(accounts);
            System.out.println("all ok");
            //out.println(userJson);
            out.flush();
        }
        catch (IOException e) {
            System.err.println(e);
            response.sendRedirect("error.html");
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