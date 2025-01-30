<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.naoido.webpro.util.DatabaseUtil" %>
<html>
<head>
    <title>占い結果一覧</title>
</head>
<body>
<h1>占い結果</h1>
<%
    String tarotResult = (String) session.getAttribute("tarotResult");
    String birthdayFortune = (String) session.getAttribute("birthdayFortune");
    String kanjiFortune = (String) session.getAttribute("kanjiFortune");
    String todayFortune = (String) session.getAttribute("todayFortune");

    if (tarotResult != null) {
%>
<h2>タロットカードの結果</h2>
<p><%= tarotResult %></p>
<%
} else {
%>
<p>まだタロット占いをしていません。</p>
<%
    }

    if (birthdayFortune != null) {
%>
<h2>誕生日占いの結果</h2>
<p>運勢: <%= birthdayFortune %></p>
<%
} else {
%>
<p>まだ誕生日占いをしていません。</p>
<%
    }

    if (kanjiFortune != null) {
%>
<h2>漢字占いの結果</h2>
<p>運勢: <%= kanjiFortune %></p>
<%
} else {
%>
<p>まだ漢字占いをしていません。</p>
<%
    }

    if (todayFortune != null) {
%>
<h2>今日の運勢の結果</h2>
<p>運勢: <%= todayFortune %></p>
<%
} else {
%>
<p>まだ今日の運勢を占っていません。</p>
<%
    }
%>

<h2>過去10人のタロットカードの結果</h2>
<%
    try (Connection conn = DatabaseUtil.getConnection();
         PreparedStatement pstmt = conn.prepareStatement("SELECT card_name FROM TarotResults ORDER BY created_at DESC LIMIT 10");
         ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            out.println("<p>" + rs.getString("card_name") + "</p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<a href="birthdayfortune.jsp">誕生日占いをする</a>
<a href="kanji-fortune.jsp">漢字占いをする</a>
<a href="today.jsp">今日の運勢を占う</a>
<a href="tarott.jsp">タロット占いをする</a>
</body>
</html>
