package com.solidisitiweb.tum4world;

import com.solidisitiweb.tum4world.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@WebServlet(name = "getFrase", value = "/frase")
public class GetFrase extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String[] frasi = {"Uniamo le nostre forze per guarire il mondo, un gesto alla volta","Ogni donazione, grande o piccola, fa la differenza nella vita delle persone che serviamo",
                "Insieme possiamo superare le sfide e costruire un futuro più sano e luminoso","Il nostro impegno e' guidato dalla speranza di creare un mondo in cui nessuno sia lasciato indietro nella lotta per la salute e il benessere",
        "Insieme possiamo superare le sfide, guarire le ferite e costruire una comunita' globale basata sulla solidarieta' e sulla cura reciproca"};

        response.setContentType("text/plain");

        int rnd = new Random().nextInt(frasi.length);

        PrintWriter o = response.getWriter();
        o.println(frasi[rnd]);

    }
}