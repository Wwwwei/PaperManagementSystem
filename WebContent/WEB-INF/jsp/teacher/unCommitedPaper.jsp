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
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/pms.css" />
<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<script>
	window.onload = function() {
		var DELETE_PAPERPROXY_INFO_VALUE = "${DELETE_PAPERPROXY_INFO}";
		if (DELETE_PAPERPROXY_INFO_VALUE != "")
			alert(DELETE_PAPERPROXY_INFO_VALUE);

	}
</script>
<style>
.jumbotron {
	text-align: center;
	margin-bottom: 0;
	background-color: #337ab7;
	color: #FFFFFF;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>未提交的成果</title>
</head>
<body>
	<!--导航条开始-->
	<jsp:include page="header.jsp">
		<jsp:param value="3" name="location" />
	</jsp:include>
	<!--导航条结束-->
	<div class="jumbotron">
		<h1 style="font-size:45px;">未提交的成果</h1>
	</div>
	<!--查询结果显示开始-->
	<div class="container">
		<div class="table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th width="50px">编号</th>
						<th width="100px">论文名称</th>
						<th width="80px">录入作者</th>
						<th width="50px">排名</th>
						<th width="80px">论文类型</th>
						<th width="200px">会议/期刊等级</th>
						<th width="80px">收录类型</th>
						<th width="80px">影响因子</th>
						<th width="100px">发表年月</th>
						<th width="50px">总引</th>
						<th width="50px">他引</th>
						<th>GS引用</th>
						<th width="80px">修改</th>
						<th width="50px">删除</th>
					</tr>
				</thead>
				<c:forEach var="paper" begin="0" end="10" step="1"
					items="${requestScope.papers}" varStatus="status">
					<tr>
						<td>${status.count+(page.currentPage-1)*page.pageNumber}</td>
						<td class="text-overflow">${paper.paper_name}</td>
						<td>${sessionScope.teacher.teacher_name }</td>
						<td>${paper.paper_rank}/${paper.paper_authorNum}</td>
						<td>
							<!-- 会议或者期刊 判定一下--> <c:if
								test="${paper.paper_issue== 1}">
			        		                 期刊
			        		    </c:if> <c:if
								test="${paper.paper_issue == 0}">
			        		                 会议
			        		    </c:if>
						</td>
						<td><c:if test="${paper.paper_journals_conference_ZKY != null}">
									${paper.paper_journals_conference_ZKY.journals_conference_name}
								</c:if>,
								<c:if test="${paper.paper_journals_conference_JCR != null}">
									${paper.paper_journals_conference_JCR.journals_conference_name}
								</c:if>,
								<c:if test="${paper.paper_journals_conference_CCF != null}">
									${paper.paper_journals_conference_CCF.journals_conference_name}
								</c:if></td>
						<td>${paper.paper_includedType}</td>
						<td>${paper.paper_if}</td>
						<td>${paper.paper_time}</td>
						<td>${paper.paper_citations}</td>
						<td>${paper.paper_citations_others}</td>
						<td>${paper.paper_citations_google}</td>
						<td><a
							href="paper_proxy/modify.do?paperproxy_id=${paper.paper_id }">继续修改</a><br></td>
						<td><a
							href="paper_proxy/deletePaperproxy.do?paperproxy_id=${paper.paper_id }">删除</a><br></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!--查询结果显示结束-->
		<!--分页开始-->

		<ul class="pager">
			<p class="text-primary">第 ${page.currentPage} 页，共
				${page.totalPage} 页</p>
			<li><a
				href="teacher/findPaper.do?isCommited=${sessionScope.isCommited }&currentPage=1"><span
					class="glyphicon glyphicon-step-backward"></span>首页</a></li>
			<c:choose>
				<c:when test="${page.currentPage - 1 > 0}">
					<li><a
						href="teacher/findPaper.do?isCommited=${sessionScope.isCommited }&currentPage=${page.currentPage - 1}"><span
							class="glyphicon glyphicon-triangle-left"></span>上一页</a></li>
				</c:when>
				<c:when test="${page.currentPage - 1 <= 0}">
					<li><a
						href="teacher/findPaper.do?isCommited=${sessionScope.isCommited }&currentPage=1"><span
							class="glyphicon glyphicon-triangle-left"></span>上一页</a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.currentPage + 1 < page.totalPage}">
					<li><a
						href="teacher/findPaper.do?isCommited=${sessionScope.isCommited }&currentPage=${page.currentPage + 1}">下一页<span
							class="glyphicon glyphicon-triangle-right"></span></a></li>
				</c:when>
				<c:when test="${page.currentPage + 1 >= page.totalPage}">
					<li><a
						href="teacher/findPaper.do?isCommited=${sessionScope.isCommited }&currentPage=${page.totalPage}">下一页
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
				</c:when>
			</c:choose>
			<li><a
				href="teacher/findPaper.do?isCommited=${sessionScope.isCommited }&currentPage=${page.totalPage}">尾页<span
					class="glyphicon glyphicon-step-forward"></span></a></li>
		</ul>
		<!--分页结束-->
	</div>
	<!--footer开始-->
	<jsp:include page="../../../layout/footer.jsp" />
	<!--footer结束-->
</body>
</html>