<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>
<body>
<%
    String location = request.getParameter("location");
%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid" style="margin-left: 5%; margin-right: 5%;">
        <div class="navbar-header ">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bar">
                <span class="sr-only">导航条</span> <span class="icon-bar"
                                                       style="background-color: #FFFFFF;"></span> <span class="icon-bar"
                                                                                                        style="background-color: #FFFFFF;"></span> <span
                    class="icon-bar"
                    style="background-color: #FFFFFF;"></span> <span class="icon-bar"
                                                                     style="background-color: #FFFFFF;"></span>
            </button>
            <a class="navbar-brand"><span
                    class="glyphicon glyphicon-education"></span></a>
        </div>
        <c:if test="${sessionScope.teacher!=null}">
            <div class="collapse navbar-collapse" id="bar">
                <ul class="nav navbar-nav" id="navul">
                    <%
                        if (location.equals("1")) {
                    %>
                    <li><a href="teacher/teacherFunction.do" class="test">我的信息</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="teacher/teacherFunction.do">我的信息</a></li>
                    <%
                        }
                        if (location.equals("2")) {
                    %>
                    <li><a href="teacher/findPaper.do?isCommited=true"
                           class="test">已提交的成果</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="teacher/findPaper.do?isCommited=true">已提交的成果</a></li>
                    <%
                        }
                        if (location.equals("3")) {
                    %>
                    <li><a href="teacher/findPaper.do?isCommited=false"
                           class="test">未提交的成果</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="teacher/findPaper.do?isCommited=false">未提交的成果</a></li>
                    <%
                        }
                        if (location.equals("4")) {
                    %>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                            aria-expanded="false" class="test">公共查询 <span class="caret"></span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- 							<li><a href="findPaper.jsp">论文</a></li> -->
                            <li><a href="findAllPaperIndex.do">论文</a></li>
                            <li><a href="" onclick="return findSoftwareCopyright();">软著</a></li>
                        </ul>
                    </li>
                    <%
                    } else {
                    %>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                            aria-expanded="false">公共查询 <span class="caret"></span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- 							<li><a href="findPaper.jsp">论文</a></li> -->
                            <li><a href="findAllPaperIndex.do">论文</a></li>
                            <li><a href="" onclick="return findSoftwareCopyright();">软著</a></li>
                        </ul>
                    </li>
                    <%
                        }
                        if (location.equals("5")) {
                    %>
                    <li><a href="paper_proxy/input.do" class="test">录入成果</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="paper_proxy/input.do">录入成果</a></li>
                    <%
                        }
                        if (location.equals("6")) {
                    %>
                    <li><a href="" onclick="return findSoftwareCopyright();">反馈建议</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="" onclick="return findSoftwareCopyright();">反馈建议</a></li>
                    <%
                        }
                    %>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            <span class="glyphicon glyphicon-user"></span> &nbsp;<a
                                href="teacher/teacherFunction.do" data-toggle="tooltip"
                                data-placement="bottom" title="单击显示教师具体信息">${sessionScope.teacher.teacher_name }</a>
                        </p>

                        <p class="navbar-text">
                            &nbsp;<span class="glyphicon glyphicon-log-out"></span> &nbsp;<a
                                href="teacher/quit.do" data-toggle="tooltip" data-placement="bottom"
                                title="单击退出">退出</a>
                        </p>
                    </li>
                </ul>
            </div>
        </c:if>
    </div>
</nav>
</body>
</html>