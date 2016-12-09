<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>论文成果查看</title>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/paper/input/paper.input.show.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sui.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/pms.css"/>
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
    <jsp:param value="5" name="location"/>
</jsp:include>
<!--导航条结束-->
<div class="jumbotron">
    <div class="container">
        <h1 style="font-size:45px;">信息确认</h1>
    </div>
</div>
<div class="container">
    <div class="sui-steps-round steps-round-auto steps-4">
        <div class="finished">
            <div class="wrap">
                <div class="round">1</div>
                <div class="bar"></div>
            </div>
            <label>录入成果</label>
        </div>
        <div class="current">
            <div class="wrap">
                <div class="round">2</div>
                <div class="bar"></div>
            </div>
            <label>信息确认</label>
        </div>
        <div class="todo">
            <div class="wrap">
                <div class="round">3</div>
                <div class="bar"></div>
            </div>
            <label>文件上传</label>
        </div>
        <div class="todo last">
            <div class="wrap" style="width:50px ;">
                <div class="round">4</div>
            </div>
            <label>录入完成</label>
        </div>
    </div>
    <blockquote>
        <span> 论文信息 </span>
    </blockquote>


    <span id="showPaperProxyList"></span>
    <%--<input type="hidden"--%>
    <%--value="${requestScope.paperproxy_id}" id="paperproxy_id"/>--%>
    <%--<input type="hidden"--%>
    <%--value="${requestScope.commited_paper_id}" id="commited_paper_id"/>--%>
    <c:if test="${sessionScope.teacher!=null}">
        <input type="hidden"
               value="1" id="user_flag"/>
    </c:if>
    <c:if test="${sessionScope.admin!=null}">
        <input type="hidden"
               value="0" id="user_flag"/>
    </c:if>
    <input type="hidden"
           value="${sessionScope.currentPage}" id="currentPage"/>
    <input type="hidden"
           value="${sessionScope.column}" id="column"/>
    <input type="hidden"
           value="${sessionScope.order}" id="order"/>
    <%--<input type="hidden" value="${requestScope.teacher_no}"--%>
    <%--id="teacher_no"/>--%>
    <span id="showAuthorProxyList"></span>
    <div class="row">
        <div class="col-md-6">
            <button class="btn btn-primary btn-lg" id="paperproxy_modify">继续修改</button>
        </div>
        <div class="col-md-6">
            <button class="btn btn-warning btn-lg" id="paperproxy_confirm">上传文件</button>
        </div>
        <div class="col-md-12">&nbsp;</div>
    </div>
</div>
<form id="upload_form" action="../paper_proxy/upload.do" method="post">
    <input type="hidden" value="${requestScope.teacher_no}" name="teacher_no"
           id="teacher_no"/>
    <input type="hidden"
           value="${requestScope.paperproxy_id}" id="paperproxy_id" name="paperproxy_id"/>
    <input type="hidden" id="paperproxy_publishType" name="paperproxy_publishType"/>
</form>
<form id="modify_form" action="../paper_proxy/modify.do" method="post">
    <input type="hidden"
           value="${requestScope.commited_paper_id}" id="commited_paper_id" name="commited_paper_id"/>
    <input type="hidden"
           value="${requestScope.paperproxy_id}" name="paperproxy_id"/>
</form>
<!--footer开始-->
<jsp:include page="../../../layout/footer.jsp"/>
<!--footer结束-->
</body>
</html>