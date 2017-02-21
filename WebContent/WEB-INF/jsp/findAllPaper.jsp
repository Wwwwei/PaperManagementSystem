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
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/pms.css"/>
<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<script type="text/javascript" src="js/softwareCopyright.js"></script>
<script type="text/javascript">
    // function findSoftwareCopyright(){
    // 	alert("模块正在开发中，敬请期待！");
    // 	return false;
    // };
    window.onload = function () {
        var exportLocation= $("[name=exportLocation]").val();;
        if(exportLocation=="export")
        {
            alert("导出路径：E:论文.xls");
        }
        var journals_conference_id_value = "${journals_conference_id}";
        $("#journals_conference_id").val(journals_conference_id_value);

        var paper_includedType_value = "${paper_includedType}";
        $("#paper_includedType").val(paper_includedType_value);

        var paper_time_value = "${paper_time}";
        $("#paper_time").val(paper_time_value);

// 		var journals_conference_flag_value = "${journals_conference_flag}";
// 		$("#journals_conference_flag").val(journals_conference_flag_value);

        var paper_time_order_value = "${paper_time_order}";
        $("#paper_time_order").val(paper_time_order_value);

        var teacher_id_value = "${teacher_id}";
        $("#teacher_id").val(teacher_id_value);

        var teacher_sex_value = "${teacher_sex}";
        $("#teacher_sex").val(teacher_sex_value);

        var teacher_age_min_value = "${teacher_age_min}";
        $("#teacher_age_min").val(teacher_age_min_value);

        var teacher_age_max_value = "${teacher_age_max}";
        $("#teacher_age_max").val(teacher_age_max_value);

        var journals_conference_IF_min_value = "${journals_conference_IF_min}";
        $("#journals_conference_IF_min").val(journals_conference_IF_min_value);

        // 		var journals_conference_IF_max_value = "${journals_conference_IF_max}";
        // 		$("#journals_conference_IF_max").val(journals_conference_IF_max_value);

        var paper_citations_min_value = "${paper_citations_min}";
        $("#paper_citations_min").val(paper_citations_min_value);

        var paper_citations_others_min_value = "${paper_citations_others_min}";
        $("#paper_citations_others_min").val(paper_citations_others_min_value);
    }
    function clicke() {
        var tex = document.getElementById("sele");
        if (tex.value == '打开筛选')
            tex.value = '收起筛选';
        else if (tex.value == '收起筛选')
            tex.value = '打开筛选';
    }
    function check() {
        var teacher_age_min = $("#teacher_age_min").val();
        var teacher_age_max = $("#teacher_age_max").val();
        if (teacher_age_min < 0 || teacher_age_min > 100
                || teacher_age_max < 20 ||
                teacher_age_max > 100
                || teacher_age_min > teacher_age_max) {
            alert("年龄范围输入错误，请重新输入！");
            return false;
        }

        var journals_conference_IF_min = $("#journals_conference_IF_min").val();
        var journals_conference_IF_max = $("#journals_conference_IF_max").val();
        if (journals_conference_IF_min < 0 || journals_conference_IF_min > 1000) {
            alert("影响因子范围输入错误，请重新输入！");
            return false;
        }
        if (journals_conference_IF_max != "") {
            if (journals_conference_IF_max < 0 ||
                    journals_conference_IF_max > 1000
                    || journals_conference_IF_min > journals_conference_IF_max) {
                alert("影响因子范围输入错误，请重新输入！");
                return false;
            }
        }

        var paper_citations_min = $("#paper_citations_min").val();
        var paper_citations_max = $("#paper_citations_max").val();
        if (paper_citations_min < 0 || paper_citations_min > 100000) {
            alert("论文总引范围输入错误，请重新输入！");
            return false;
        }

        if (paper_citations_max != "") {
            if (paper_citations_max < 0 ||
                    paper_citations_max > 100000
                    || paper_citations_min > paper_citations_max) {
                alert("论文总引范围输入错误，请重新输入！");
                return false;
            }
        }

        var paper_citations_others_min = $("#paper_citations_others_min").val();
        var paper_citations_others_max = $("#paper_citations_others_max").val();
        if (paper_citations_others_min < 0 || paper_citations_others_min > 100000) {
            alert("论文他引范围输入错误，请重新输入！");
            return false;
        }

        if (paper_citations_others_max != "") {
            if (paper_citations_others_max < 0 ||
                    paper_citations_others_max > 100000
                    || paper_citations_others_min > paper_citations_others_max) {
                alert("论文总引范围输入错误，请重新输入！");
                return false;
            }
        }
    }
