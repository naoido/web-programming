package com.naoido.webpro.servlet;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("name") == null) {
            session.setAttribute("name", "山田 太郎");
            session.setAttribute("birthday", "2000-01-01");
            session.setAttribute("age", 24);
        }

        try {
            req.getRequestDispatcher("profile.jsp").forward(req, res);
        } catch (Exception e) {
            res.getWriter().println("エラーが発生しました: " + e.getMessage());
        }
    }
}
