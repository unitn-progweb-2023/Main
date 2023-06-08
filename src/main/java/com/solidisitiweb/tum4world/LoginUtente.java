package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "loginUtente", value = "/loginUtente")
public class LoginUtente extends HttpServlet {
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

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username.length() > 0 && password.length() > 0){
            // cerco informazioni inserite nel database
            try {
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM ACCOUNT WHERE username='" + username + "'";
                ResultSet results = stmt.executeQuery(sql);

                if(results.next()){
                    String pswdb = results.getString("Password");
                    String tipoUtente = results.getString("Type");
                    results.close();
                    stmt.close();

                    if(password.equals(pswdb)){
                        HttpSession session = request.getSession();
                        session.setAttribute("tipoUtente", tipoUtente);
                        session.setAttribute("username", username);

                        if(tipoUtente.equals("AD")){
                            response.sendRedirect("dashboard/aderente.jsp");
                        }
                        else if(tipoUtente.equals(("SI"))){
                            response.sendRedirect("dashboard/simpatizzante.jsp");
                        }
                        else if(tipoUtente.equals("AM")){
                            response.sendRedirect("dashboard/amministratore.jsp");
                        }
                        else{
                            request.setAttribute("error", "05: tipologia utente non valida");
                            request.getRequestDispatcher("/login.jsp").forward(request, response);
                        }
                    }
                    else{
                        request.setAttribute("error", "05: password errata");
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                }
                else{
                    results.close();
                    stmt.close();
                    request.setAttribute("error", "05: username non valido");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } catch (SQLException | NullPointerException e) {
                System.err.println(e);
                response.sendRedirect("error.html");
            }
        }
        else {
            request.setAttribute("error", "05: riempire tutti i campi");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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