</script>
<style>
    .jumbotron {
        padding-top: 0;
        padding-bottom: 0;
        background-color: #337ab7;
        color: #FFFFFF;
    }

    .order a {
        font-size: 13px;
        /*     text */
    }
</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
</head>
<body>
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
                                href="teacher/quit.do">登录 </a>
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
<!--标题查询开始-->
<form id="findAllPaper" action="findAllPaper.do" method="post"
      onsubmit="return check();">
    <div class="jumbotron">
        <div class="container">
            <h2>论文检索</h2>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary"
                         style="border: 1px solid #FFFFFF;">
                        <div class="panel-heading">
                            <table width="100%">
                                <tr>
                                    <td width="85%">查询结果筛选</td>
                                    <td style="text-align: right;"><input
                                            class="btn btn-primary" value="打开筛选" type="button"
                                            onClick="clicke()" id="sele" data-toggle="collapse"
                                            data-target="#collapseExample" aria-expanded="false"
                                            aria-controls="collapseExample"></td>
                                </tr>
                            </table>
                        </div>

                        <div class="panel-collapse collapse" id="collapseExample">
                            <div class="panel-body" style="color: #000000;">
                                <div class="col-md-1">
                                    <label>录入作者</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="teacher_id" name="teacher_id" class="form-control">
                                        <option value="0" selected="selected">----请选择----</option>
                                        <c:forEach var="teacher" begin="0" step="1"
                                                   items="${teachers}">
                                            <option value="${teacher.teacher_id}">${teacher.teacher_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="hidden-lg hidden-md">
                                    <br>
                                </div>
                                <div class="col-md-1">
                                    <label>性別</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="teacher_sex" name="teacher_sex"
                                            class="form-control">
                                        <option value="-1" selected="selected">----请选择----</option>
                                        <option value="0">女</option>
                                        <option value="1">男</option>
                                    </select>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-1">
                                    <label>年龄</label>
                                </div>
                                <div class="col-md-5">
                                    <table width="100%">
                                        <tr>
                                            <td><input name="teacher_age_min" id="teacher_age_min"
                                                       value="0" class="form-control"></td>
                                            <td>-</td>
                                            <td><input name="teacher_age_max" id="teacher_age_max"
                                                       value="100" class="form-control"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="hidden-lg hidden-md">
                                    <br>
                                </div>
                                <div class="col-md-1">
                                    <label>论文类型</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="journals_conference_flag"
                                            name="journals_conference_flag" class="form-control">
                                        <option value="-1" selected="selected">----请选择----</option>
                                        <option value="0">期刊</option>
                                        <option value="1">会议</option>
                                    </select>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-1">
                                    <label>影响因子</label>
                                </div>
                                <div class="col-md-5">
                                    <table width="100%">
                                        <tr>
                                            <td><input name="journals_conference_IF_min"
                                                       id="journals_conference_IF_min" class="form-control"></td>
                                            <td>-</td>
                                            <td><input name="journals_conference_IF_max"
                                                       id="journals_conference_IF_max" class="form-control"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="hidden-lg hidden-md">
                                    <br>
                                </div>
                                <div class="col-md-1">
                                    <label>论文等级</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="journals_conference_id"
                                            name="journals_conference_id" class="form-control">
                                        <option value="0" selected="selected">----请选择----</option>
                                        <c:forEach var="jc" begin="0" step="1"
                                                   items="${journals_Conferences}">
                                            <option value="${jc.journals_conference_id}">${jc.journals_conference_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-1">
                                    <label>收录类型</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="paper_includedType" name="paper_includedType"
                                            class="form-control">
                                        <option value="ALL" selected="selected">----请选择----</option>
                                        <option value="EI">EI</option>
                                        <option value="SCI">SCI</option>
                                    </select>
                                </div>
                                <div class="hidden-lg hidden-md">
                                    <br>
                                </div>
                                <div class="col-md-1">
                                    <label>发表年月</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="paper_time" name="paper_time" class="form-control">
                                        <option value="ALL" selected="selected">----请选择----</option>
                                        <c:forEach var="time" begin="0" step="1"
                                                   items="${paper_times}">
                                            <option value="${time}">${time}年</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-1">
                                    <label>论文总引</label>
                                </div>
                                <div class="col-md-5">
                                    <table width="100%">
                                        <tr>
                                            <td><input name="paper_citations_min"
                                                       id="paper_citations_min" class="form-control"></td>
                                            <td>-</td>
                                            <td><input name="paper_citations_max"
                                                       id="paper_citations_max" class="form-control"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="hidden-lg hidden-md">
                                    <br>
                                </div>
                                <div class="col-md-1">
                                    <label>论文他引</label>
                                </div>
                                <div class="col-md-5">
                                    <table width="100%">
                                        <tr>
                                            <td><input name="paper_citations_others_min"
                                                       id="paper_citations_others_min" class="form-control"></td>
                                            <td>-</td>
                                            <td><input name="paper_citations_others_max"
                                                       id="paper_citations_others_max" class="form-control"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-1">
                                    <label>专业</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="teacher_teachingProfession"
                                            name="teachingProfession_id"
                                            class="form-control">
                                        <option value="0" selected="selected">----请选择----</option>
                                        <c:forEach var="teachingProfession" begin="0" step="1"
                                                   items="${teachingProfession}">
                                            <option value="${teachingProfession.teachingProfession_id}">${teachingProfession.teachingProfession_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="hidden-lg hidden-md">
                                    <br>
                                </div>
                                <div class="col-md-1">
                                    <label>研究所</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="teacher_institute"
                                            name="institute_id" class="form-control">
                                        <option value="0" selected="selected">----请选择----</option>
                                        <c:forEach var="institute" begin="0" step="1"
                                                   items="${institutes}">
                                            <option value="${institute.institute_id}">${institute.institute_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-1">
                                    <label>职称</label>
                                </div>
                                <div class="col-md-5">
                                    <select id="teacher_title" name="teacher_title"
                                            class="form-control">
                                        <option value="ALL" selected="selected">----请选择----</option>
                                        <option value="教授">教授</option>
                                        <option value="副教授">副教授</option>
                                        <option value="讲师">讲师</option>
                                    </select>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="col-md-6">
                                    <button type="submit" class="btn btn-primary btn-lg">查询</button>
                                </div>
                                <div class="col-md-6">
                                    <button type="reset" class="btn btn-danger btn-lg">重置</button>
                                </div>
                            </div>


                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--标题查询结束-->
    <!--查询结果显示开始-->
    <div class="container">
        <blockquote>
            <span> 查询结果  </span>
            <span style="margin-right:900px;">		</span>
            <input id="exportLocation" type="hidden" name="exportLocation" value="${sessionScope.exportLocation}"/>
            <span><a href="exportPaper.do">导出论文</a></span>
        </blockquote>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th width="50px">编号</th>
                    <th width="150px">论文名称</th>
                    <th width="70px">录入作者</th>
                    <th width="50px">排名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th width="50px">论文类型</th>
                    <th>影响因子
                        <div class="order"><a href="findAllPaper.do?column=p.paper_if&order=1"
                                              class="">正序</a>
                            <a
                                    href="findAllPaper.do?column=p.paper_if&order=-1"
                                    class="">反序</a></div>
                    </th>
                    <th width="100px">论文等级</th>
                    <th width="50px">收录类型</th>
                    <th width="100px">发表年月
                        <div class="order"><a href="findAllPaper.do?column=p.paper_time&order=1"
                                              class="">正序</a>
                            <a
                                    href="findAllPaper.do?column=p.paper_time&order=-1"
                                    class="">反序</a></div>
                    </th>
                    <th>总引
                        <div class="order"><a href="findAllPaper.do?column=p.paper_citations&order=1"
                        >正序</a>
                            <a
                                    href="findAllPaper.do?column=p.paper_citations&order=-1"
                            >反序</a>
                        </div>
                    </th>
                    <th>他引
                        <div class="order"><a href="findAllPaper.do?column=p.paper_citations_others&order=1"
                        >正序</a>
                            <a
                                    href="findAllPaper.do?column=p.paper_citations_others&order=-1"
                            >反序</a>
                        </div>
                    </th>
                    <c:if test="${sessionScope.admin!=null}">
                        <th>
                            功能
                        </th>
                    </c:if>

                </tr>
                </thead>
                <c:forEach var="paper" begin="0" end="10" step="1"
                           items="${papers}" varStatus="status">
                    <tr>
                        <td>${status.count+(page.currentPage-1)*page.pageNumber}</td>

                        <td class="text-overflow"><a
                                href="findPaperById.do?paper_id=${paper.paper_id}&teacher_no=${paper.paper_teacher.teacher_no}">${paper.paper_name}</a>
                        </td>
                        <td><a
                                href="teacher/findTeacherInfo.do?teacher_id=${paper.paper_teacher.teacher_id}">${paper.paper_teacher.teacher_name}</a>
                        </td>
                        <td>${paper.paper_rank}/${paper.paper_authorNum}</td>
                        <td>
                            <!-- 会议或者期刊 判定一下--> <c:if
                                test="${paper.paper_teacher.teacher_sex == 0}">
                            女
                        </c:if> <c:if test="${paper.paper_teacher.teacher_sex == 1}">
                            男
                        </c:if>
                        </td>
                        <td width="50px">${paper.paper_teacher.teacher_age}</td>
                        <td><c:if
                                test="${paper.paper_issue == 0}">
                            期刊
                        </c:if> <c:if
                                test="${paper.paper_issue == 1}">
                            会议
                        </c:if></td>
                        <td>${paper.paper_if}</td>
                        <td><c:if test="${paper.paper_journals_conference_ZKY != null}">
                            ${paper.paper_journals_conference_ZKY.journals_conference_name}
                        </c:if>
                            <c:if test="${paper.paper_journals_conference_JCR != null}">
                                ${paper.paper_journals_conference_JCR.journals_conference_name}<br>
                            </c:if>
                            <c:if test="${paper.paper_journals_conference_CCF != null}">
                                ${paper.paper_journals_conference_CCF.journals_conference_name}
                            </c:if></td>
                        <td>${paper.paper_includedType}</td>
                            <%-- 							<td>${paper.paper_accNum}</td> --%>
                        <td>${paper.paper_time}</td>
                        <td>${paper.paper_citations}</td>
                        <td>${paper.paper_citations_others}</td>
                        <c:if test="${sessionScope.admin!=null}">
                            <td class="text-overflow">
                                <a  href="modify.do?paper_id=${paper.paper_id }">修改</a>
                                <a href="admin/deletePaperById.do?paper_id=${paper.paper_id}">删除</a></td>
                        </c:if>
                            <%-- 							<td><a href="${paper.paper_url}"><button type="button" --%>
                        <!-- 										class="btn btn-primary">下载</button></a></td> -->
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!--查询结果显示结束-->
        <!--分页开始-->

        <ul class="pager">
            <p class="text-primary">第 ${page.currentPage} 页，共
                ${page.totalPage} 页</p>
            <li><a href="findAllPaper.do?currentPage=1"><span
                    class="glyphicon glyphicon-step-backward"></span>首页</a></li>
            <c:choose>
                <c:when test="${page.currentPage - 1 > 0}">
                    <li><a
                            href="findAllPaper.do?currentPage=${page.currentPage - 1}"><span
                            class="glyphicon glyphicon-triangle-left"></span>上一页</a></li>
                </c:when>
                <c:when test="${page.currentPage - 1 <= 0}">
                    <li><a><span
                            class="glyphicon glyphicon-triangle-left"></span>上一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${page.currentPage + 1 <= page.totalPage}">
                    <li><a
                            href="findAllPaper.do?currentPage=${page.currentPage + 1}">下一页<span
                            class="glyphicon glyphicon-triangle-right"></span></a></li>
                </c:when>
                <c:when test="${page.currentPage + 1 > page.totalPage}">
                    <li><a>下一页
                        <span class="glyphicon glyphicon-triangle-right"></span>
                    </a></li>
                </c:when>
            </c:choose>
            <li><a href="findAllPaper.do?currentPage=${page.totalPage}">尾页<span
                    class="glyphicon glyphicon-step-forward"></span></a></li>
        </ul>
        <!--分页结束-->
    </div>
</form>
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