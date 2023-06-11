package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Logout", value = "/dashboard/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO: encodeURL()
        req.getSession().removeAttribute("username");
        req.getSession().removeAttribute("tipoUtente");
        resp.sendRedirect("../home.jsp");
    }
}
