<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	发生错误，请返回重新操作！
	<%
	String refererUrl = request.getHeader("Referer");
	refererUrl = refererUrl.substring(basePath.length());
%>

	<%-- <%=request.getHeader("Referer")%> --%>
	<%-- <%=refererUrl%> --%>
	<%-- <%=path%> --%>
	<%-- <%=basePath%> --%>


	<a href="findAllPaperIndex.do">返回</a>
</body>
</html>