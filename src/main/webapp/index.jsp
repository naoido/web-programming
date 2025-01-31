<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.naoido.webpro.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.naoido.webpro.dao.ResultDao" %>
<%@ page import="com.naoido.webpro.model.Result" %>
<%
  if (session == null || session.getAttribute("authenticated") == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
      body {
        margin: 0;
      }
      ul {
        list-style: none;
        padding: 0;
      }
      li {
        background: #fff;
        margin: 10px 0;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        font-size: 18px;
      }
      .username {
        font-weight: bold;
        color: #ff5722;
      }
      .title {
        font-size: 16px;
        color: #3f51b5;
      }
      .result {
        font-size: 16px;
        font-weight: bold;
        color: #4caf50;
      }
    </style>
  </head>
  <body>
    <jsp:include page="nav.jsp">
      <jsp:param name="page" value="index" />
    </jsp:include>

    <h1>Welcome, <%= user.getUsername() %>!</h1>

    <h2>最近の占い結果</h2>
    <%
      List<Result> fortunes = ResultDao.INSTANCE.getResults();
      if (fortunes != null && !fortunes.isEmpty()) {
        for (Result result : fortunes) {
    %>
    <li>
      <span class="username"><%= result.getUsername() %>さん</span><br>
      <span class="title"><%= result.getTitle() %></span>: <span class="result"><%= result.getResult() %></span>
    </li>
    <%
        }
      } else {
    %>
    <li>まだ占い結果がありません。</li>
    <% } %>
  </body>
</html>
