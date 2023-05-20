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
        System.out.println(Arrays.toString(attivita));


        // aggiungi attività al database

        response.sendRedirect("/index.jsp");
    }
}