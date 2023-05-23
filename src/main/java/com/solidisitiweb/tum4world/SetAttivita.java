package com.solidisitiweb.tum4world;

import java.io.*;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.text.html.parser.Parser;

@WebServlet(name = "setAttivita", value = "/dashboard/setAttivita")
public class SetAttivita extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String[] attivita = request.getParameterValues("attivita");

        String page = request.getParameter("page");


        // aggiungi attività al database

        if(page.equals("aderente")){
            getServletContext().getRequestDispatcher("/dashboard/aderente.jsp").forward(request, response);
        } else if(page.equals("simpatizzante")){
            getServletContext().getRequestDispatcher("/dashboard/simpatizzante.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("/index.jsp");
        }
    }
}