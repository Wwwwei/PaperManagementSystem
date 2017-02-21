<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/pms.css" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
body{
background:#337ab7;
padding-top: 100px;
}
</style>
</head>
<body>
	<div class="jumbotron" style="padding-bottom:20px;min-height:450px">
		<div class="container">
			<h1>Hello, 管理员</h1>
			<p>
				请选择你的操作
			</p>
			<div class="row">
				<div class="col-lg-6">
					<a class="btn btn-primary btn-lg" href="findAllPaperIndex.do"
						role="button">论文操作</a>
				</div>
				<div class="col-lg-6">
					<a class="btn btn-primary btn-lg" href="admin/updateTeacherInfo.do"
						role="button">教师信息操作</a>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../../../layout/footer.jsp" />
</body>
</html>