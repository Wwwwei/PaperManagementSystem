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
    <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/common/bootstrap.min.js"></script>
    <script>
        window.onload = function () {
            var find_type_value = "${find_type}";
            $("#find_type").val(find_type_value);

            var journals_conference_degree_value = "${journals_conference_degree}";
            $("#journals_conference_degree").val(journals_conference_degree_value);

            var paper_includedType_value = "${paper_includedType}";
            $("#paper_includedType").val(paper_includedType_value);

            var paper_time_value = "${paper_time}";
            $("#paper_time").val(paper_time_value);

            var journals_conference_flag_value = "${journals_conference_flag}";
            $("#journals_conference_flag").val(journals_conference_flag_value);

            var paper_time_order_value = "${paper_time_order}";
            $("#paper_time_order").val(paper_time_order_value);

            var teacher_id_value = "${teacher_id}";
            $("#teacher_id").val(teacher_id_value);
        };

        function checkInput() {
            var find_string_value = $("#find_string").val();
            var find_type_value = $("#find_type").val();
            if (find_string_value == "") {
                alert("请输入关键词！");
                return false;
            } else if (find_type_value == "author_info") {
                var reg = /^(\w|[\u4E00-\u9FA5])*$/;
                if (find_string_value.match(reg)) {
                    return true;
                } else {
                    alert("用户名只允许为英文，数字和汉字的混合,\n请检查是否前后有空格或者其他符号");
                    return false;
                }
            }
        }
        ;
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <style>
        .jumbotron {
            padding-top: 0;
            padding-bottom: 0;
            background-color: #337ab7;
            color: #FFFFFF;
        }
    </style>
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
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle"
                                        data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                        aria-expanded="false"> 公共查询 <span class="caret"></span>
                </a>
                    <ul class="dropdown-menu">
                        <li><a href="findPaper.jsp">论文</a></li>
                        <li><a href="#">软著</a></li>
                    </ul>
                </li>
            </ul>
            <c:if test="${sessionScope.teacher==null}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"> <span
                            class="glyphicon glyphicon-log-in"></span> &nbsp;登录
                    </a></li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.teacher!=null}">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            <span class="glyphicon glyphicon-user"></span> &nbsp;<a
                                href="teacher/backFunction.do" data-toggle="tooltip"
                                data-placement="bottom" title="单击显示教师具体信息">${teacher.teacher_name }</a>
                        </p>
                        <p class="navbar-text">
                            &nbsp;<a href="login.jsp" data-toggle="tooltip"
                                     data-placement="bottom" title="单击退出">退出</a>
                        </p>
                    </li>
                </ul>
            </c:if>
        </div>

    </div>
