package com.naoido.webpro.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import com.naoido.webpro.util.DatabaseUtil;

@WebServlet("/init")
public class InitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement()) {
            // SQLファイルを読み込む
            String sql = new String(Files.readAllBytes(Paths.get(getClass().getClassLoader().getResource("create_database.sql").toURI())));
            // SQL文を実行
            for (String query : sql.split(";")) {
                if (!query.trim().isEmpty()) {
                    stmt.executeUpdate(query);
                }
            }
            resp.getWriter().println("Database initialized successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.getWriter().println("Database initialization failed.");
        } catch (URISyntaxException e) {
            e.printStackTrace();
            resp.getWriter().println("SQL file not found.");
        }
    }
}