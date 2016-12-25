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
<jsp:include page="header.jsp">
    <jsp:param value="1" name="location"/>
</jsp:include>
<!--导航条结束-->
<div class="jumbotron">
    <div class="container">
        <h1 style="font-size: 45px;">论文详细信息</h1>
    </div>
</div>
<div class="container">
    <blockquote>
        <span>论文详细信息 </span>
    </blockquote>
    <input Type="hidden" name="paper_id" value="${paper.paper_id}"></input>
    <input Type="hidden" name="teacher_no"
           value="${paper.paper_teacher.teacher_no}"></input>
    <dl class="dl-horizontal text-overflow">
        <dt>论文名称</dt>
        <dd>${paper.paper_name}</dd>
    </dl>
    <dl class="dl-horizontal text-overflow">
        <dt>录入教师姓名</dt>
        <dd>${paper.paper_teacher.teacher_name}</dd>
    </dl>
    <dl class="dl-horizontal text-overflow">
        <dt>录入教师排名</dt>
        <dd>第${paper.paper_rank}名，共${paper.paper_authorNum}名</dd>
    </dl>
    <dl class="dl-horizontal text-overflow">
        <dt>论文类型</dt>
        <input Type="hidden" name="paper_issue" value="${paper.paper_issue}"></input>
        <dd>
            <c:if test="${paper.paper_issue == 0}">期刊</c:if>
            <c:if test="${paper.paper_issue == 1}">会议</c:if>
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
    <dl class="dl-horizontal text-overflow ">
        <dt>是否zjut100期刊论文</dt>
        <c:if
                test="${paper.paper_issue== 0&&paper.paper_journals_conference_isZjut100==0}">
            <dd>否</dd>
        </c:if>
        <c:if
                test="${paper.paper_issue== 0&&paper.paper_journals_conference_isZjut100==1}">
            <dd>是</dd>
        </c:if>
    </dl>
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
            <c:if test="${paper.paper_status== 1}">
                <span class="paper-status-text">已发表</span>
            </c:if>
            <c:if test="${paper.paper_status == 0}">
                <span class="paper-status-text">未发表</span>
                <a class="update-paper-status">修改状态</a>
            </c:if>
            <input type="hidden" name="paper_status" class="paper_status"
                   value="${paper.paper_status}"></input>
        </dd>
    </dl>
    <c:if test="${paper.paper_status == 0}">
        <dl class="dl-horizontal text-overflow acc-num">
            <dt>检索号</dt>
            <dd>
                <input type="text" name="paper_accNum" class="form-control" style="width:192px;"></input>
            </dd>
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
            <dd>
                <input type="date" id="time" name="paper_time"
                       value="${paper.paper_time}" class="form-control valid" style="width:192px;">
            </dd>
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
        </dl>
        <dl class="dl-horizontal text-overflow ">
            <dt>卷期</dt>
            <dd>${paper_location_volume}</dd>
        </dl>
        <dl class="dl-horizontal text-overflow ">
            <dt>页码</dt>
            <dd>${paper_location_pagination}</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 1&&paper.paper_issue== 1}">
        <dl class="dl-horizontal text-overflow ">
            <dt>会议页码</dt>
            <dd>${meeting_page}</dd>
        </dl>
        <dl class="dl-horizontal text-overflow ">
            <dt>会议地点</dt>
            <dd>${meeting_place}</dd>
        </dl>
    </c:if>
    <c:if test="${paper.paper_status == 0&&paper.paper_issue== 0}">
        <div class="location-area">
            <dl class="dl-horizontal text-overflow acc-num">
                <input type="hidden" name="update_location" value="0">
                <dt>卷期</dt>
                <dd><input type="text" name="paper_location_volume" class="form-control" style="width:192px;"></dd>
            </dl>
            <dl class="dl-horizontal text-overflow acc-num">
                <dt>页码</dt>
                <dd><input type="text" name="paper_location_pagination" class="form-control" style="width:192px;"></dd>
            </dl>
        </div>
    </c:if>

    <c:if test="${paper.paper_status == 0&&paper.paper_issue== 1}">
        <div class="location-area">
            <dl class="dl-horizontal text-overflow acc-num">
                <input type="hidden" name="update_location" value="0">
                <dt>会议页码</dt>
                <dd><input type="text" name="meeting_page" class="form-control" style="width:192px;"/></dd>
            </dl>
        </div>
    </c:if>

    <dl class="dl-horizontal text-overflow">
        <dt>
            <c:if test="${paper.paper_issue== 0}">期刊</c:if><c:if test="${paper.paper_issue == 1}">会议</c:if>等级
        </dt>

        <c:if test="${paper.paper_journals_conference_ZKY != null}">
            <dd class="jc-field">
                    ${paper.paper_journals_conference_ZKY.journals_conference_name}
            </dd>
        </c:if>


        <c:if test="${paper.paper_journals_conference_JCR != null}">
            <dd class="jc-field">
                    ${paper.paper_journals_conference_JCR.journals_conference_name}
            </dd>
        </c:if>


        <c:if test="${paper.paper_journals_conference_CCF != null}">
            <dd class="jc-field">
                    ${paper.paper_journals_conference_CCF.journals_conference_name}
            </dd>
        </c:if>

        <c:if test="${paper.paper_journals_conference_ESI != null}">
            <dd class="jc-field">
                    ${paper.paper_journals_conference_ESI.journals_conference_name}
            </dd>
        </c:if>


        <c:if test="${paper.paper_journals_conference_OTHER != null}">
            <dd class="jc-field">
                    ${paper.paper_journals_conference_OTHER.journals_conference_name}
            </dd>
        </c:if>


    </dl>
    <dl class="dl-horizontal text-overflow">
        <dt>收录类型</dt>
        <dd>${paper.paper_includedType}</dd>
    </dl>


    <dl class="dl-horizontal text-overflow">
        <dt>作者</dt>
        <dd>
            <c:forEach var="author" begin="0" step="1" items="${authors}">
                ${author.author_name};
            </c:forEach>
        </dd>
    </dl>
    <c:if test="${paper.paper_status== 0}">
        <a class="confirm-button btn btn-primary" style="width:192px;">确认修改</a>
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
        <div class="col-md-12">&nbsp;</div>
        <div class="col-md-12" style="padding-bottom: 3%">
            <a id="dowload_id"
               class="btn btn-primary disabled" style="font-size: 15px;">下载</a>
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