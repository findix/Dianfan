<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>FaceTest</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link href="css/dianfan.css" rel="stylesheet" media="screen" />
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />

<link rel="icon" href="httP://www.find1x.com/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="http://www.find1x.com/favicon.ico"
	type="image/x-icon" />
</head>
<body>
	<div align="center">
		<div class="jumbotron" align="left"
			style="margin-top: 225px; max-width: 800px">
			<form action="FaceGetter" method="post">
				<div class="input-group">
					<input id="url" name="url" type="text" class="form-control"
						placeholder="请输入图片url地址" autofocus /> <span
						class="input-group-btn"> <input
						class="btn btn-primary btn-block" type="submit"
						value="&nbsp开始识别&nbsp" />
					</span>
				</div>
			</form>
		</div>
	</div>

	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>