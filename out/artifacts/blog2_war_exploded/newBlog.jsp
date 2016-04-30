<%--
  User: han
  Date: 16-4-29
  Time: 下午11:38
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<head>
    <title>新博文</title>
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
    <!-- action 就是URL -->
    <form action="newBlog" method="post" >
        <p>标题: <input type="text" name="title" value="" class="form-control"></p>
        <p>内容: <textarea name="content" id="" cols="35" rows="50" class="form-control" style="height: 230px;width: 400px;"></textarea></p>
        <input type="submit" value="发表" class="btn btn-primary">
    </form>
</body>
</Document>
