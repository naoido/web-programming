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
import java.util.Map; // 追加
import com.naoido.webpro.util.DatabaseUtil;

@WebServlet("/SaveTarotResultServlet")
public class SaveTarotResultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, String> selectedCard = (Map<String, String>) session.getAttribute("selectedCard");

        if (selectedCard != null) {
            String result = "タロットカード: " + selectedCard.get("name") + ", 意味: " + selectedCard.get("meaning") + ", 今日の運勢: " + selectedCard.get("fortune");

            try (Connection conn = DatabaseUtil.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement("INSERT INTO FortuneResults (result) VALUES (?)")) {
                pstmt.setString(1, result);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("tarott.jsp");
    }
}