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
<script type="text/javascript" src="js/softwareCopyright.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的信息</title>
<style>
.jumbotron {
	text-align: center;
}
</style>
<script type="text/javascript">
$(function() {
	$(".teacher-info-url").click(function() {
		var teacher_info_url = $("#teacher-info-url-value").val();
		if(!teacher_info_url.startWith("http://"));
		teacher_info_url = "http://"+teacher_info_url;
		window.open(teacher_info_url, "_blank" );
	});
	$(".teacher-google-scolar-url").click(function() {
		var teacher_google_scolar_url = $("#teacher-google-scolar-url-value").val();
		if(!teacher_google_scolar_url.startWith("http://"));
		teacher_google_scolar_url = "http://"+teacher_google_scolar_url;
		window.open(teacher_google_scolar_url, "_blank" );
	});
	
	String.prototype.startWith=function(str){ 
		var reg=new RegExp("^"+str); 
		return reg.test(this); 
	} 
})
</script>
</head>
<body>
	<!--导航条开始-->
	<jsp:include page="header.jsp">
		<jsp:param value="1" name="location" />
	</jsp:include>
	<!--导航条结束-->
	<div class="jumbotron">
		<div class="container">
			<h1>Hello, ${sessionScope.teacher.teacher_name }</h1>
			<p>
				<span class="glyphicon glyphicon-user"></span>&nbsp;${sessionScope.teacher.teacher_title }
			</p>
			<div class="row">
				<div class="col-lg-4 col-lg-offset-4">
					<a class="btn btn-primary btn-lg" href="teacher/updatePassword.do"
						role="button">修改密码</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<blockquote>
			<span> 个人信息 </span>
		</blockquote>
		<dl class="dl-horizontal text-overflow">
			<dt>教师工号</dt>
			<dd>${sessionScope.teacher.teacher_no }</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>身份证号</dt>
			<dd>${sessionScope.teacher.teacher_idCard }</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>来校时间</dt>
			<dd>${sessionScope.teacher.teacher_comeTime }</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>毕业院校</dt>
			<dd>${sessionScope.teacher.teacher_graUniversity }</dd>
		</dl>
		<blockquote>
			<span> 联系方式 </span>
		</blockquote>
		<dl class="dl-horizontal text-overflow">
			<dt>email</dt>
			<dd>${sessionScope.teacher.teacher_email }</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>办公电话</dt>
			<dd>${sessionScope.teacher.teacher_officeNumber }</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>手机号</dt>
			<dd>${sessionScope.teacher.teacher_phoneNumber }</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>QQ</dt>
			<dd>${sessionScope.teacher.teacher_qq }</dd>
		</dl>
		<blockquote>
			<span> 个人简介 </span>
		</blockquote>
		<dl class="dl-horizontal text-overflow">
			<dt>教师简介</dt>
			<dd>${sessionScope.teacher.teacher_info}</dd>
		</dl>	
		<dl class="dl-horizontal text-overflow">
			<dt>个人主页</dt>
			<input type="hidden" id="teacher-info-url-value" value="${sessionScope.teacher.teacher_info_url}"/>
			<dd><a href="javascript:void(0)" target="_blank" class="teacher-info-url">${sessionScope.teacher.teacher_info_url}</a></dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>Google Scholar主页</dt>
			<dd><a href="javascript:void(0)" target="_blank" class="teacher-google-scolar-url">${sessionScope.teacher.teacher_google_scolar_url}</a></dd>
			<input type="hidden" id="teacher-google-scolar-url-value" value="${sessionScope.teacher.teacher_google_scolar_url}"/>
		</dl>
	</div>
	<!--我的信息显示结束-->
	<!--footer开始-->
	<jsp:include page="../../../layout/footer.jsp" />
	<!--footer结束-->
</body>
</html>