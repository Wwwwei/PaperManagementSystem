<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>论文成果录入清单</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/paper/input/paper.input.show.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pms.css" />
</head>
<script type="text/javascript">
	function clicke() {
		var tex = document.getElementById("sele");
		if (tex.value == '打开作者表')
			tex.value = '收起作者表';
		else if (tex.value == '收起作者表')
			tex.value = '打开作者表';
	}
	function clicka() {
		var tex = document.getElementById("sala");
		if (tex.value == '打开期刊列表')
			tex.value = '收起期刊列表';
		else if (tex.value == '收起期刊列表')
			tex.value = '打开期刊列表';
		if (tex.value == '打开会议列表')
			tex.value = '收起会议列表';
		else if (tex.value == '收起会议列表')
			tex.value = '打开会议列表';
	}
</script>
<style>
.jumbotron {
	text-align: center;
	margin-top: 0;
	background-color: #337ab7;
	color: #FFFFFF;
}
</style>
<body>
	<!--导航条开始-->
	<jsp:include page="header.jsp">
		<jsp:param value="5" name="location" />
	</jsp:include>
	<!--导航条结束-->
	<div class="jumbotron">
		<div class="container">
			<h1 style="font-size:45px;">信息确认</h1>
		</div>
	</div>
	<div class="container">
		<blockquote>
			<span> 论文信息 </span>
		</blockquote>


		<span id="showPaperProxyList"></span> <input type="hidden"
			value="${requestScope.paperproxy_id}" id="paperproxy_id" />
			<input type="hidden"
			value="${requestScope.commited_paper_id}" id="commited_paper_id" />
				<c:if test="${sessionScope.teacher!=null}">
				<input type="hidden"
			      value="1" id="user_flag" />
				</c:if>
				<c:if test="${sessionScope.admin!=null}">
				<input type="hidden"
			      value="0" id="user_flag" />
				</c:if>
			<input type="hidden"
			value="${sessionScope.currentPage}" id="currentPage" />
			<input type="hidden"
			value="${sessionScope.column}" id="column" />
			<input type="hidden"
			value="${sessionScope.order}" id="order" />
			<span id="showAuthorProxyList"></span>
		<div class="row">
			<div class="col-md-6">
				<button class="btn btn-primary btn-lg" id="paperproxy_modify">继续修改</button>
			</div>
			<div class="col-md-6">
				<button class="btn btn-warning btn-lg" id="paperproxy_confirm"
					data-toggle="modal" data-target="#myModal">确认提交</button>
			</div>
			<div class="col-md-12">&nbsp;</div>
		</div>
	</div>
	<!--footer开始-->
	<jsp:include page="../../../layout/footer.jsp" />
	<!--footer结束-->
</body>
</html>