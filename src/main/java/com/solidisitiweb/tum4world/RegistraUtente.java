package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "registraUtente", value = "/registraUtente")
public class RegistraUtente extends HttpServlet {
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

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String dataNascita = request.getParameter("dataNascita");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String tipoUtente = request.getParameter("tipoUtente");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM ACCOUNT WHERE Username = '" + username + "'";
            ResultSet results = stmt.executeQuery(sql);

            if(results.next()){ // username già presente nel database
                results.close();
                stmt.close();

                request.setAttribute("error", "05: username non disponibile");
                request.getRequestDispatcher("/signin.jsp").forward(request, response);
            }else {
                results.close();
                stmt.close();
                // crea utente con dati inseriti e inseriscilo nel database
                System.out.println(dataNascita);
                try {
                    // executeUpdate piange con le date
                    // ? è un placeholder di un valore che verrà specificato in seguito
                    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ACCOUNT" +
                            "(Username, DataDiNascita, Nome, Cognome, Email, Cellulare, Password, Type)" +
                            "VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
                    pstmt.setString(1, username);
                    pstmt.setDate(2, Date.valueOf(dataNascita));
                    pstmt.setString(3, nome);
                    pstmt.setString(4, cognome);
                    pstmt.setString(5, email);
                    pstmt.setString(6, telefono);
                    pstmt.setString(7, password);
                    pstmt.setString(8, tipoUtente);

                    pstmt.executeUpdate();
                    pstmt.close();

                    HttpSession session = request.getSession();
                    session.setAttribute("tipoUtente", tipoUtente);
                    session.setAttribute("username", username);

                    response.sendRedirect("registrazioneconfermata.jsp");
                }
                catch (SQLException | NullPointerException e) {
                    System.err.println(e);
                    response.sendRedirect("error.html");
                }
            }
        } catch (SQLException | NullPointerException e) {
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
