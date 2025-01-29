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
  <title>プロフィール編集</title>
  <link rel="stylesheet" href="test.css">
</head>
<body>
<div class="profile-container">
  <h1>プロフィール編集</h1>
  <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="post">
    <label>名前: <input type="text" name="name" value="<%= name %>"></label><br>
    <label>生年月日: <input type="date" name="birthday" value="<%= birthday %>"></label><br>
    <label>年齢: <input type="number" name="age" value="<%= age %>"></label><br>
    <button type="submit">保存</button>
  </form>
  <a href="profile.jsp">キャンセル</a>
</div>
</body>
</html>
