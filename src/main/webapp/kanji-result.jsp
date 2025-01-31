<%--
  Created by IntelliJ IDEA.
  User: cabba
  Date: 1/29/2025
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            margin: 0;
        }
    </style>
</head>
<body>
    <%= session.getAttribute("luck")%><br>
    <%= session.getAttribute("kakusuu")%>
</body>
</html>
