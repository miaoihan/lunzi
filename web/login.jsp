<%--
  User: han
  Date: 16-4-27
  Time: 下午12:31
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8") ;%>
<html>
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h4>用户登录</h4>
            <form action="login" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail1" class="col-lg-2 control-label">用户名</label>
                    <div class="col-lg-10">
                        <input type="text" name="username" id="inputEmail1" placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword1" class="col-lg-2 control-label">密码</label>
                    <div class="col-lg-10">
                        <input type="password" name="password" id="inputPassword1" placeholder="密码">
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
                        <button type="submit" class="btn btn-primary btn-wide" onclick="return check(this.form)">登陆</button>
                    </div>
                </div>
            </form>
            <div class="col-lg-offset-1 col-lg-10">
                没有账号？<a href="register.jsp">注册</a>
            </div>
        </div><!-- /.col-md-12 -->

    </div><!-- /.row -->

</div> <!-- end container -->
    <script>
        function check(form) {
            if(form.username.value.trim()=='') {
                alert("请输入用户帐号!");
                form.username.focus();
                return false;
            }
            if(form.password.value.trim()==''){
                alert("请输入登录密码!");
                form.password.focus();
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
</body>
</html>
