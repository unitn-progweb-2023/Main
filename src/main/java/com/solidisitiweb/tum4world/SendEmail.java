package com.solidisitiweb.tum4world;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.mail.Authenticator;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet(name = "sendEmail", value = "/sendEmail")
public class SendEmail extends HttpServlet {

    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");;
        String email = request.getParameter("email");;
        String motivo = request.getParameter("motivazioni");;
        String ulterioriInfo = request.getParameter("ulteriori");;


        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.Tum4World.com");
        props.put("mail.smtp.port", "587");
        //props.put("mail.smtp.auth", "true");
        //props.put("mail.smtp.starttls.enable", "true");

        Session sessioneSMTP = Session.getInstance(props, null);
       /* Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("usr", "psw");
            }
        });*/
        try {
            MimeMessage msg = new MimeMessage(sessioneSMTP);
            msg.setFrom(new InternetAddress(email));
            msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse("tum4world@nessunonoluogonoesiste.com"));
            msg.setSubject(motivo);
            msg.setText("Ciao, sono " + nome + " " + cognome + ".\n" +
                    "Scrivo per: " + motivo + ". \n " + ulterioriInfo);
            Transport.send(msg);

            System.out.println("Email inviata con successo");
            response.sendRedirect("invioconfermato.jsp");
        } catch (MessagingException mex) {
            System.out.println("send failed, exception: " + mex);
        }

    }

    public void destroy() {

    }
}
