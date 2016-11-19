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
	// 	window.onload = function() {
	// 		var find_type_value = "${find_type}";
	// 		$("#find_type").val(find_type_value);

	// 		var journals_conference_degree_value = "${journals_conference_degree}";
	// 		$("#journals_conference_degree").val(journals_conference_degree_value);

	// 		var paper_includedType_value = "${paper_includedType}";
	// 		$("#paper_includedType").val(paper_includedType_value);

	// 		var paper_time_value = "${paper_time}";
	// 		$("#paper_time").val(paper_time_value);

	// 		var journals_conference_flag_value = "${journals_conference_flag}";
	// 		$("#journals_conference_flag").val(journals_conference_flag_value);

	// 		var paper_time_order_value = "${paper_time_order}";
	// 		$("#paper_time_order").val(paper_time_order_value);

	// 		var teacher_id_value = "${teacher_id}";
	// 		$("#teacher_id").val(teacher_id_value);
	// 	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
.jumbotron {
	text-align: center;
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
				<li class="dropdown"><a class="dropdown-toggle test"
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
						<!--登录-->
						<p class="navbar-text">
							<span class="glyphicon glyphicon-user"></span> &nbsp;<a
								href="teacher/backFunction.do" data-toggle="tooltip"
								data-placement="bottom" title="单击显示教师具体信息">${teacher.teacher_name }</a>
						</p>
						<p class="navbar-text">
							&nbsp;<span class="glyphicon glyphicon-log-out"></span> &nbsp;<a
								href="login.jsp">退出</a>
						</p>
					</c:if></li>
			</ul>
		</div>
	</div>
	</nav>
	<!--导航条结束-->
	<div class="jumbotron">
		<div class="container">
			<h1 style="font-size:45px;">论文详细信息</h1>
		</div>
	</div>
	<div class="container">
		<blockquote>
			<span>论文详细信息 </span>
		</blockquote>
		<dl class="dl-horizontal text-overflow">
			<dt>论文名称</dt>
			<dd>
				<a href="findPaperById?paper_id='${paper.paper_id}'">${paper.paper_name}</a>
			</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>录入教师姓名</dt>
			<dd>
				<a
					href="findTeacherInfo.do?teacher_id='${paper.paper_teacher.teacher_id}'">${paper.paper_teacher.teacher_name}</a>
			</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>录入教师排名</dt>
			<dd>第${paper.paper_rank}名，共${paper.paper_authorNum}名</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>论文类型</dt>
			<dd>
				<c:if
					test="${paper.paper_journals_Conference.journals_conference_flag == 0}">
			        		                 期刊
			        		    </c:if>
				<c:if
					test="${paper.paper_journals_Conference.journals_conference_flag == 1}">
			        		                 会议
			        		    </c:if>
			</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>
				<c:if
					test="${paper.paper_journals_Conference.journals_conference_flag == 0}">
					期刊
				</c:if>
				<c:if
					test="${paper.paper_journals_Conference.journals_conference_flag == 1}">
					会议
				</c:if>
				名称
			</dt>
			<dd>${paper.paper_journals_Conference.journals_conference_name}</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>
				<c:if
					test="${paper.paper_journals_Conference.journals_conference_flag == 0}">
			        		                 期刊
			        		    </c:if>
				<c:if
					test="${paper.paper_journals_Conference.journals_conference_flag == 1}">
			        		                 会议
			        		    </c:if>
				类型
			</dt>
			<dd>${paper.paper_journals_Conference.journals_conference_degree}</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>收录类型</dt>
			<dd>${paper.paper_includedType}</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>检索号</dt>
			<dd>${paper.paper_accNum}</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>发表年月</dt>
			<dd>${paper.paper_time}</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>论文位置</dt>
			<dd>${paper.paper_location}</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>其他作者</dt>
			<dd>
				<a href="">其他作者</a>
			</dd>
		</dl>
		<blockquote>
			<span>下载 </span>
		</blockquote>
		<div class="row">
<!-- 			<div class="col-md-6" style="padding-bottom:3%"> -->
<%-- 				<a href="${paper.paper_url}" class="btn btn-primary" style="font-size: 15px;">预览</a> --%>
<!-- 			</div> -->
			<div class="col-md-12" style="padding-bottom:3%">
				<a href="${paper.paper_url}" class="btn btn-primary" style="font-size: 15px;">下载</a>
			</div>
		</div>
	</div>
	<!--我的信息显示结束-->
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