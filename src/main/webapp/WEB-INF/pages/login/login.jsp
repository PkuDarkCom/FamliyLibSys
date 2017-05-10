<jsp:include page="../include/nav.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<body class="login1">
	<!-- Login Screen -->
	<div class="login-wrapper">
		<div class="login-container">
			<a href="./"><img width="220" height="120"
				src="../../images/jrq-logo.png" /></a>
			<form action="">
				<div class="form-group">
					<input id="username" class="form-control" placeholder="用户名" type="text">
				</div>
				<div class="form-group">
					<input id="password" class="form-control" placeholder="密码" type="text">
					<!--  <input	type="submit" value="&#xf054;">-->
				</div>
				<div class="form-options clearfix">
					
				</div>
			</form>
			<div class="social-login clearfix">
				<a class="btn btn-primary pull-middle renren" onclick="login();">登录</a>
			</div>
			<!-- <p class="signup">
				还没有账号？<a href="signup1.html">立即注册</a>
			</p> -->
		</div>
	</div>
	<!-- End Login Screen -->
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
<script type="text/javascript">

function login(){
    	//用户名
        var username = $("#username").val();
        username = $.trim(username);
        if(username == null || username =="" || username =="用户名"){
    		   alert("用户名不能为空！");
    		   return ;
    	}
        //密码
        var password = $("#password").val();
        password = $.trim(password);
        if(password == null || password =="" || password =="密码"){
    		   alert("密码不能为空！");
    		   return ;
    	}
        
        // 登录成功
        $.ajax({
            type: "POST",
            url: "/login/checkLogin",
            data: {"username": username,
                "password": password
            },
            dataType: "json",
            success: function (data) {
                if (data.status == 0) {
                	window.location = "/trader/trader";         	 
                }else if (data.status == 1) {
                	alert("用户名或者密码错误！");               	
                }else if (data.status == 2) {
                	alert("抱歉，该账户已被冻结！");
                }
            }
        });
    	
}
</script>
</html>