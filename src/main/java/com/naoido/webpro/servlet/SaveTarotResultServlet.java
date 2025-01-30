package com.naoido.webpro.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map; // 追加

@WebServlet("/SaveTarotResultServlet")
public class SaveTarotResultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, String> selectedCard = (Map<String, String>) session.getAttribute("selectedCard");

        if (selectedCard != null) {
            String result = "タロットカード: " + selectedCard.get("name") + ", 意味: " + selectedCard.get("meaning") + ", 今日の運勢: " + selectedCard.get("fortune");
            session.setAttribute("tarotResult", result);
        }

        response.sendRedirect("tarott.jsp");
    }
}