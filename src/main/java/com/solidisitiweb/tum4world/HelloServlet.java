package com.solidisitiweb.tum4world;

import java.io.*;
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

        /*
        // per convertire in stringa il contenuto del file header.html
        // ispirato da: https://www.geeksforgeeks.org/java-program-to-extract-content-from-a-html-document/
        StringBuilder headerString = new StringBuilder();
        BufferedReader buffer = new BufferedReader((new FileReader("header.html"))); // not found aaaa

        String aux;
        while((aux = buffer.readLine()) != null) { headerString.append(aux); }
        */
        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>" +
                "    <title>Tum4World</title>" +
                "    <link rel=\"icon\" href=\"resources/favicon.ico\">" +
                "</head>");
        // out.println(headerString.toString());
        out.println("<body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}