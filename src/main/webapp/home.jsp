<%
    if (session == null || session.getAttribute("authenticated") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<h1>Welcome, <%= username %>!</h1>
</body>
</html>
