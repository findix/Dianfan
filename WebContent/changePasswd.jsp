<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>世界上第一个人脸识别点饭网站</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/dianfan.css" rel="stylesheet" media="screen">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="icon" href="httP://www.find1x.com/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="http://www.find1x.com/favicon.ico"
	type="image/x-icon" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/html5shiv.js"></script>
	<script src="../../assets/js/respond.min.js"></script>
	<![endif]-->
<body>
	<%
		String username = "";
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		}
	%>

	<!-- nav -->
	<%@ include file="nav.html"%>
	<div class="container" style="margin-top: 100px">
		<div class="container" style="max-width: 300px;">
			<%
				if (request.getParameter("status").equals("error")) {
			%>
			<div class="alert alert-danger">用户名或密码错误</div>
			<%
				}
			%>
			<div class="panel panel-warning">
				<div class="panel-heading">修改密码</div>
				<div class="panel-body">
					<form action="ChangePasswd" method="post" class="form-signup">
						<input id="passwordS" name="user.username" type="text"
							class="form-control" placeholder="原密码" autofocus
							onkeydown="if(event.keyCode==13){checkChangePasswd();}" /><br />
						<input id="newPassword" name="user.password" type="password"
							class="form-control" placeholder="新的密码"
							onkeydown="if(event.keyCode==13){checkChangePasswd();}" /><br />
						<input id="reNewPasswordS" type="password" class="form-control"
							placeholder="请再输一遍您的新密码"
							onkeydown="if(event.keyCode==13){checkChangePasswd();}" /><br />
						<input class="btn btn-lg btn-primary btn-block" type="button"
							onclick="checkChangePasswd()" value="修改密码" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function checkChangePasswd() {
			with (document.all) {
				if (passwordS.value == "" || newPassword.value == ""
						|| reNewPasswordS == "") {
					alert("对不起，密码不能为空，请重新输入。");
				} else if (newPassword.value != reNewPasswordS.value) {
					alert("对不起，您两次输入的密码不一致，请重新输入。");
					newPassword.value = "";
					reNewPasswordS.value = "";
				} else
					document.forms[0].submit();
			}
		}
	</script>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>