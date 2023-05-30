package com.solidisitiweb.tum4world;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.text.html.parser.Parser;

@WebServlet(name = "deleteAccount", value = "/dashboard/deleteAccount")
public class DeleteAccount extends HttpServlet {

    public void init() {
        //db connection
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // delete account

        response.sendRedirect("/home.jsp");
    }

    public void destroy() { //db disconnection
    }
}