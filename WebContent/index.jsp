<?xml version="1.0" encoding="UTF-8" ?>
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
	<%
		if (username == "") {
	%>
	<div class="container">
		<div class="jumbotron">
			<h1>欢迎来到点饭网</h1>
			<p>点饭网是一个可以“刷脸”点饭的神奇网站。</p>
			<p>
				<a class="btn btn-primary btn-large"
					href="login?type=login&status=normal">登录</a> <a
					class="btn btn-success btn-large" href="login?type=signup&status=normal">立即注册</a>
			</p>
		</div>
	</div>
	<%
		} else {
	%>
	<div class="container">
		<div class="row" align="center" style="margin:20px">
			<div class="col-md-4">
				<button type="button" class="btn btn-primary"
					style="width: 200px; height: 200px;" data-toggle="modal"
					data-target="#videoModal">
					<span class="glyphicon glyphicon-user"></span> <br /> <br />
					人脸识别点餐
				</button>
			</div>
			<div class="col-md-4">
				<button type="button" onclick="window.location.href='order'" class="btn btn-default"
					style="width: 200px; height: 200px;" data-toggle="modal">
					<span class="glyphicon glyphicon-log-in"></span> <br /> <br />直接点餐
				</button>
			</div>
			<div class="col-md-4">
				<button type="button" onclick="window.location.href='FaceTest'" class="btn btn-success"
					style="width: 200px; height: 200px;" data-toggle="modal">通过照片Url识别</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
		aria-labelledby="videoModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="videoModalLabel">拍摄一张照片以登录</h4>
				</div>
				<div class="modal-body" align="center">
					<form action="FaceGetter" method="post" id="face">
						<input type="hidden" name="imgData" id="imgData" />
						<div id=wait class="alert alert-info" style="display: none">请稍候……(可能需要较长时间)</div>
						<button id="snap" type="button" class="btn btn-default">拍照并识别</button>
						<script>
							function doSubmit() {
								$("#imgData").attr("value",
										$("#snapimg").attr("src"));
								var form = document.getElementById("face");
								form.submit();
							}
						</script>
					</form>
					<p id="info">
						对不起，主页菌遇到了点麻烦。 <br /> 请确认摄像头使用正常并允许使用。 <br /> 推荐使用谷歌Chrome浏览器。
					</p>
					<video id="video" width="320" height="240" autoplay></video>
					<canvas id="canvas" width="320" height="240" style="display: none;"></canvas>
					<img id="snapimg" width="320" height="240" style="display: none;"></img>
					<script>
						// Put event listeners into place
						window
								.addEventListener(
										"DOMContentLoaded",
										function() {
											// Grab elements, create settings, etc.
											var info = document
													.querySelector('#info');
											var canvas = document
													.getElementById("canvas"), context = canvas
													.getContext("2d"), video = document
													.getElementById("video"), videoObj = {
												"video" : true
											}, errBack = function(error) {
												console
														.log(
																"Video capture error: ",
																error.code);
											};
											// Put video listeners into place
											if (navigator.getUserMedia) {
												// Standard
												navigator
														.getUserMedia(
																videoObj,
																function(stream) {
																	video.src = stream;
																	video
																			.play();
																	info.innerHTML = '';
																}, errBack);
											} else if (navigator.webkitGetUserMedia) {
												// WebKit-prefixed
												navigator
														.webkitGetUserMedia(
																videoObj,
																function(stream) {
																	video.src = window.webkitURL
																			.createObjectURL(stream);
																	video
																			.play();

																	info.innerHTML = '';
																}, errBack);
											}

											// Trigger photo take
											document
													.getElementById("snap")
													.addEventListener(
															"click",
															function() {
																context
																		.drawImage(
																				video,
																				0,
																				0,
																				320,
																				240);
																var imgData = canvas
																		.toDataURL();
																document
																		.getElementById("snapimg").src = imgData;

																$("#imgData")
																		.attr(
																				"value",
																				$(
																						"#snapimg")
																						.attr(
																								"src"));
																var form = document
																		.getElementById("face");
																$("#snap")
																		.hide();
																$("#wait")
																		.show();
																form.submit();
															});
										}, false);
					</script>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<%
		}
	%>
	<div class="container">
		<div class="panel panel-warning">
			<div class="panel-heading">今日美食推荐</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="./images/3001_131012153636_1.jpg"
								alt="三角烤饼">
							<div class="caption">
								<h3>三角烤饼</h3>
								<p>咸酥口味的三角烤饼，很经典，里面夹点香菜，香香的，一般中午供应，去晚了可就没有了啊！</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="./images/http_www.homeping.tidi.tw_picture_product_big5_frychicken.JPG"
								alt="双排">
							<div class="caption">
								<h3>双排</h3>
								<p>王记美食家的双排，由蒜香鸡排和小鸡腿组成的，尤其是蒜排，外酥里嫩，真的好吃啊，而且他家的很实惠，给的量也算是食堂最多的！</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="./images/1008160361.jpg"
								alt="四川麻辣烫">
							<div class="caption">
								<h3>四川麻辣烫</h3>
								<p>
									四川麻辣烫，爱吃麻辣烫的同学一定不能错过啊，不算地道，但味道还不错，他家还有煮的串儿，来碗麻辣烫再放些煮串，真是享受啊，不过本人爱吃米饭，所以时常在一楼买2两饭，然后上二楼吃！馋了！
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>