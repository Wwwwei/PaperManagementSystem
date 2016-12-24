<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/pms.css"/>
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
<%-- 	<jsp:include page="paperproxy/header.jsp"> --%>
<%-- 		<jsp:param value="1" name="location" /> --%>
<%-- 	</jsp:include> --%>
<!--导航条结束-->
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
            <c:if test="sessionScope.admin==null}">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                            aria-expanded="false" class="test"> 公共查询 <span class="caret"></span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- 						<li><a href="findPaper.jsp">论文</a></li> -->
                            <li><a href="findAllPaperIndex.do">论文</a></li>
                            <li><a href="" onclick="return findSoftwareCopyright();">软著</a></li>
                        </ul>
                    </li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.teacher==null&&sessionScope.admin==null}">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            <span class="glyphicon glyphicon-log-in"></span>&nbsp;<a
                                href="login.jsp">登录 </a>
                        </p>
                    </li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.teacher!=null}">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            <span class="glyphicon glyphicon-user"></span> &nbsp;<a
                                href="teacher/teacherFunction.do" data-toggle="tooltip"
                                data-placement="bottom" title="单击显示教师具体信息">${teacher.teacher_name }</a>
                        </p>
                        <p class="navbar-text">
                            &nbsp;<span class="glyphicon glyphicon-log-out"></span> &nbsp;<a
                                href="login.jsp" data-toggle="tooltip" data-placement="bottom"
                                title="单击退出">退出</a>
                        </p>
                    </li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.admin!=null}">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            <span class="glyphicon glyphicon-home"></span> &nbsp;<a
                                href="admin/adminFunction.do" data-toggle="tooltip"
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
    <input Type="hidden" name="paper_id" value="${paper.paper_id}"></input>
    <input Type="hidden" name="teacher_no" value="${paper.paper_teacher.teacher_no}"></input>
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
        <input Type="hidden" name="paper_issue" value="${paper.paper_issue}"></input>
        <dd>
            <c:if

                    test="${paper.paper_issue== 0}">
                期刊
            </c:if> <c:if
                test="${paper.paper_issue == 1}">
            会议
        </c:if>
        </dd>
    </dl>
    <c:if test="${paper.paper_issue== 0&&paper.paper_publishType==1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>期刊性质</dt>
            <dd>国内期刊</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_issue== 0&&paper.paper_publishType==2}">
        <dl class="dl-horizontal text-overflow ">
            <dt>期刊性质</dt>
            <dd>国外期刊</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_issue== 1&&paper.paper_publishType==3}">
        <dl class="dl-horizontal text-overflow ">
            <dt>会议性质</dt>
            <dd>国际会议</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_issue== 0&&paper.paper_journals_conference_isZjut100==0}">
        <dl class="dl-horizontal text-overflow ">
            <dt>是否zjut100期刊论文</dt>
            <dd>否</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_issue== 0&&paper.paper_journals_conference_isZjut100==1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>是否zjut100期刊论文</dt>
            <dd>是</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 0&&paper.paper_issue== 0}">
        <dl class="dl-horizontal text-overflow ">
            <dt>期刊号</dt>
            <dd>${paper_number}</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 0&&paper.paper_issue== 1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>会议地点</dt>
            <dd>${meeting_place}</dd>
        </dl>
    </c:if>
    <dl class="dl-horizontal text-overflow">
        <dt>发表状态</dt>
        <dd>
            <c:if
                    test="${paper.paper_status== 1}">
                <span class="paper-status-text">已发表</span>
            </c:if>
            <c:if
                    test="${paper.paper_status == 0}">
                <span class="paper-status-text">未发表</span>
                <!-- <a class="update-paper-status">修改状态</a> -->
            </c:if>
            <input type="hidden" name="paper_status" class="paper_status" value="${paper.paper_status}"></input>
        </dd>
    </dl>
    <c:if test="${paper.paper_status == 0}">
        <dl class="dl-horizontal text-overflow acc-num">
            <dt>检索号</dt>
            <dd><input type="text" name="paper_accNum" class="la-info"></input></dd>
        </dl>
    </c:if>

    <c:if test="${paper.paper_status== 1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>检索号</dt>
            <dd>${paper.paper_accNum}</dd>
        </dl>
    </c:if>

    <c:if test="${paper.paper_status == 0}">
        <dl class="dl-horizontal text-overflow acc-num">
            <dt>发表年月</dt>
            <div class="paper_time">
                <dd><input type="date" id="time" name="paper_time" width="50px" value="${paper.paper_time}"
                           class="form-control valid"></dd>
            </div>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status== 1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>发表年月</dt>
            <dd>${paper.paper_time}</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 1&&paper.paper_issue== 0}">
        <dl class="dl-horizontal text-overflow ">
            <dt>期刊号</dt>
            <dd>${paper_number}</dd>
            <dt>卷期</dt>
            <dd>${paper_location_volume}</dd>
            <dt>页码</dt>
            <dd>${paper_location_pagination}</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 1&&paper.paper_issue== 1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>会议页码</dt>
            <dd>${meeting_page}</dd>
            <dt>会议地点</dt>
            <dd>${meeting_place}</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 0&&paper.paper_issue== 0}">
        <dl class="dl-horizontal text-overflow acc-num">
            <div class="location-area">
                <input type="hidden" name="update_location" value="0">
                <!-- 					   <label class="la-title">期刊号</label> -->
                <!-- 					   <input type="text" name="paper_location_issuing" class="la-info"></input> -->
                <label class="la-title">卷期</label>
                <input type="text" name="paper_location_volume" class="la-info"></input>
                <label class="la-title">页码</label>
                <input type="text" name="paper_location_pagination" class="la-info"></input>
            </div>
        </dl>
    </c:if>

    <c:if test="${paper.paper_status == 0&&paper.paper_issue== 1}">
        <dl class="dl-horizontal text-overflow acc-num">
            <div class="location-area">
                <input type="hidden" name="update_location" value="0">
                <!-- 		                <label class="la-title">会议地点</label> -->
                <!-- 					   <input type="text" name="meeting_place" class="la-info"></input> -->
                <label class="la-title">会议页码</label>
                <input type="text" name="meeting_page" class="la-info"></input>
            </div>
        </dl>
    </c:if>

    <dl class="dl-horizontal text-overflow">
        <dt>
            <c:if
                    test="${paper.paper_issue== 0}">
                期刊
            </c:if> <c:if
                test="${paper.paper_issue == 1}">
            会议
        </c:if>
            等级
        </dt>
        <dd class="jc-field"><c:if test="${paper.paper_journals_conference_ZKY != null}">
            ${paper.paper_journals_conference_ZKY.journals_conference_name}
        </c:if>

        </dd>
        <dd class="jc-field">
            <c:if test="${paper.paper_journals_conference_JCR != null}">
                ${paper.paper_journals_conference_JCR.journals_conference_name}
            </c:if>
        </dd>
        <dd class="jc-field">
            <c:if test="${paper.paper_journals_conference_CCF != null}">
                ${paper.paper_journals_conference_CCF.journals_conference_name}

            </c:if>
        </dd>
        <dd class="jc-field">
            <c:if test="${paper.paper_journals_conference_ESI != null}">
                ${paper.paper_journals_conference_ESI.journals_conference_name}
            </c:if>
        </dd>

        <dd class="jc-field">
            <c:if test="${paper.paper_journals_conference_OTHER != null}">
                ${paper.paper_journals_conference_OTHER.journals_conference_name}
            </c:if>
        </dd>


    </dl>
    <dl class="dl-horizontal text-overflow">
        <dt>收录类型</dt>
        <dd>${paper.paper_includedType}</dd>
    </dl>

    <%-- <dl class="dl-horizontal text-overflow">
        <dt>论文位置</dt>
        <dd>${paper.paper_location}</dd>
    </dl> --%>
    <dl class="dl-horizontal text-overflow">
        <dt>作者</dt>
        <c:forEach var="author" begin="0" step="1" items="${authors}">
            <dd>${author.author_name}</dd>
        </c:forEach>
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
        <label class="col-md-1 control-label">下载选择 </label>
        <div class="col-md-5">
            <select id="dowloadType" name="dowloadType" onchange="selectType()"
                    class="form-control">
                <c:if test="${paper.paper_publishType==1}">
                    <option value="0">请选择</option>
                    <option value="1">作者信息页</option>
                    <option value="2">论文全页</option>
                    <option value="3">论文/期刊封面</option>
                    <option value="4">论文/期刊封底</option>
                </c:if>
                <c:if test="${paper.paper_publishType==2}">
                    <option value="0">请选择</option>
                    <option value="2">论文全页</option>
                    <option value="5">论文检索证明</option>
                </c:if>
                <c:if test="${paper.paper_publishType==3}">
                    <option value="0">请选择</option>
                    <option value="2">论文全页</option>
                    <option value="5">论文检索证明</option>
                </c:if>
            </select>
        </div>
        <div class="col-md-12" style="padding-bottom:3%">
            <a href="" class="btn btn-primary" style="font-size: 15px;">下载</a>
        </div>
        <%--             <a href="teacher/download.do?paper_id=${paper.paper_id}&teacher_no=${paper.paper_teacher.teacher_no}&fileName=1">下载</a> --%>
        <%--             paper_id=${paper.id}&teacher_no=${paper.paper_teacher.teacher_no} --%>
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