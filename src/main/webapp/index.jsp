<%@ page import="com.naoido.webpro.model.User" %><%
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
  </head>
  <body>
    <jsp:include page="nav.jsp">
      <jsp:param name="page" value="index" />
    </jsp:include>

    <h1>Welcome, <%= user.getUsername() %>!</h1>
  </body>
</html>
