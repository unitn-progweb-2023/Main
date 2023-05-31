package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "visite", value = "/dashboard/visite")
public class Visite extends HttpServlet {

    public void init() {
        //db connection
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        try (PrintWriter o = response.getWriter()){
            request.getRequestDispatcher("./header.html").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() { //db disconnection
    }
}