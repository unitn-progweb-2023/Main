package com.solidisitiweb.tum4world;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "getFrase", value = "/frase")
public class GetFrase extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // ---- business logic
        String[] frasi = {"Uniamo le nostre forze per guarire il mondo, un gesto alla volta","Ogni donazione, grande o piccola, fa la differenza nella vita delle persone che serviamo",
                "Insieme possiamo superare le sfide e costruire un futuro piu sano e luminoso","Il nostro impegno e' guidato dalla speranza di creare un mondo in cui nessuno sia lasciato indietro nella lotta per la salute e il benessere",
        "Insieme possiamo superare le sfide, guarire le ferite e costruire una comunita' globale basata sulla solidarieta' e sulla cura reciproca",
        "La vera ricchezza si trova nell'aiutare gli altri. Unisciti a noi e scopri il valore di un gesto altruistico con Tum4World",
        "Il cambiamento inizia da una scintilla di compassione. Sii quella scintilla e aiuta Tum4World a brillare più forte"};
        int rnd = new Random().nextInt(frasi.length);

        response.setContentType("application/json");
        String fraseJSON = "{ \"testo\" : \""+ frasi[rnd] +"\" }";
        response.getWriter().write(fraseJSON);
    }
}