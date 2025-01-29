<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%
    String name = (String) session.getAttribute("name");
    String birthday = (String) session.getAttribute("birthday");
    Integer age = (Integer) session.getAttribute("age");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>プロフィール</title>
    <link rel="stylesheet" href="test.css">
</head>
<body>
<div class="profile-container">
    <h1>プロフィール</h1>
    <p><strong>名前:</strong> <%= name %></p>
    <p><strong>生年月日:</strong> <%= birthday %></p>
    <p><strong>年齢:</strong> <%= age %>才</p>
    <a href="edit.jsp">編集</a>
</div>
</body>
</html>
