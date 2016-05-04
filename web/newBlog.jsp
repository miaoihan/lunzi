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
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
    <!-- action 就是URL -->
    <form action="newBlog" method="post" >
        <p>标题: <input type="text" name="title" value=""></p>
        <p>内容: <textarea name="content" id="" cols="35" rows="50" style="height: 230px;width: 400px;"></textarea></p>
        <input type="submit" value="发表" class="btn btn-primary" onclick="return check(this.form)">
    </form>
</body>

<script>
    function check(form) {
        if(form.title.value.trim()=='') {
            alert("请输入用户帐号!");
            form.title.focus();
            return false;
        }
        if(form.content.value.trim()==''){
            alert("请输入登录密码!");
            form.content.focus();
            return false;
        }
        return true;
    }

    /** 构造trim()方法 */
    String.prototype.trim=function(){
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    String.prototype.ltrim=function(){
        return this.replace(/(^\s*)/g,"");
    }
    String.prototype.rtrim=function(){
        return this.replace(/(\s*$)/g,"");
    }
</script>
</Document>
