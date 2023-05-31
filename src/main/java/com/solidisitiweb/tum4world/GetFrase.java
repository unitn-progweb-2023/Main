package com.solidisitiweb.tum4world;

import com.solidisitiweb.tum4world.model.FraseMotivazionale;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "getFrase", value = "/frase")
public class GetFrase extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        FraseMotivazionale frase = new FraseMotivazionale();
        response.setContentType("application/json");
        String fraseJSON = "{ \"testo\" : \""+ frase.getFrase() +"\" }";
        response.getWriter().write(fraseJSON);
    }
}