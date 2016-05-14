<%--
  User: han
  Date: 16-5-3
  Time: 下午8:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% response.sendRedirect("login.jsp");
        session.setAttribute("user",null);
    %>
</body>
</html>
