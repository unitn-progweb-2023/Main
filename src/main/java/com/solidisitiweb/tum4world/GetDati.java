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
            return;
        }
        else if(request.getParameter("page").equals("aderente")){
            a = new Aderente();
        }
        else if(request.getParameter("page").equals("simpatizzante")){
            a = new Simpatizzante();
        }
        else {
            return;
        }

        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null){
            System.err.println(request.getRequestURL());
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
                /**
                 * la data di nascita viene salvata nel database nel formato yyyy-mm-dd
                 * vogliamo che venga visualizzata nel formato dd-mm-yyyy
                 */
                // SimpleDateFormat permette di specificare il formato della data
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // mm sono i minuti, MM i mesi
                // salva in dataDiNascita la data salvata nel database(formato sbagliato)
                java.util.Date dataDiNascita = sdf.parse(results.getString("DataDiNascita"));
                // cambia il formato da utilizzare
                sdf.applyPattern("dd-MM-yyyy");
                // setta la data(col formato giusto) nell'oggetto da restituire
                a.setDataDiNascita(sdf.format(dataDiNascita));
                a.setUsername(results.getString("Username"));
            }
            results.close();
            stmt.close();

        } catch (SQLException | NullPointerException | ParseException e) {
            System.err.println(e);
        }

        try (PrintWriter out = response.getWriter()) {
            String accountJson = gson.toJson(a);
            out.println(accountJson);
            out.flush();
        }
        catch (IOException e) {
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