<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%-- <%response.setHeader("Cache-Control","no-store");%> --%>
<%
	response.addHeader("Cache-Control", "no-store, must-revalidate");
	response.addHeader("Expires", "Thu, 01 Jan 1970 00:00:01 GMT");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/pms.css" />
<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<style>
.jumbotron {
	margin-top: 0px;
	margin-bottom: 0px;
	padding-top: 10%;
	padding-bottom: 10%;
	text-align: center;
}
</style>
<body>
	<!--导航条开始-->
	<jsp:include page="header.jsp">
		<jsp:param value="4" name="location" />
	</jsp:include>
	<!--导航条结束-->
	<div class="jumbotron">
		<div class="container">
			<h1>${teacher.teacher_name}</h1>
			<p>
				<span class="glyphicon glyphicon-user"></span>&nbsp;${teacher.teacher_title}
			</p>
			<p>
				<span class="glyphicon glyphicon-envelope"></span>&nbsp;${teacher.teacher_email}
			</p>
		</div>
	</div>
	<!--footer开始-->
	<jsp:include page="../../../layout/footer.jsp" />
	<!--footer结束-->
</body>
</html>