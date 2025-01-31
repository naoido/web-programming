<%--
  Created by IntelliJ IDEA.
  User: cabba
  Date: 1/29/2025
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
    <jsp:include page="nav.jsp">
        <jsp:param name="page" value="kanji" />
    </jsp:include>
    <h1>名前の画数占い</h1><br>
    <form action="KanjiServlet" method="post">
        <label>
            お名前：
            <input type="text" name="name">
        </label>
        <input type="submit" value="占う">
    </form>
</body>
</html>
