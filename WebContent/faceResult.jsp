<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.find1x.dianfan.action.FaceGetterAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="org.json.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>人脸测试</title>
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
	<div align="center" style="padding:100px;">
		<div id="jumbotron" class="jumbotron" align="left"
			style="max-width: 960px;">
			<table>
				<tr>
					<td>
						<div>
							<img src="${url}" style="max-width: 320px" /> <img
								src="${imgData}" style="max-width: 320px" />
						</div>
					</td>
					<td>
						<div style="position: relative; left: 30px;">${resultString}</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>