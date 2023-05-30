package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "utentiRegistrati", value = "/dashboard/utentiRegistrati")
public class UtentiRegistrati extends HttpServlet {

    public void init() {
        //db connection
        }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        try (PrintWriter o = response.getWriter()){
            o.println("<html>");
            request.getRequestDispatcher("./header.html").forward(request, response);
            o.println("<body>");
            o.println("</body></html>");
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() { //db disconnection
    }
}