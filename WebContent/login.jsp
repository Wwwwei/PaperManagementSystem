<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
</script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/pms.css"/>
    <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/common/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/softwareCopyright.js"></script>
    <script type="text/ecmascript" src="js/secure/sha1.js"></script>
    <script type="text/javascript" src="js/secure/login.js"></script>
    <title>登录</title>
    <style>
        body {
            padding-top: 10%;
        }
    </style>
</head>
<body onkeydown="keyLogin();">
<!--导航条开始-->
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

        <div class="collapse navbar-collapse" id="bar">
            <ul class="nav navbar-nav" id="navul">
                <li class="active dropdown"><a class="dropdown-toggle"
                                               data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                               aria-expanded="false"> 公共查询 <span class="caret"></span>
                </a>
                    <ul class="dropdown-menu">
                        <!--<li><a href="findPaper.jsp">论文</a></li> -->
                        <li><a href="findAllPaperIndex.do">论文</a></li>

                        <li><a href="" onclick="return findSoftwareCopyright();">软著</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--导航条结束-->
<!-- 登录主体开始 -->
<div class="container" style="min-height:300px">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4" style="padding-bottom: 8%;">
            <!-- 				<form action="teacher/login.do" method="post" -->
            <!-- 					class="form-horizontal" onsubmit="return checkInput();"> -->
            <h2 style="padding-bottom:5%">欢迎登录</h2>

            <br/>

            <label for="project_date" class="col-sm-2 control-label"
                   style="vertical-align: middle;">工号</label>
            <div class="col-sm-10" style="padding-bottom:7%">
                <input type="text" class="form-control" id="teacher_no"
                       name="teacher_no" placeholder="UserName"/>
            </div>

            <br/>

            <label for="project_date" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10" style="padding-bottom:7%">
                <input type="password" class="form-control" id="teacher_password"
                       name="teacher_password" placeholder="Password" oncopy="return false;" oncut="return false;"/>
            </div>

            <br/>
            <%-- 					<c:if test="${!empty request.loginInfo}"> --%>
            <!-- 						<div class="alert alert-danger alert-dismissable"> -->
            <!-- 							<button type="button" class="close" data-dismiss="alert" -->
            <!-- 								aria-hidden="true">&times;</button> -->
            <%-- 							${request.loginInfo} --%>
            <!-- 						</div> -->
            <%-- 					</c:if> --%>
            <!-- 					<button type="submit" class="btn btn-block btn-primary"> -->
            <!-- 						<span class="glyphicon glyphicon-log-in"></span>&nbsp;登录 -->
            <!-- 					</button> -->
            <button id="confirmLogin" class="btn btn-block btn-primary">
                <span class="glyphicon glyphicon-log-in"></span>&nbsp;登录
            </button>
            <br/>
            <!-- 				</form> -->
        </div>
    </div>
</div>
<!-- 登录主体结束 -->
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
<!--footer1结束-->
</body>
</html>