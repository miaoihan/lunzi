<%@ page import="vo.Blog" %>
<%@ page import="java.util.List" %><%--
  User: han
  Date: 16-4-29
  Time: 下午11:38
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<head>
    <title>新博文</title>
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
<% Blog b = (Blog) request.getAttribute("blog");
%>
    <!-- action 就是URL -->
    <form action="editBlog" method="post">
        <input type="hidden" name="id" value="<%= b.getId() %>">
        <input type="hidden" name="user_id" value="<%= b.getUser_id() %>">
        <input type="hidden" name="del_status" value="<%= b.getDel_status() %>">
        <p>标题: <input type="text" name="title" value="<%= b.getTitle() %>" ></p>
        <p>内容: <textarea name="content" id="" cols="30" rows="50" style="height: 230px;width: 400px;"><%= b.getContent() %></textarea></p>
        <input type="submit" value="发表" class="btn btn-primary btn-wide">
    </form>
</body>
