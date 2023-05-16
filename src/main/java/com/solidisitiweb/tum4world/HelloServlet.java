package com.solidisitiweb.tum4world;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.text.html.parser.Parser;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello un cazzo World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        try (PrintWriter o = response.getWriter()){
            o.println("<html>");
            request.getRequestDispatcher("./header.html").include(request, response);
            o.println("<body>");
            o.println("<h1>" + message + "</h1>");
            o.println("</body></html>");
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}