package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import com.solidisitiweb.tum4world.model.Account;
import com.solidisitiweb.tum4world.model.Aderente;
import com.solidisitiweb.tum4world.model.Simpatizzante;

import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "getDati", value = "/dashboard/getDati")
public class GetDati extends HttpServlet {
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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        Account a;
        if(request.getParameter("page") == null){
            // TODO: gestire caso nessuna pagina passata
            response.sendRedirect("/error.html");
            return;
        }
        else if(request.getParameter("page").equals("aderente")){
            a = new Aderente();
        }
        else if(request.getParameter("page").equals("simpatizzante")){
            a = new Simpatizzante();
        }
        else {
            // TODO: gestire casi in cui arrivino cose strane
            response.sendRedirect("/error.html");
            return;
        }

        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null){
            // TODO: gestire casi in cui arrivino cose strane
            response.sendRedirect("/error.html");
            return;
        }

        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM ACCOUNT WHERE Username = '" + session.getAttribute("username") + "'";
            ResultSet results = stmt.executeQuery(sql);
            while (results.next()) {
                a.setNome(results.getString("Nome"));
                a.setCognome(results.getString("Cognome"));
                a.setEmail(results.getString("Email"));
                a.setCellulare(results.getString("Cellulare"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date d = sdf.parse(results.getString("DataDiNascita"));
                sdf.applyPattern("dd-MM-yyyy");
                a.setDataDiNascita(sdf.format(d));
                a.setUsername(results.getString("Username"));
            }
            results.close();
            stmt.close();

        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
            response.sendRedirect("error.html");
        } catch (ParseException e) {
            throw new IllegalArgumentException(e.getMessage(), e);
        }

        try (PrintWriter out = response.getWriter()) {
            String accountJson = gson.toJson(a);
            out.println(accountJson);
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