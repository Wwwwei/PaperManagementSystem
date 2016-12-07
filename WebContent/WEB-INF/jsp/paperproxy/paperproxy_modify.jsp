<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>论文成果录入修改</title>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/paper/input/paper.input.modify.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/paper/validate/jquery.validate.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/paper/validate/messages_cn.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/validate.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sui.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/pms.css"/>
</head>
<script type="text/javascript">
    var hasSaved = false;//是否有输入的内容未保存标志，初始值为false
    function checkISsave() {
        if (hasSaved == false) {
            // alert("您上传的东西尚未保存，请保存后再离开页面");
            return "您上传的东西尚未保存，请保存后再离开页面";
        }
        //return true; //不能加这个语句
    }

    //保存了则改变状态
    function changeState() {
        hasSaved = true;
    }
    function changestyle() {
        var jurnalflag = document.getElementById("journalsORconference");
        var index = jurnalflag.selectedIndex;
        var area1 = document.getElementById("ZKYA");
        var area2 = document.getElementById("JCRA");
        if (jurnalflag.options[index].value == 1) {
            area1.removeAttribute("style");
            area1.setAttribute("style", "height:0px");
            area2.removeAttribute("style");
            area2.setAttribute("style", "height:0px");
        }
        if (jurnalflag.options[index].value == 0) {
            area1.removeAttribute("style");
            area1.setAttribute("style", "height:54px");
            area2.removeAttribute("style");
            area2.setAttribute("style", "height:54px");
        }
    }
</script>
<style>
    .jumbotron {
        padding-top: 0;
        margin-top: 0;
        margin-bottom: 0;
        background-color: #337ab7;
        color: #FFFFFF;
    }

    .form-group {
        margin-bottom: 0;
    }

    .form-control-feedback {
        width: 60px;
    }

    .has-feedback label ~ .form-control-feedback {
        top: 0px;
    }
</style>
<body onbeforeunload="return checkISsave();">
<!--导航条开始-->
<jsp:include page="header.jsp">
    <jsp:param value="5" name="location"/>
</jsp:include>
<!--导航条结束-->
<form action="../paper_proxy/update.do" method="post" id="paperForm">
    <input type="hidden" value="${requestScope.paperproxy_id}"
           id="paperproxy_id" name="paper_id"/> <input type="hidden"
                                                       value="${requestScope.commited_paper_id}" id="commited_paper_id"
                                                       name="commited_paper_id"/>
    <div class="jumbotron">
        <div class="container">
            <h2>修改成果</h2>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary"
                         style="border: 1px solid #FFFFFF;">

                        <div class="panel-body" style="color: #000000; font-size: 14px;">
                            <div class="sui-steps-round steps-round-auto steps-4">
                                <div class="current">
                                    <div class="wrap">
                                        <div class="round">1</div>
                                        <div class="bar"></div>
                                    </div>
                                    <label>修改成果</label>
                                </div>
                                <div class="todo">
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
                            <div class="form-group">
                                <label class="col-md-1 control-label">论文名称<span style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="text" id="paper_name" name="paper_name"
                                           class="form-control" readonly="true">
                                </div>
                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">我的排名<span style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="number" id="paper_rank" name="paper_rank" min="1"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">作者人数<span style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="number" id="paper_authorNum" min="1"
                                           name="paper_authorNum" value="0" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <span id="AuthorArea"></span>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">收录类型 </label>
                                <div class="col-md-5">
                                    <select id="paper_includedType" name="paper_includedType"
                                            class="form-control">
                                        <option value="SCI">SCI</option>
                                        <option value="EI">EI</option>
                                        <option value="ISTP">ISTP</option>
                                        <option value="SSCI">SSCI</option>
                                        <option value="other">其他</option>
                                    </select>
                                </div>
                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <span id="includedTypeArea"></span>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">论文状态 </label>
                                <div class="col-md-5">
                                    <label class="radio-inline" style="margin-top: 0px;">
                                        <input type="radio" id="paper_status0" name="paper_status"
                                               value="0" checked="checked"/>已录用
                                    </label> <label class="radio-inline"> <input type="radio"
                                                                                 id="paper_status1" name="paper_status"
                                                                                 value="1"/>已发表<br/>
                                </label>
                                </div>
                            </div>

                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">发表年月</label>
                                <div class="col-md-5">
                                    <input type="date" id="paper_time" name="paper_time"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">检索编号 </label>
                                <div class="col-md-5">
                                    <input type="text" id="paper_accNum" name="paper_accNum"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">发表方式</label>
                                <div class="col-md-5">
                                    <select id="journalsORconference" name="paper_issue"
                                            class="form-control" onchange="changestyle()">
                                        <option value="0">期刊</option>
                                        <option value="1">会议</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">影响因子<span style="color: #ff0000">*</span></label>
                                <div class="col-md-5">
                                    <input type="text" id="paper_if" name="paper_if"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <!--期刊位置信息-->
                            <div id="paper_journals_location">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">期刊号<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_journals_location1" name="paper_journals_location1"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">卷期<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_journals_location2" name="paper_journals_location2"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">页码<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_journals_location3" name="paper_journals_location3"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>

                            <!--会议位置信息-->
                            <div id="paper_conference_location" hidden="hidden">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议名称<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_conference_location1"
                                               name="paper_conference_location1"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议页码<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_conference_location2"
                                               name="paper_conference_location2"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议地点<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_conference_location3"
                                               name="paper_conference_location3"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class='col-md-12'>&nbsp;</div>
                            <div class='col-md-12'>
                                <div class='alert alert-warning' style='font-size: 14px;'><span
                                        class='glyphicon glyphicon-info-sign'></span><strong>Tips</strong>&nbsp;&nbsp;若您的论文在下列级别选项中无对应级别,请勾选其他,手动填写.
                                </div>
                            </div>
                            <div class="col-md-4">
                                <span id="journalsORconferenceArea"></span>
                            </div>
                            <!-- 		<span id="degreeArea"></span> -->
                            <%--<div class="col-md-8" style="min-height: 54px" id="ZKYA">--%>
                            <%--<span id="journalsORconferenceZKYArea"></span>--%>
                            <%--<div class='col-md-12'>&nbsp;</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-8" style="min-height: 54px" id="JCRA">--%>
                            <%--<span id="journalsORconferenceJCRArea"></span>--%>
                            <%--<div class='col-md-12'>&nbsp;</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-8" style="min-height: 54px">--%>
                            <%--<span id="journalsORconferenceCCFArea"></span>--%>
                            <%--<div class='col-md-12'>&nbsp;</div>--%>
                            <%--</div>--%>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Web of Science 总引<span
                                        style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-4">
                                    <input type="number" name="paper_citations"
                                           id="paper_citations" min="0" class="form-control">
                                </div>
                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Web of Science 他引<span
                                        style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-4">
                                    <input type="number" name="paper_citations_others"
                                           id="paper_citations_others" min="0" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Google Scholar 他引<span
                                        style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-4">
                                    <input type="number" name="paper_citations_google"
                                           id="paper_citations_google" min="0" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary btn-lg"
                                        data-loading-text="正在保存..." autocomplete="off"
                                        onclick="changeState()">保存
                                </button>
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
</form>
<input type="hidden" value="${teacher.teacher_no}" id="teacher_no"/>
<input type="hidden" value="${teacher.teacher_name}" id="teacher_name"/>
<input type="hidden"
       value="${teacher.teacher_institute.institute_name}"
       id="teacher_office"/>
<!--footer开始-->
<jsp:include page="../../../layout/footer.jsp"/>
<!--footer结束-->
</body>
</html>