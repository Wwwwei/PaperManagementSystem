<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
	function checkInput() {
		var find_string_value = $("#find_string").val();
		var find_type_value = $("#find_type").val();
		if (find_string_value == "") {
			alert("请输入关键词！");
			return false;
		} else if (find_type_value == "author_info") {
			var reg = /^(\w|[\u4E00-\u9FA5])*$/;
			if (find_string_value.match(reg)) {
				return true;
			} else {
				alert("用户名只允许为英文，数字和汉字的混合,\n请检查是否前后有空格或者其他符号");
				return false;
			}
		}
	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
body {
	font-family: "微软雅黑";
	padding-top: 50px;
	font-size: 15px;
}

.jumbotron {
	text-align: center;
	margin-bottom: 0;
	background-color: #337ab7;
	color: #FFFFFF;
}

.btn-primary {
	font-size: 15px;
	width: 100%;
	border: 1px solid #FFFFFF;
	background-color: #337ab7;
	color: #FFFFFF;
}

.btn-primary:hover {
	border: 1px solid #FFFFFF;
	background-color: #FFFFFF;
	color: #337ab7;
}

.input-group-addon {
	border: 1px solid #FFFFFF;
	background-color: #337ab7;
	color: #FFFFFF;
}

select {
	border: 0px;
}

blockquote {
	border-left: 10px solid #337ab7;
	border-bottom: 1px solid #337ab7;
}

blockquote span {
	color: #337ab7;
	font-size: 22px;
}

.navbar a {
	color: white;
}

.navbar a:link {
	color: white;
	text-decoration: none;
}

.navbar a:visited {
	color: white;
	text-decoration: none;
}

.navbar a:hover {
	color: white;
	font-weight: bolder;
	text-decoration: none;
}
</style>
</head>
<body>
	<!--导航条开始-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid" style="margin-left: 5%; margin-right: 5%;">
		<div class="navbar-header ">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bar">
				<span class="sr-only">导航条</span> <span class="icon-bar"
					style="background-color: #FFFFFF;"></span> <span class="icon-bar"
					style="background-color: #FFFFFF;"></span> <span class="icon-bar"
					style="background-color: #FFFFFF;"></span> <span class="icon-bar"
					style="background-color: #FFFFFF;"></span>
			</button>
			<a href="#" class="navbar-brand"><span
				class="glyphicon glyphicon-education"></span></a>
		</div>

		<div class="collapse navbar-collapse" id="bar">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
					aria-expanded="false"> 公共查询 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="findPaper.jsp">论文</a></li>
						<li><a href="#">软著</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><c:if test="${sessionScope.teacher==null}">
						<!--未登录-->
						<a href="login.jsp"> <span class="glyphicon glyphicon-log-in"></span>
							&nbsp;登录
						</a>
					</c:if> <c:if test="${sessionScope.teacher!=null}">
						<!--未登录-->
						<p class="navbar-text">
							<span class="glyphicon glyphicon-user"></span> &nbsp;<a
								href="teacher/backFunction.do">${teacher.teacher_name }</a>
						</p>
						<p class="navbar-text">
							&nbsp;<a href="login.jsp"><span
								class="glyphicon glyphicon-log-out"></span> &nbsp;退出</a>
						</p>
					</c:if></li>
			</ul>
		</div>
	</div>
	</nav>
	<!--导航条结束-->
	<!--标题查询开始-->
	<div class="jumbotron">
		<div class="container">
			<h1>论文查询</h1>
			<form id="findPaper" action="findPaper.do" method="post"
				onsubmit="return checkInput();">
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
					<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
						<div class="input-group">
							<span class="input-group-addon">关键词</span> <input type="text"
								name="find_string" id="find_string"
								value="${sessionScope.find_string}" class="form-control" />
						</div>
					</div>
					<div class="col-lg-12">&nbsp;</div>
					<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
						<div class="input-group">
							<span class="input-group-addon">选&nbsp;&nbsp;&nbsp;项</span> <select
								id="find_type" name="find_type" class="form-control">
								<option value="author_info" selected="selected">作者信息</option>
								<option value="paper_info">论文信息</option>
							</select>
						</div>
					</div>
					<div class="col-lg-12">&nbsp;</div>
					<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
						<div class="col-lg-6" style="padding-bottom: 20px;">
							<button type="submit" class="btn btn-primary btn-lg">查询</button>
						</div>
						<div class="col-lg-6" style="padding-bottom: 20px;">
							<a href="findAllPaperIndex.do"><button type="button"
									class="btn btn-primary btn-lg">查询全部论文</button></a>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
	<!--标题查询结束-->

	<!--footer开始-->
	<footer class="footer navbar-inverse navbar-bottom ">
	<div class="container text-center"
		style="font-size: 18px; color: #999999;">
		<p>&nbsp;</p>
		<p>
			<strong>技术支持 By</strong>
		</p>
		<p>浙江工业大学计算机学院</p>
		<p style="font-size: 15px;">我们将做的更好！</p>
		<p>&nbsp;</p>
		<p style="font-size: 13px;">(c) Copyright 2016 ZJUT 计算机学院. All
			Rights Reserved.</p>
	</div>
	</footer>
	<!--footer结束-->
</body>
</html>