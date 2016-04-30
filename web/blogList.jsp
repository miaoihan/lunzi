<%@ page import="vo.User" %>
<%@ page import="dao.BlogDao" %>
<%@ page import="vo.Blog" %>
<%@ page import="java.util.List" %>
<%--
  User: han
  Date: 16-4-27
  Time: 下午12:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8") ;%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
    <% List<Blog> blogs = (List<Blog>) request.getAttribute("blogs"); %>
    <% if (null!=session.getAttribute("user")) {
        User user = (User) session.getAttribute("user");
        out.print("欢迎您，" + user.getNikname());
    }else
        response.sendRedirect("login.jsp");
    %>

    <h4>博客列表</h4>
    <a href="newBlog.jsp">写新博文</a><br>
    <table>
        <tr><th>标题:</th><th>内容</th></tr>

        <% for (Blog b: blogs) { %>
        <tr>
            <td><%= b.getTitle() %></td>
            <td><%= b.getContent() %></td>
            <td><a href="editBlog?id=<%= b.getId() %>" >编辑</a></td>
            <td><a href="delBlog?id=<%= b.getId() %>" onclick="return confirm('确认删除？')">删除</a></td>
        </tr>
        <% } %>

    </table>

</body>
</html>