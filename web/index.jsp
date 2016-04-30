<%--
  User: han
  Date: 16-4-27
  Time: 上午11:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8") ;%>
<html>
<head>
    <title>登陆</title>
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>

<form action="login">
    <p>用户名:<input type="text" name="username"></p>
    <p>密码:<input type="text" name="password"></p>
    <input type="submit" value="登陆">
</form>
</body>
</html>
