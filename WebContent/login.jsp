<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>世界上第一个人脸识别点饭网站</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%
	// stylesheet
%>
<link href="css/dianfan.css" rel="stylesheet" media="screen">
<link href="css/login.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<%
	// icon
%>
<link rel="icon" href="httP://www.find1x.com/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="http://www.find1x.com/favicon.ico"
	type="image/x-icon" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/html5shiv.js"></script>
	<script src="../../assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div align="center">
		<ul class="nav nav-pills" style="max-width: 300px;">
			<li class="active"><a href="#login" data-toggle="pill">登录</a></li>
			<li><a href="#signup" data-toggle="pill">免费注册</a></li>
		</ul>
	</div>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="login">
			<form id=login action=LoginAction method="post" class="form-login">
				<input name="user.username" type="text" class="form-control"
					placeholder="用户名" autofocus /> <input name="user.password"
					type="password" class="form-control" placeholder="密码" /> <label
					class="checkbox"> <input type="checkbox"
					value="remember-me" /> 记住我
				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit">
					登录</button>
			</form>
		</div>
		<div class="tab-pane fade" id="signup">
			<form id="signup" action="SignUpAction" method="post"
				class="form-signup">
				<input id="username" name="user.username" type="text"
					class="form-control" placeholder="用户名" autofocus /> <input
					id="password" name="user.password" type="password"
					class="form-control" placeholder="密码" /> <input id="repassword"
					name="user.repassword" type="password" class="form-control"
					placeholder="请再输一遍您的密码" /> <br /> <input
					class="btn btn-lg btn-primary btn-block" type="submit" value="注册" />
					</form>
		</div>
	</div>

	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>