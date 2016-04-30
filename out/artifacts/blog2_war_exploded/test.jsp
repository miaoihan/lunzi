<%--
  User: han
  Date: 16-4-30
  Time: 下午4:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>Title</title>
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
<%
    String ss = "晗";
    out.print(ss);
    String qq = request.getParameter("aa");
    out.print(qq);
%>
<form action="test.jsp">
    <input type="text" name="aa">
    <input type="submit">
</form>
</body>
</html>
