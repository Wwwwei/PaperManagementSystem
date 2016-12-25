<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        window.onload = function () {
            var obj_lis = document.getElementById("navul").getElementsByTagName(
                    "li");
            var oldobj = document.getElementById("navul").getElementsByClassName(
                    "test");
            for (i = 0; i < obj_lis.length; i++) {
                obj_lis[i].onclick = function () {
                    var test = this.getElementsByTagName("a");
                    oldobj[0].removeAttribute("class");
                    test[0].setAttribute("class", "test");
                }
            }
        }
    </script>
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
                <ul class="nav navbar-nav">
                    <%
                        if (location.equals("1")) {
                    %>
                    <li><a href="../teacher/teacherFunction.do" class="test">我的信息</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="../teacher/teacherFunction.do">我的信息</a></li>
                    <%
                        }
                        if (location.equals("2")) {
                    %>
                    <li><a href="../teacher/findPaper.do?isCommited=true"
                           class="test">已提交的成果</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="../teacher/findPaper.do?isCommited=true">已提交的成果</a></li>
                    <%
                        }
                        if (location.equals("3")) {
                    %>
                    <li><a href="../teacher/findPaper.do?isCommited=false"
                           class="test">未提交的成果</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="../teacher/findPaper.do?isCommited=false">未提交的成果</a></li>
                    <%
                        }
                        if (location.equals("4")) {
                    %>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                            aria-expanded="false" class="test"> 公共查询 <span class="caret"></span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- 							<li><a href="findPaper.jsp">论文</a></li> -->
                            <li><a href="../findAllPaperIndex.do">论文</a></li>
                            <li><a href="#">软著</a></li>
                        </ul>
                    </li>
                    <%
                    } else {
                    %>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                            aria-expanded="false"> 公共查询 <span class="caret"></span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- 							<li><a href="findPaper.jsp">论文</a></li> -->
                            <li><a href="../findAllPaperIndex.do">论文</a></li>
                            <li><a href="#">软著</a></li>
                        </ul>
                    </li>
                    <%
                        }
                        if (location.equals("5")) {
                    %>
                    <li><a href="../paper_proxy/input.do" class="test">录入成果</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="../paper_proxy/input.do">录入成果</a></li>
                    <%
                        }
                        if (location.equals("6")) {
                    %>
                    <li><a href="#" class="test">反馈建议</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="#">反馈建议</a></li>
                    <%
                        }
                    %>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            <span class="glyphicon glyphicon-user"></span> &nbsp;<a
                                href="../teacher/teacherFunction.do" data-toggle="tooltip"
                                data-placement="bottom" title="单击显示教师具体信息">${sessionScope.teacher.teacher_name }</a>
                        </p>

                        <p class="navbar-text">
                            &nbsp;<span class="glyphicon glyphicon-log-out"></span> &nbsp;<a
                                href="../login.jsp" data-toggle="tooltip"
                                data-placement="bottom" title="单击退出">退出</a>
                        </p>
                    </li>
                </ul>
            </div>
        </c:if>
        <c:if test="${sessionScope.admin!=null}">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <p class="navbar-text">
                        <span class="glyphicon glyphicon-home"></span> &nbsp;<a
                            href="admin/backFunction.do" data-toggle="tooltip"
                            data-placement="bottom" title="单击回到管理员界面">功能界面</a>
                    </p>
                    <p class="navbar-text">
                        &nbsp;<span class="glyphicon glyphicon-log-out"></span> &nbsp;<a
                            href="loginAdmin.jsp" data-toggle="tooltip" data-placement="bottom"
                            title="单击退出">退出</a>
                    </p>
                </li>
            </ul>
        </c:if>
    </div>
</nav>
</body>
</html>