<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
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
		<div class="container">
			<div class="panel panel-success">
				<div class="panel-heading">菜单</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<td>菜名</td>
									<td>类型</td>
									<td>辣度</td>
								</tr>
							</thead>
							<tbody>
								<%
									for (DBObject dish : QueryUtil.getMenu()) {
								%>

								<tr>
									<td><%=dish.get("name")%></td>
									<td><%=dish.get("type")%></td>
									<td><%=dish.get("spicy")%></td>
									<td><input type="button" class="btn btn-warning"
										id=<%=dish.get("name")%> value="修改" /> <input type="button"
										class="btn btn-danger" id=<%=dish.get("name")%> value="删除"
										onClick='deleteDish("<%=dish.get("name")%>")' /></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
						<script>
							function deleteDish(name){
								window.location.href=('DeleteDish?name='+<%=URLEncoder.encode("name")%>);
							}
						</script>
						<input type="button" class="btn btn-normal" id="add" value="新增菜品"
							data-toggle="modal" data-target="#addModal" />

						<!-- Modal -->
						<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
							aria-labelledby="addModal" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="addModalLabel">新增菜品</h4>
									</div>
									<div class="modal-body">
										<form action="AddDish" method="post">
											<div class="form-group">
												<label for="name">菜名</label> <input type="text"
													class="form-control" name="name" id="name"
													placeholder="宫保鸡丁……">
											</div>
											<div class="form-group">
												<label for="series">菜系</label> <input type="text"
													class="form-control" name="series" id="series"
													placeholder="川菜……">
											</div>
											<div class="form-group">
												<label for="type">类型</label> <input type="text"
													class="form-control" name="type" id="type"
													placeholder="正餐……">
											</div>
											<div class="form-group">
												<label for="spicy">辣度</label> <input type="text"
													class="form-control" name="spicy" id="spicy"
													placeholder="微辣……">
											</div>
											<button type="submit" class="btn btn-default">确定</button>
										</form>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>