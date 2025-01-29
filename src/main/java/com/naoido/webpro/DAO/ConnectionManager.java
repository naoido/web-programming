package com.naoido.webpro.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    private final static String URL = "jdbc:mysql://localhost:3306/web_programming?useSSL=false";
    private final static String USER = "admin";
    private final static String PASSWORD = "admin";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
