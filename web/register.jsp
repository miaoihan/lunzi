<%--
  User: han
  Date: 16-4-27
  Time: 下午2:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>注册 </title>
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h4>用户注册</h4>
            <form action="register" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail1" class="col-lg-2 control-label">昵称</label>
                    <div class="col-lg-10">
                        <input type="text" name="nikname" placeholder="昵称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail1" class="col-lg-2 control-label">用户名</label>
                    <div class="col-lg-10">
                        <input type="text" name="username" id="inputEmail1" placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword1" class="col-lg-2 control-label">密码</label>
                    <div class="col-lg-10">
                        <input type="password" name="password" id="inputPassword1"
                               placeholder="密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <label class="checkbox" for="checkbox3">
                            <input type="checkbox" data-toggle="checkbox" value="" id="checkbox3">
                            记住我
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary btn-wide" onclick="return check(this.form)">注册</button>
                    </div>
                </div>
            </form>
        </div><!-- /.col-md-12 -->

    </div><!-- /.row -->
</div>
<script>
    function check(form) {

        if (form.nikname.value.trim() == '') {
            alert("请输入用户昵称!");
            form.nikname.focus();
            return false;
        }
        if (form.username.value.trim() == '') {
            alert("请输入用户帐号!");
            form.username.focus();
            return false;
        }
        if (form.password.value.trim() == '') {
            alert("请输入登录密码!");
            form.password.focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>
