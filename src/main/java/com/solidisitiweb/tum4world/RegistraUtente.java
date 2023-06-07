package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "registraUtente", value = "/registraUtente")
public class RegistraUtente extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String dataNascita = request.getParameter("dataNascita");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String tipoUtente = request.getParameter("tipoUtente");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // devo fare ancora validazione dati?

        if(true){ // username non presente nel database
            // crea utente con dati inseriti e inseriscilo nel database


            HttpSession session = request.getSession();
            session.setAttribute("type", tipoUtente);
            session.setAttribute("logged", true);
            session.setAttribute("username", username);

            response.sendRedirect("registrazioneconfermata.jsp");
        }
        else{
            request.setAttribute("error", "05: username non disponibile");
            request.getRequestDispatcher("/signin.jsp").forward(request, response);
        }
    }
}
