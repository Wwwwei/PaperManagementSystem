<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@page import="pms.entity.Teacher" %>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>论文成果录入</title>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/paper/input/paper.input.js"></script>
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
    // var f="";
    // $(window).load(function()
    // { f=$('form').serialize; });
    // function hasSaved(){
    // 	if(hasChanged($('form'), f))
    // 		alert('是否离开当前页面');
    // 	return false;
    // 	}
    // function hasChanged(elem, arr){
    // 	if(elem.serialize==arr){
    // 		return false; }
    // 	return true
    // 	} ;
    var hasSaved = false;//是否有输入的内容未保存标志，初始值为false
    function checkISsave() {
        if (hasSaved == false) {
            return "您上传的东西尚未保存，请保存后再离开页面";
        }
        //return true; //不能加这个语句
    }

    //保存了则改变状态
    function changeState() {
        hasSaved = true;
    }
    $('#myButton').on('click', function () {
        var $btn = $(this).button('loading')
        // business logic...
        $btn.button('reset')
    })

    //    function changestyle() {
    //        var jurnalflag = document.getElementById("journalsORconference");
    //        var index = jurnalflag.selectedIndex;
    //        var area1 = document.getElementById("ZKYA");
    //        var area2 = document.getElementById("JCRA");
    //        if (jurnalflag.options[index].value == 1) {
    //            area1.removeAttribute("style");
    //            area1.setAttribute("style", "height:0px");
    //            area2.removeAttribute("style");
    //            area2.setAttribute("style", "height:0px");
    //        }
    //        if (jurnalflag.options[index].value == 0) {
    //            area1.removeAttribute("style");
    //            area1.setAttribute("style", "height:54px");
    //            area2.removeAttribute("style");
    //            area2.setAttribute("style", "height:54px");
    //        }
    //    }
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
<form action="../paper_proxy/create.do" method="post" id="paperForm">
    <div class="jumbotron">
        <div class="container">
            <h2>录入成果</h2>
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
                                    <label>录入成果</label>
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
                                           class="form-control"> <label><span
                                        id="checkArea"></span></label>
                                </div>

                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">我的排名<span style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="number" id="rank" name="paper_rank" min="1"
                                           class="form-control" max="100">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">作者人数<span style="color: #ff0000">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="number" id="AuthorNumber" min="1"
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
                                    <select id="includedType" name="paper_includedType"
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
                                    <label class="radio-inline" style="margin-top:0px;">
                                        <input type="radio" id="status" name="paper_status" value="0"
                                               checked="checked" class=""/>已录用
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio"
                                               id="status" name="paper_status" value="1"/>已发表
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">发表年月</label>
                                <div class="col-md-5">
                                    <input type="date" id="time" name="paper_time"
                                           disabled="false" class="form-control">
                                </div>
                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">检索编号 </label>
                                <div class="col-md-5">
                                    <input type="text" id="accNum" name="paper_accNum"
                                           disabled="false" class="form-control">
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
                                    <input type="text" id="paper_if" name="paper_if" min="1"
                                           class="form-control">
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <label class="col-md-1 control-label">期刊号</label>
                                <div class="col-md-5">
                                    <input type="text" name="paper_location_issuing"
                                        class="form-control">
                                </div>
                            </div> -->
                            <div class="col-md-12">&nbsp;</div>
                            <!--期刊位置信息-->
                            <div id="paper_journals_location">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">期刊名称<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_journals_publishName" name="paper_publishName"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">期刊号<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" name="paper_journals_location1"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">卷期<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_journals_location2" name="paper_journals_location2"
                                               disabled="false"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-1 control-label">页码<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_journals_location3" name="paper_journals_location3"
                                               disabled="false"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">期刊性质<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <label class='radio-inline'>
                                            <input type="radio" name="paper_publishType" value='1' checked="checked"/>国内期刊
                                        </label>
                                        <label class='radio-inline' style="margin-top: 5px">
                                            <input type="radio" name="paper_publishType" value='2'/>国外期刊
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <!--会议位置信息-->
                            <div id="paper_conference_location" hidden="hidden">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议名称<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_conference_publishName" name="paper_publishName"
                                               disabled="false"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议页码<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" id="paper_conference_location1"
                                               name="paper_conference_location1"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">&nbsp;</div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议地点<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <input type="text" name="paper_conference_location2"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">会议性质<span
                                            style="color: #ff0000">*</span></label>
                                    <div class="col-md-5">
                                        <label class='radio-inline'>
                                            <input type="radio" value='3' checked="checked"/>国际会议
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <span id="journalsORconferenceArea"></span>
                            <div id="paper_journals_conference_CUSTOM" class="form-group" hidden="hidden">
                                <label class="col-md-2 control-label">请输入论文级别:</label>
                                <div class="col-md-4">
                                    <input type="text" name="paper_journals_conference_CUSTOM"
                                           class="form-control">
                                </div>
                            </div>
                            <!-- 	<span
                                id="degreeArea"></span> -->
                            <!-- <div class="form-group">
                                <label class="col-md-1 control-label">卷期</label>
                                <div class="col-md-5">
                                    <input type="text" name="paper_location_volume"
                                        class="form-control">
                                </div>
                            </div> -->
                            <!-- <div class="form-group">
                                <label class="col-md-1 control-label">页码</label>
                                <div class="col-md-5">
                                    <input type="text" name="paper_location_pagination"
                                        class="form-control">
                                </div>
                            </div> -->
                            <%--<div class="col-md-8" style="min-height:54px" id="ZKYA">--%>
                            <%--<span id="journalsORconferenceZKYArea"></span>--%>
                            <%--<div class='col-md-12'>&nbsp;</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-8" style="min-height:54px" id="JCRA">--%>
                            <%--<span id="journalsORconferenceJCRArea"></span>--%>
                            <%--<div class='col-md-12'>&nbsp;</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-8" style="min-height:54px">--%>
                            <%--<span id="journalsORconferenceCCFArea"></span>--%>
                            <%--<div class='col-md-12'>&nbsp;</div>--%>
                            <%--</div>--%>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Web of Science 总引
                                    <small
                                            class="text-muted" style="color: red;">*
                                    </small>
                                </label>
                                <div class="col-md-4">
                                    <input type="number" name="paper_citations" value="0" min="0"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="hidden-lg hidden-md">
                                <br>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Web of Science 他引
                                    <small
                                            class="text-muted" style="color: red;">*
                                    </small>
                                </label>
                                <div class="col-md-4">
                                    <input type="number" name="paper_citations_others" value="0"
                                           min="0" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Google Scholar 引用
                                    <small
                                            class="text-muted" style="color: red;">*
                                    </small>
                                </label>
                                <div class="col-md-4">
                                    <input type="number" name="paper_citations_google" value="0"
                                           min="0" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">&nbsp;</div>
                            <input type="hidden" value="${requestScope.teacher.teacher_id}"
                                   name="paper_teacher.teacher_id"/>
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary btn-lg"
                                        data-loading-text="正在保存..." autocomplete="off" id="myButton"
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
<input type="hidden" value="${requestScope.teacher.teacher_no}"
       id="teacher_no"/>
<input type="hidden" value="${requestScope.teacher.teacher_name}"
       id="teacher_name"/>
<input type="hidden"
       value="${requestScope.teacher.teacher_university}"
       id="teacher_office"/>


<!--footer开始-->
<jsp:include page="../../../layout/footer.jsp"/>
<!--footer结束-->
</body>

</html>