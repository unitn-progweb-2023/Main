package com.solidisitiweb.tum4world;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.*;

public class FilterVisited implements Filter{

    String dbURL = "jdbc:derby://localhost:1527/Tum4World";
    String user = "App";
    String password = "pw";
    Connection conn = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException | NullPointerException e) {
            System.out.println(e);
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest hreq = (HttpServletRequest) servletRequest;

        String pagina = "";
        int numVisite = -1;

        String urlPagina = String.valueOf(hreq.getRequestURL());
        urlPagina = urlPagina.split(";")[0];
        if(urlPagina.endsWith("/") || urlPagina.endsWith("/home.jsp")) {
            pagina = "Homepage";
        }else if(urlPagina.endsWith("/attivita.jsp")){
            pagina = "Attivita";
        } else if(urlPagina.endsWith("/paginaattivita_1.jsp")){
            pagina = "Fornitura Cure";
        } else if(urlPagina.endsWith("/paginaattivita_2.jsp")){
            pagina = "Programmi Educazione";
        } else if(urlPagina.endsWith("/paginaattivita_3.jsp")){
            pagina = "Progetti di Sviluppo";
        } else if(urlPagina.endsWith("/signin.jsp")){
            pagina = "SigIn";
        } else if(urlPagina.endsWith("/chisiamo.jsp")){
            pagina = "Chi Siamo";
        } else if(urlPagina.endsWith("/contatti.jsp")){
            pagina = "Contatti";
        } else if(urlPagina.endsWith("/login.jsp")){
            pagina = "Login";
        } else if(urlPagina.endsWith("/registrazioneconfermata.jsp")){
            pagina = "Registrazione Confermata";
        } else if(urlPagina.endsWith("/invioconfermato.jsp")){
            pagina = "Invio Confermato";
        } else if(urlPagina.endsWith("/aderente.jsp")){
            pagina = "Aderente";
        } else if(urlPagina.endsWith("/simpatizzante.jsp")){
            pagina = "Simpatizzante";
        } else {
            System.out.println("Error if Filter");
        }
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM VISITE WHERE Pagina='" + pagina + "'";
            ResultSet results = stmt.executeQuery(sql);

            if(results.next()){
                numVisite = results.getInt("NumVisite");
                numVisite += 1;
            } else {
                numVisite = -1;
            }
            results.close();

            if(numVisite != -1) {
                String updateSQL = "UPDATE VISITE SET NumVisite = " + String.valueOf(numVisite)
                        + " WHERE Pagina = '" + pagina + "'";
                stmt.executeUpdate(updateSQL);
            } else {
                System.out.println("Pagina non trovata");
            }
            stmt.close();
        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
