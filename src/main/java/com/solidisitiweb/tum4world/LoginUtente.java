package com.solidisitiweb.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "loginUtente", value = "/loginUtente")
public class LoginUtente extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // response.setContentType("text/html");
        // response.setCharacterEncoding("utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // cosa devo salvare nella sessione?
        // bisogna verificare se la sessione è ancora valida?
        // gestione dei singoli errori?
        // bisogna fare encodeUrl pure qui?

        if(username.length() > 0 && password.length() > 0){
            // cerco informazioni inserite nel database
            String type = "AM";
            // TODO: check se i dati inseriti corrispondono

            if(true){
                HttpSession session = request.getSession();
                session.setAttribute("type", type);
                session.setAttribute("logged", true);
                session.setAttribute("username", username);

                if(type.equals("AD")){
                    response.sendRedirect("/dashboard/aderente.jsp");
                }
                else if(type.equals(("SI"))){
                    response.sendRedirect("/dashboard/simpatizzante.jsp");
                }
                else if(type.equals("AM")){
                    response.sendRedirect("/dashboard/amministratore.jsp");
                }
            }
            else{
                request.setAttribute("error", "05: username non valido o password errata");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
        else {
            request.setAttribute("error", "05: riempire tutti i campi");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
