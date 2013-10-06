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
</head>
<body>
	<div align="center">
		<h2
			style="color: white; text-shadow: 1px 1px 2px #7d552d; margin-top: 225px;">
			<strong>dianfan.tk 智能点饭就上点饭网</strong>
		</h2>
		<br />
		<button type="button" class="btn btn-primary"
			style="width: 150px; height: 150px;" data-toggle="modal"
			data-target="#videoModal" >
			<span class="glyphicon glyphicon-user"></span><br />
			<br />开始人脸识别 
		</button>
		<br />
		<br />
		<a type="button" href="login" class="btn btn-default"
			style="width: 150px;"> <span class="glyphicon glyphicon-log-in"></span>
			直接登录
		</a>
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
					<p id="info">对不起，主页菌遇到了点麻烦。<br />请确认摄像头使用正常并允许使用。<br />推荐使用谷歌Chrome浏览器。</p>
					<video id="video" width="320" height="240" autoplay></video>
					<canvas id="canvas" width="320" height="240" style="display: none"></canvas>
					<img id="snapimg" width="320" height="240"></img>
					<script>
						// Put event listeners into place
						window
								.addEventListener(
										"DOMContentLoaded",
										function() {
											// Grab elements, create settings, etc.
											var info = document.querySelector('#info');
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
												navigator.getUserMedia(
														videoObj, function(
																stream) {
															video.src = stream;
															video.play();
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
															});
										}, false);
					</script>
				</div>
				<div class="modal-footer">
					<button id="snap" type="button" class="btn btn-default">拍摄</button>
					<button type="button" class="btn btn-primary">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>