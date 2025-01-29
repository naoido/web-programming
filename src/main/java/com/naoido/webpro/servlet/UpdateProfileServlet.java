package com.naoido.webpro.servlet;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();

        session.setAttribute("name", req.getParameter("name"));
        session.setAttribute("birthday", req.getParameter("birthday"));
        session.setAttribute("age", Integer.parseInt(req.getParameter("age")));

        // プロフィール画面にリダイレクト
        res.sendRedirect(req.getContextPath() + "/profile.jsp");
    }
}
