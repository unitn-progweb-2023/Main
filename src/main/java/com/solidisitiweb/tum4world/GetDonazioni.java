package com.solidisitiweb.tum4world;

import com.google.gson.Gson;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Calendar;

@WebServlet(name = "getDonazioni", value = "/dashboard/getDonazioni")
public class GetDonazioni extends HttpServlet {
    String dbURL = "jdbc:derby://localhost:1527/Tum4World";
    String user = "App";
    String password = "pw";
    Connection conn = null;
    Gson gson;

    public void init() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException | NullPointerException e) {
            System.out.println(e);
        }
        gson = new Gson();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        int[] donazioni = new int[12];
        for (int i = 0; i < 12; i++) {
            donazioni[i] = 0;
        }
        try {
            String sql = "SELECT * FROM DONAZIONE WHERE YEAR(DataDonazione) = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Calendar.getInstance().get(Calendar.YEAR));

            ResultSet results = pstmt.executeQuery();

            while (results.next()) {
                Date dataDonazione = results.getDate("DataDonazione");
                Calendar donationCalendar = Calendar.getInstance();
                donationCalendar.setTime(dataDonazione);
                int meseDonazione = donationCalendar.get(Calendar.MONTH);

                int importo = results.getInt("Importo");

                donazioni[meseDonazione] += importo;
            }
            results.close();
            pstmt.close();

        } catch (SQLException | NullPointerException e) {
            System.err.println(e);
            response.sendRedirect("error.html");
        }

        try (PrintWriter out = response.getWriter()) {
            String donazioneJson = gson.toJson(donazioni);
            out.println(donazioneJson);
            out.flush();
        }
        catch (IOException e) {
            System.err.println(e);
            response.sendRedirect("error.html");
        }
    }

    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
