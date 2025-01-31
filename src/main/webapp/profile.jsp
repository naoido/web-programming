<%@ page import="com.naoido.webpro.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>プロフィール</title>
    <link rel="stylesheet" href="css/profile.css">
    <style>
        body {
            margin: 0;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp">
        <jsp:param name="page" value="profile" />
    </jsp:include>
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Invalid email or password.</p>
    <% } %>
    <div class="container">
        <div class="profile-container">
            <h1>プロフィール</h1>
            <p><strong>名前:</strong> <%= user.getUsername() %></p>
            <p><strong>メール: <%= user.getEmail() %></strong></p>
            <a href="edit.jsp">編集</a>
        </div>
    </div>
</body>
</html>
