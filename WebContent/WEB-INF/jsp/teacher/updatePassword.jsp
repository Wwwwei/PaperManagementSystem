<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/pms.css" />
<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<script>
// 	function checkPassword() {
// 		var password = "${teacher.teacher_password}";
// 		var oldPassword = $("#oldPassword").val();
// 		var newPassword = $("#newPassword").val();
// 		var renewPassword = $("#renewPassword").val();
// 		if (password != oldPassword) {
// 			alert("旧密码输入不正确，请从新输入！");
// 			return false;
// 		}
// 		if (newPassword == oldPassword) {
// 			alert("新密码跟旧密码不能相同！");
// 			return false;
// 		}
// 		if (newPassword == "") {
// 			alert("请输入新密码！");
// 			return false;
// 		}
// 		var reg = /^[0-9a-zA-Z]+$/;
// 		if (!reg.test(newPassword)) {
// 			alert("新密码只能由数字或字母组成！");
// 			return false;
// 		}

// 		if (newPassword != renewPassword) {
// 			alert("两次新密码输入不一致，请从新输入！");
// 			return false;
// 		}

// 	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改密码</title>
<style>
.jumbotron {
	text-align: center;
	margin-bottom: 0;
	background-color: #337ab7;
	color: #FFFFFF;
}
</style>
</head>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/softwareCopyright.js"></script>
<script type="text/ecmascript" src="js/secure/sha1.js"></script>
<script type="text/javascript" src="js/secure/updatePassword.js"></script>
<body>
	<!--导航条开始-->
	<jsp:include page="header.jsp">
		<jsp:param value="1" name="location" />
	</jsp:include>
	<!--导航条结束-->
	<div class="jumbotron">
		<h1 style="font-size:45px;">修改密码</h1>
<!-- 		<form action="teacher/updatePassword.do" method="post" -->
<!-- 			onsubmit="return checkPassword();"> -->
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
				<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
					<div class="input-group">
						<span class="input-group-addon">输入旧密码</span> <input type="password"
							name="oldPassword" id="oldPassword" class="form-control" />
					</div>
				</div>
				<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
					<div class="input-group">
						<span class="input-group-addon">输入新密码</span> <input type="password"
							name="newPassword" id="newPassword" class="form-control" />
					</div>
				</div>
				<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
					<div class="input-group">
						<span class="input-group-addon">确认新密码</span> <input
							type="password" name="renewPassword" id="renewPassword"
							class="form-control" />
					</div>
				</div>
				<div class="col-lg-12">&nbsp;</div>
				<div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 20px;">
<!-- 					<button  class="btn btn-primary btn-lg">确定修改</button> -->
					<button id="confirmUpdate" class="btn btn-primary btn-lg">确定修改</button>
				</div>

			</div>
<!-- 		</form> -->
	</div>
	<!--我的信息显示结束-->
	<!--footer开始-->
	<jsp:include page="../../../layout/footer.jsp" />
	<!--footer结束-->
</body>
</html>