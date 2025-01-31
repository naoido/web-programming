<%@ page contentType="text/html;charset=UTF-8" %>
<%
  String currentPage = request.getParameter("page") != null ? request.getParameter("page") : "index";
%>
<div class="navbar">
  <a href="index.jsp" class="<%= "index".equals(currentPage) ? "active" : "" %>">Home</a>
  <a href="profile.jsp" class="<%= "profile".equals(currentPage) ? "active" : "" %>">Profile</a>
  <a href="kanji-fortune.jsp" class="<%= "kanji".equals(currentPage) ? "active" : "" %>">Kanji</a>
  <a href="birthdayfortune.jsp" class="<%= "birthday".equals(currentPage) ? "active" : "" %>">Birthday</a>
  <a href="today.jsp" class="<%= "today".equals(currentPage) ? "active" : "" %>">Today</a>
  <a href="tarot.jsp" class="<%= "tarot".equals(currentPage) ? "active" : "" %>">Tarot</a>
  <a href="logout" class="">Logout</a>
</div>

<style>
  .navbar {
    display: flex;
    justify-content: center;
    background-color: #333;
    padding: 15px 0;
  }

  .navbar a {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    font-size: 16px;
    position: relative;
  }

  .navbar a.active::after {
    content: "";
    display: block;
    height: 3px;
    background-color: #f1c40f;
    width: 100%;
    position: absolute;
    bottom: -5px;
    left: 0;
  }
</style>