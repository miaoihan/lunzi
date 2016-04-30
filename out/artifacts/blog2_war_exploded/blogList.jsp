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
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
    <% List<Blog> blogs = (List<Blog>) request.getAttribute("blogs"); %>
    <%--<% if (null!=session.getAttribute("user")) {--%>
        <%--User user = (User) session.getAttribute("user");--%>
        <%--out.print("欢迎您，" + user.getNikname());--%>
    <%--}else--%>
        <%--response.sendRedirect("login.jsp");--%>
    <%--%>--%>
    <!-- Static navbar -->
    <%--<div class="navbar navbar-default navbar-fixed-top" role="navigation">--%>
        <%--<div class="container">--%>
            <%--<div class="navbar-header">--%>
                <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--%>
                    <%--<span class="sr-only">Toggle navigation</span>--%>
                <%--</button>--%>
                <%--<a class="navbar-brand" href="#">博客</a>--%>
            <%--</div>--%>
            <%--<div class="navbar-collapse collapse">--%>
                <%--<ul class="nav navbar-nav">--%>
                    <%--<li class="active"><a href="#">主页</a></li>--%>
                    <%--<li><a href="#about">关于</a></li>--%>
                    <%--<li><a href="#contact">联系我</a></li>--%>
                    <%--<li class="dropdown">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="#">设置</a></li>--%>
                            <%--<li><a href="#">关注</a></li>--%>
                            <%--<li><a href="#">登出</a></li>--%>
                            <%--<li class="divider"></li>--%>
                            <%--<li class="dropdown-header">Nav header</li>--%>
                            <%--<li><a href="#">Separated link</a></li>--%>
                            <%--<li><a href="#">One more separated link</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<ul class="nav navbar-nav navbar-right">--%>
                    <%--<li><a href="#">Default</a></li>--%>
                    <%--<li class="active"><a href="./">Static top</a></li>--%>
                    <%--<li><a href="#">Fixed top</a></li>--%>
                <%--</ul>--%>
            <%--</div><!--/.nav-collapse -->--%>
        <%--</div>--%>
    <%--</div>--%>

    <h4>博客列表</h4>
    <a href="newBlog.jsp">写新博文</a><br>
    <table>
        <tr><th>标题:</th><th>内容</th><th>操作</th></tr>

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
