package com.naoido.webpro.DAO;

import java.sql.*;

public class DAO {
    public static int kanji(String name) throws SQLException, ClassNotFoundException {
        String sql = "SELECT kakusuu FROM kanji WHERE kanji = ?";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);) {
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            int kakusuu = 0;

            while (rs.next()) {
                kakusuu = rs.getInt("kakusuu");
            }
            return kakusuu;
        }
    }
}
