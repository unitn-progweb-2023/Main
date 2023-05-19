package com.solidisitiweb.tum4world;

import com.solidisitiweb.tum4world.model.Account;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.text.html.parser.Parser;

@WebServlet(name = "getDati", value = "/dashboard/getdati")
public class GetDati extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        //prendo dati da database
        Account account = new Account("Mario","Rossi","example@domain.com","3774185988","09/7/2000","minatel");
        request.setAttribute("account", account);

        getServletContext().getRequestDispatcher("dashboard/simpatizzante.jsp").forward(request, response);
    }
}