<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.find1x.dianfan.util.QueryUtil"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>点饭网|dianfan.tk - 第一家人脸识别点餐网站</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- stylesheet -->
<link href="css/dianfan.css" rel="stylesheet" media="screen" />
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
<!-- icon -->
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
	<%
		String username = "";
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		}
	%>

	<!-- nav -->
	<%@ include file="nav.html"%>

	<div class="container" style="margin-top: 100px">
		<div id="jumbotron" class="jumbotron" align="left"
			style="width: 100%;">
			<h2>对不起哦，我很懒，所以出错鸟……</h2>
			<br />
			<a class="btn btn-default" href="/dianfan">回到主页</a>
		</div>
	</div>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>