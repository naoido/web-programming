package com.naoido.webpro.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SaveBirthdayFortuneServlet")
public class SaveBirthdayFortuneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String horoscope = request.getParameter("horoscope");

        HttpSession session = request.getSession();
        session.setAttribute("birthdayFortune", horoscope);
        request.setAttribute("horoscope", horoscope);

        request.getRequestDispatcher("birthdayfortune.jsp").forward(request, response);
    }
}