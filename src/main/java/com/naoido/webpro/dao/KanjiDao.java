package com.naoido.webpro.dao;

import java.sql.*;

public class KanjiDao {
    public static int kanji(String name) throws SQLException, ClassNotFoundException {
        String sql = "SELECT strokes FROM kanjis WHERE kanji = ?";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("strokes");
            }
            return 0;
        }
    }
}
