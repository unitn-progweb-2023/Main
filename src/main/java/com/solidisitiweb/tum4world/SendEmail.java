package com.solidisitiweb.tum4world;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "sendEmail", value = "/sendEmail")
public class SendEmail extends HttpServlet {

    private Session sessioneSMTP;

    public void init() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.Tum4World.com");
        props.put("mail.smtp.port", "587");

        sessioneSMTP = Session.getInstance(props, null);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String motivo = request.getParameter("motivazioni");
        String ulterioriInfo = request.getParameter("ulteriori");

        try {
            MimeMessage msg = new MimeMessage(sessioneSMTP);
            msg.setFrom(new InternetAddress(email));
            msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse("tum4world@nessunonoluogonoesiste.com"));
            msg.setSubject(motivo);
            msg.setText("Ciao, sono " + nome + " " + cognome + ".\n" +
                    "Scrivo per: " + motivo + ". \n " + ulterioriInfo);
            //Transport.send(msg);
            response.sendRedirect(response.encodeURL("invioconfermato.jsp"));
        } catch (MessagingException mex) {
            System.err.println("send failed, exception: " + mex);
            response.sendRedirect(response.encodeURL("error.jsp"));
        }

    }

    public void destroy() {

    }
}
