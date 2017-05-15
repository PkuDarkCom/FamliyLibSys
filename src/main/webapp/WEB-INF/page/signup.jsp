<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="/static/asset/css/font-awesome.css">
    <link rel="stylesheet" href="/static/asset/css/se7en-font.css">
    <link rel="stylesheet" href="/static/asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/reset.css">
    <link rel="stylesheet" href="/static/css/global.css">
    <link rel="stylesheet" href="/static/css/login.css">
    <script src="/static/asset/js/jquery-1.11.1.min.js"></script>
</head>
<body>
    <div class="login">
        <form data-type="sign">
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="icon-name"></i></span><input class="form-control" type="text" placeholder="用户名" id="username">
              </div>
              <div class="help-block"></div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="icon-mobile-phone"></i></span><input class="form-control" type="text" placeholder="手机号" id="phoneNo">
              </div>
              <div class="help-block"></div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="icon-lock"></i></span><input class="form-control" type="password" placeholder="密码" id="password">
              </div>
              <div class="help-block"></div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="icon-ok"></i></span><input class="form-control" type="password" placeholder="确认密码" id="confirmPwd">
              </div>
              <div class="help-block"></div>
            </div>
            <div class="help-block" id="fromMsg"></div>
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="注册" id="btnRegister">
            <p>
              已经有账户了？
            </p>
            <a class="btn btn-default-outline btn-block" href="/login/login">立即登录</a>
        </form>
    </div>
    <script src="/static/js/login.js"></script>
</body>
</html>