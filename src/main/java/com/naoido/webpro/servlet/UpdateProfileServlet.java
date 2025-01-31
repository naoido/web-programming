package com.naoido.webpro.servlet;

import java.io.IOException;

import com.naoido.webpro.dao.UserDao;
import com.naoido.webpro.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private final UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();

        String userId = String.valueOf(((User) session.getAttribute("user")).getId());
        String username = req.getParameter("name");
        String email = req.getParameter("email");
        if (!userDao.updateUserProfile(username, email, userId)) {
            res.sendRedirect("profile.jsp?error=internal_server_error");
            return;
        }

        session.setAttribute("user", new User(Integer.parseInt(userId), username, email));

        res.sendRedirect("profile.jsp?success=true");
    }
}
