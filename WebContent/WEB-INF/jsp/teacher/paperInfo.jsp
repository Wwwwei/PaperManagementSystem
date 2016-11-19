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
<link rel="stylesheet" href="css/paper/paperInfo.css">
<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<script type="text/javascript" src="js/paper/paperInfo.js"></script>
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
	<jsp:include page="header.jsp">
		<jsp:param value="1" name="location" />
	</jsp:include>
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
		<input type="hidden" name="paper_id" value="${paper_id}"></input>
		<dl class="dl-horizontal text-overflow">
			<dt>论文名称</dt>
			<dd>
				${paper.paper_name}
			</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>录入教师姓名</dt>
			<dd>
				${paper.paper_teacher.teacher_name}
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
								test="${paper.paper_issue== 1}">
			        		                 期刊
			        		    </c:if> <c:if
								test="${paper.paper_issue == 0}">
			        		                 会议
			        		    </c:if>
			</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
		<dt>发表状态</dt>
			<dd>
				<c:if
								test="${paper.paper_status== 1}">
			        		                <span class="paper-status-text">已发表</span>
			        		    </c:if> <c:if
								test="${paper.paper_status == 0}">
			        		                 <span class="paper-status-text">未发表</span><a class="update-paper-status">修改状态</a>
			        		    </c:if>
			        		    <input type="hidden" name="paper_status" class="paper_status" value="${paper.paper_status}"></input>
			</dd>
		</dl>
		<c:if test="${paper.paper_status== 1}">
			<dl class="dl-horizontal text-overflow ">
				<dt>检索号</dt>
				<dd>${paper.paper_accNum}</dd>
			</dl>
		</c:if> 
		<c:if test="${paper.paper_status == 0}">
			<dl class="dl-horizontal text-overflow acc-num">
				<dt>检索号</dt>
				<dd><input type="text" name="paper_accNum" class="la-info"></input></dd>
			</dl>
	    </c:if>
		
		<dl class="dl-horizontal text-overflow">
			<dt>
				<c:if
								test="${paper.paper_issue== 1}">
			        		                 期刊
			        		    </c:if> <c:if
								test="${paper.paper_issue == 0}">
			        		                 会议
			        		    </c:if>
				等级
			</dt>
			<dd class="jc-field"><c:if test="${paper.paper_journals_conference_ZKY != null}">
									${paper.paper_journals_conference_ZKY.journals_conference_name}
									<div class="location-area">
									   <input type="hidden" name="update_ZKY" value="0">
									   <label class="la-title">期刊号</label>
									   <input type="text" name="paper_location_issuing_ZKY" class="la-info"></input>
									   <label class="la-title">卷期</label>
									   <input type="text" name="paper_location_volume_ZKY" class="la-info"></input>
									   <label class="la-title">页码</label>
									   <input type="text" name="paper_location_pagination_ZKY" class="la-info"></input>
								    </div>
								</c:if>
								 <c:if test="${paper.paper_location_ZKY != null && paper.paper_status== 1}">
									论文位置 ${paper.paper_location_ZKY}
								</c:if>
								
								</dd>
			<dd class="jc-field">
								<c:if test="${paper.paper_journals_conference_JCR != null}">
									${paper.paper_journals_conference_JCR.journals_conference_name}
									<input type="hidden" name="update_JCR" value="0">
									<div class="location-area">
									   <label class="la-title">期刊号</label>
									   <input type="text" name="paper_location_issuing_JCR" class="la-info"></input>
									   <label class="la-title">卷期</label>
									   <input type="text" name="paper_location_volume_JCR" class="la-info"></input>
									   <label class="la-title">页码</label>
									   <input type="text" name="paper_location_pagination_JCR" class="la-info"></input>
								    </div>
								</c:if>
								<c:if test="${paper.paper_location_JCR != null && paper.paper_status== 1}">
									论文位置 ${paper.paper_location_JCR}
								</c:if>
								</dd>
			<dd class="jc-field">
								<c:if test="${paper.paper_journals_conference_CCF != null}">
									${paper.paper_journals_conference_CCF.journals_conference_name}
									<input type="hidden" name="update_CCF" value="0">
									<div class="location-area">
									   <label class="la-title">期刊号</label>
									   <input type="text" name="paper_location_issuing_CCF" class="la-info"></input>
									   <label class="la-title">卷期</label>
									   <input type="text" name="paper_location_volume_CCF" class="la-info"></input>
									   <label class="la-title">页码</label>
									   <input type="text" name="paper_location_pagination_CCF" class="la-info"></input>
								    </div>
								</c:if>
								<c:if test="${paper.paper_location_CCF != null && paper.paper_status== 1}">
									论文位置 ${paper.paper_location_CCF}
								</c:if>
								</dd>
		</dl>
		<dl class="dl-horizontal text-overflow">
			<dt>收录类型</dt>
			<dd>${paper.paper_includedType}</dd>
		</dl>
		
		<dl class="dl-horizontal text-overflow">
			<dt>发表年月</dt>
			<dd>${paper.paper_time}</dd>
		</dl>
		<%-- <dl class="dl-horizontal text-overflow">
			<dt>论文位置</dt>
			<dd>${paper.paper_location}</dd>
		</dl> --%>
		<dl class="dl-horizontal text-overflow">
			<dt>其他作者</dt>
			<dd>
				<a href="">其他作者</a>
			</dd>
		</dl>
		<c:if test="${paper.paper_status== 0}">
			<a class="confirm-button">确认修改</a>
		</c:if>
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
	<!--论文信息显示结束-->
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