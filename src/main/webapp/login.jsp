<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Login</title>
  </head>
  <body>
   <h2>Login</h2>
    <% if (request.getParameter("error") != null) { %>
      <p style="color: red;">Invalid email or password.</p>
    <% } %>
    <form action="login" method="post">
      <label>email: <input type="text" name="email"></label><br>
      <label>Password: <input type="password" name="password"></label><br>
      <button type="submit">Login</button>
    </form>
  </body>
</html>