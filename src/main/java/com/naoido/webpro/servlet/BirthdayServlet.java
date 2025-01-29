package com.naoido.webpro.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.naoido.webpro.util.DatabaseUtil;

@WebServlet("/BirthdayServlet")
public class BirthdayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String horoscope = request.getParameter("horoscope");
        HttpSession session = request.getSession();
        session.setAttribute("birthdayHoroscope", horoscope);

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO FortuneResults (result) VALUES (?)")) {
            pstmt.setString(1, horoscope);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("all-result.jsp");
    }
}