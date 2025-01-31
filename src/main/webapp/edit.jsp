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
  <title>プロフィール編集</title>
  <link rel="stylesheet" href="css/profile.css">
</head>
<body>
<div class="profile-container">
  <jsp:include page="nav.jsp">
    <jsp:param name="page" value="profile" />
  </jsp:include>
  <h1>プロフィール編集</h1>
  <form action="UpdateProfileServlet" method="post">
    <label>名前: <input type="text" name="name" value="<%= user.getUsername() %>"></label><br>
    <label>メール: <input type="text" name="email" value="<%= user.getEmail() %>"></label><br>
    <button type="submit">保存</button>
  </form>
  <a href="profile.jsp">キャンセル</a>
</div>
</body>
</html>
