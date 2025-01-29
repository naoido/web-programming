package com.naoido.webpro.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.naoido.webpro.util.DatabaseUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/init")
public class InitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement()) {
            String sql = "CREATE TABLE IF NOT EXISTS FortuneResults (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "result VARCHAR(255) NOT NULL)";
            stmt.executeUpdate(sql);
            resp.getWriter().println("Database initialized successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.getWriter().println("Database initialization failed.");
        }
    }
}