package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "setAttivita", value = "/dashboard/setAttivita")
public class SetAttivita extends HttpServlet {
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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // per l'utente attuale trova le attività associate
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        ArrayList<String> iscrizioni = new ArrayList<>();

        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null){
            return;
        }
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM ATTIVITA WHERE Account = '" + session.getAttribute("username") + "'";
            ResultSet results = stmt.executeQuery(sql);
            while (results.next()) {
                iscrizioni.add(results.getString("Attivita"));
            }
            results.close();
            stmt.close();

        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
        }

        try (PrintWriter out = response.getWriter()) {
            String iscrizioniJson = gson.toJson(iscrizioni);
            out.println(iscrizioniJson);
            out.flush();
        }
        catch (IOException e) {
            System.err.println(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // modifica le attività dell'utente attualmente loggato
        String[] aggiungi = request.getParameterValues("aggiungi");
        String[] rimuovi = request.getParameterValues("rimuovi");

        // aggiungi attività al database
        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null){
            return;
        }
        try {
            ResultSet rs;
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ATTIVITA " +
                    "VALUES(?, '" + session.getAttribute("username") + "')");
            PreparedStatement prePstmt = conn.prepareStatement("SELECT * FROM ATTIVITA " +
                    "WHERE Account='" + session.getAttribute("username") +
                    "' AND Attivita=?");

            if(aggiungi != null){
                for (String s : aggiungi) {
                    // verifica se l'attività è già presente
                    // se no -> aggiungila
                    prePstmt.setString(1, s);
                    rs = prePstmt.executeQuery();
                    if (!rs.next()) {
                        pstmt.setString(1, s);
                        pstmt.executeUpdate();
                    }
                }
            }

            pstmt = conn.prepareStatement("DELETE FROM ATTIVITA " +
                                            "WHERE account='" + session.getAttribute("username") +
                                            "' AND attivita=?");
            if(rimuovi != null){
                for (String s : rimuovi) {
                    // verifica se l'attività è già presente
                    // se si -> rimuovila
                    prePstmt.setString(1, s);
                    rs = prePstmt.executeQuery();
                    if (rs.next()) {
                        pstmt.setString(1, s);
                        pstmt.executeUpdate();
                    }
                }
            }
            prePstmt.close();
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