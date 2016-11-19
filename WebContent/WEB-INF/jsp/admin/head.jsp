<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
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
<!-- 				<li class="dropdown"><a class="dropdown-toggle" -->
<!-- 					data-toggle="dropdown" href="#" role="button" aria-haspopup="true" -->
<!-- 					aria-expanded="false" class="test"> 公共查询 <span class="caret"></span> -->
<!-- 				</a> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 												<li><a href="findPaper.jsp">论文</a></li> -->
<!-- 						<li><a href="findAllPaperIndex.do">论文</a></li> -->
<!-- 						<li><a href="" onclick="return findSoftwareCopyright();">软著</a></li> -->
<!-- 					</ul></li> -->
			</ul>
			<c:if test="${sessionScope.teacher==null}&&${sessionScope.admin==null}">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<p class="navbar-text">
							<span class="glyphicon glyphicon-log-in"></span>&nbsp;<a
						href="loginAdmin.jsp">登录 </a>
						</p>
					 </li>
				</ul>
			</c:if>
				<c:if test="${sessionScope.admin!=null}">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<p class="navbar-text">
							<span class="glyphicon glyphicon-home"></span> &nbsp;<a
								href="admin/adminFunction.do">功能界面</a>
						</p>
						<p class="navbar-text">
							&nbsp;<span class="glyphicon glyphicon-log-out"></span> &nbsp;<a
								href="loginAdmin.jsp">退出</a>
						</p>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
	</nav>
</body>
</html>