</nav>
<!--导航条结束-->
<!--标题查询开始-->
<form id="findPaper" action="findPaper.do" method="post">
    <div class="jumbotron">
        <div class="container">
            <h2>论文查询</h2>
            <!-- 				<form id="findPaper" action="findPaper.do" method="post">		 -->
            <div class="row">
                <div class="col-lg-4" style="padding-bottom: 20px;">
                    <div class="input-group">
                        <span class="input-group-addon">关键词</span> <input type="text"
                                                                          name="find_string" id="find_string"
                                                                          value="${sessionScope.find_string}"
                                                                          class="form-control"/>
                    </div>
                </div>

                <div class="col-lg-4" style="padding-bottom: 20px;">
                    <div class="input-group">
                        <span class="input-group-addon">选项</span> <select id="find_type"
                                                                          name="find_type" class="form-control">
                        <option value="">请选择</option>
                        <option value="author_info">作者信息</option>
                        <option value="paper_info">论文信息</option>
                    </select>
                    </div>
                </div>

                <div class="col-lg-4" style="padding-bottom: 20px;">
                    <div class="col-lg-6" style="padding-bottom: 20px;">
                        <button type="submit" class="btn btn-primary btn-lg">查询</button>
                    </div>
                    <div class="col-lg-6" style="padding-bottom: 20px;">
                        <a href="findAllPaperIndex.do">
                            <button type="button"
                                    class="btn btn-primary btn-lg">查询全部论文
                            </button>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--标题查询结束-->
    <!--查询结果显示开始-->
    <div class="container">
        <blockquote>
            <span> 查询结果 </span>
        </blockquote>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th width="50px">编号</th>
                    <th>论文名称</th>
                    <th width="100px">录入作者</th>

                    <th width="50px">排名</th>
                    <th><select id="journals_conference_flag"
                                name="journals_conference_flag">
                        <option value="-1" selected="selected">论文类型</option>
                        <option value="0">期刊</option>
                        <option value="1">会议</option>
                    </select></th>
                    <th width="80px">会议/期刊名称</th>
                    <th><select id="journals_conference_degree"
                                name="journals_conference_degree">
                        <option value="ALL" selected="selected">论文等级</option>
                        <c:forEach var="degree" begin="0" step="1"
                                   items="${journals_Conference_degrees}">
                            <option value="${degree}">${degree}</option>
                        </c:forEach>
                    </select></th>
                    <th><select id="paper_includedType"
                                name="paper_includedType">
                        <option value="ALL" selected="selected">收录类型</option>
                        <option value="EI">EI</option>
                        <option value="SCI">SCI</option>
                    </select></th>
                    <th>检索号</th>
                    <th><select id="paper_time" name="paper_time">
                        <option value="ALL" selected="selected">发表年月</option>
                        <c:forEach var="time" begin="0" step="1" items="${paper_times}">
                            <option value="${time}">${time}年</option>
                        </c:forEach>
                    </select><select id="paper_time_order" name="paper_time_order">
                        <option value="1" selected="selected">日期正序</option>
                        <option value="-1">日期反序</option>
                    </select></th>
                    <th>期刊位置</th>
                    <th width="80px">其他作者</th>
                    <th>下载</th>
                </tr>
                </thead>
                <c:forEach var="paper" begin="0" end="10" step="1"
                           items="${requestScope.papers}" varStatus="status">
                    <tr>
                        <td>${status.count+(page.currentPage-1)*page.pageNumber}</td>
                        <td class="text-overflow"><a
                                href="teacher/findTeacherInfo.do?teacher_id=${paper.paper_teacher.teacher_id}">${paper.paper_name}</a>
                        </td>
                        <td><a
                                href="findTeacherInfo.do?teacher_id='${paper.paper_teacher.teacher_id}'">${paper.paper_teacher.teacher_name}</a>
                        </td>
                        <td>${paper.paper_rank}/${paper.paper_authorNum}</td>
                        <td>
                            <!-- 会议或者期刊 判定一下--> <c:if
                                test="${paper.paper_journals_Conference.journals_conference_flag == 0}">
                            期刊
                        </c:if> <c:if
                                test="${paper.paper_journals_Conference.journals_conference_flag == 1}">
                            会议
                        </c:if>
                        </td>
                        <td>${paper.paper_journals_Conference.journals_conference_name}</td>
                        <td>${paper.paper_journals_Conference.journals_conference_degree}</td>
                        <td>${paper.paper_includedType}</td>
                        <td>${paper.paper_accNum}</td>
                        <td>${paper.paper_time}</td>
                        <td>${paper.paper_location}</td>
                        <td><a href="">其他作者</a><br></td>
                        <td><a href="${paper.paper_url}">
                            <button type="button"
                                    class="btn btn-primary">下载
                            </button>
                        </a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
</form>
<!--查询结果显示结束-->
<!--分页开始-->
	<span class="text-primary">第 ${page.currentPage} 页，共
		${page.totalPage} 页</span>
<ul class="pager">
    <li><a href="findPaper.do?currentPage=1"><span
            class="glyphicon glyphicon-step-backward"></span>首页</a></li>
    <c:choose>
        <c:when test="${page.currentPage - 1 > 0}">
            <li><a href="findPaper.do?currentPage=${page.currentPage - 1}"><span
                    class="glyphicon glyphicon-triangle-left"></span>上一页</a></li>
        </c:when>
        <c:when test="${page.currentPage - 1 <= 0}">
            <li><a href="findPaper.do?currentPage=1"><span
                    class="glyphicon glyphicon-triangle-left"></span>上一页</a></li>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${page.currentPage + 1 < page.totalPage}">
            <li><a href="findPaper.do?currentPage=${page.currentPage + 1}">下一页<span
                    class="glyphicon glyphicon-triangle-right"></span></a></li>
        </c:when>
        <c:when test="${page.currentPage + 1 >= page.totalPage}">
            <li><a href="findPaper.do?currentPage=${page.totalPage}">下一页
                <span class="glyphicon glyphicon-triangle-right"></span>
            </a></li>
        </c:when>
    </c:choose>
    <li><a href="findPaper.do?currentPage=${page.totalPage}">尾页<span
            class="glyphicon glyphicon-step-forward"></span></a></li>
</ul>
<!--分页结束-->
</div>
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