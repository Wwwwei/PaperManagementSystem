<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>论文成果上传</title>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/common/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sui.css"/>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fileinput.min.css"/>
    <style>
        .jumbotron {
            text-align: center;
            margin-top: 0;
            background-color: #337ab7;
            color: #FFFFFF;
        }

        blockquote {
            border-left: 10px solid #337ab7;
            border-bottom: 1px solid #337ab7;
        }

        blockquote span {
            color: #337ab7;
            font-size: 22px;
        }

        body {
            font-family: "微软雅黑";
            padding-top: 50px;
            font-size: 15px;
        }

        .btn-primary {
            font-size: 15px;
            border: 1px solid #FFFFFF;
            background-color: #337ab7;
            color: #FFFFFF;
        }

        .btn-primary:hover {
            font-size: 15px;
            border: 1px solid #337ab7;
            background-color: #FFFFFF;
            color: #337ab7;
        }

        .btn-warning {
            font-size: 15px;
            width: 100%;
            border: 1px solid #FFFFFF;
            background-color: #f0ad4e;
            color: #FFFFFF;
        }

        .btn-warning:hover {
            font-size: 15px;
            border: 1px solid #f0ad4e;
            background-color: #FFFFFF;
            color: #f0ad4e;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param value="5" name="location"/>
</jsp:include>
<div class="jumbotron">
    <div class="container">
        <h1 style="font-size:45px;">文件上传</h1>
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
        <div class="finished">
            <div class="wrap">
                <div class="round">2</div>
                <div class="bar"></div>
            </div>
            <label>信息确认</label>
        </div>
        <div class="current">
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
        <span>文件信息 </span>
    </blockquote>
    <div class="row">
        <%--<div class="col-md-4"><label>请选择论文的类型：</label></div>--%>
        <%--<div class="col-md-4"><input id="incountry" type="radio" name="paper_type" value="0" checked--%>
        <%--onclick="changefile()">&nbsp;&nbsp;国内论文--%>
        <%--</div>--%>
        <%--<div class="col-md-4"><input id="outcountry" type="radio" name="paper_type" value="1" onclick="changefile()">&nbsp;&nbsp;国外论文--%>
        <%--</div>--%>
        <%--<div class="col-md-12">&nbsp;</div>--%>
        <div class="col-md-12">
            <div class="alert alert-warning">
                <table>
                    <tr>
                        <td width="20%" valign="middle" rowspan="2">
                            <span class="glyphicon glyphicon-info-sign"></span>
                            <strong>Tips1</strong>
                        </td>
                        <td>上传文件需按照提示上传满所有文件后才算录入成功哦</td>
                    </tr>
                    <tr>
                        <td>更新时可以重复上传文件，上传的文件将替换掉原来的文件。</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-md-12" id="china">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    您选择的是国内论文，以下是您需要提交的材料目录
                </div>
                <div class="panel-body" style="color: #000000; font-size: 18px;padding-bottom:20px">
                    <div class="alert alert-warning" style="font-size: 14px;">
                        <span class="glyphicon glyphicon-info-sign"></span>
                        <strong>Tips2</strong>&nbsp;&nbsp;四个文件必须分开、按顺序上传才算录入成功哦;文件上传格式支持pdf、doc、docx;
                    </div>
                    <div class="col-md-6">
                        <p id="text1">论文/期刊封面&nbsp;&nbsp;<span class="hidden" id="textok1"></span></p>
                        <input type="hidden" id="h1" value="0">
                    </div>
                    <div class="col-md-6">
                        <p id="text2">作者信息页&nbsp;&nbsp;<span class="hidden" id="textok2"></span></p>
                        <input type="hidden" id="h2" value="0">
                    </div>
                    <div class="col-md-12">&nbsp;</div>
                    <div class="col-md-6">
                        <p id="text3">论文全文&nbsp;&nbsp;<span class="hidden" id="textok3"></span></p>
                        <input type="hidden" id="h3" value="0">
                    </div>
                    <div class="col-md-6">
                        <p id="text4">论文/期刊封底&nbsp;&nbsp;<span class="hidden" id="textok4"></span></p>
                        <input type="hidden" id="h4" value="0">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 hidden" id="us">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    您选择的是国外论文，以下是您需要提交的材料目录
                </div>
                <div class="panel-body" style="color: #000000; font-size: 18px;padding-bottom:20px">
                    <div class="alert alert-warning" style="font-size: 14px;">
                        <span class="glyphicon glyphicon-info-sign"></span>
                        <strong>Tips2</strong>&nbsp;&nbsp;两个文件必须分开、按顺序上传才算录入成功哦;文件上传格式支持pdf、doc、docx;
                    </div>
                    <div class="col-md-6">
                        <p id="text5">论文全文&nbsp;&nbsp;<span class="hidden" id="textok5"></span></p>
                        <input type="hidden" id="h5" value="0">
                    </div>
                    <div class="col-md-6">
                        <p id="text6">论文检索证明&nbsp;&nbsp;<span class="hidden" id="textok6"></span></p>
                        <input type="hidden" id="h6" value="0">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">&nbsp;</div>
        <div class="col-md-12" id="china2">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active" id="p1"><a href="#page1" role="tab" data-toggle="tab">论文/期刊封面</a>
                </li>
                <li role="presentation" id="p2"><a href="#page2" role="tab" data-toggle="tab">作者信息页</a></li>
                <li role="presentation" id="p3"><a href="#page3" role="tab" data-toggle="tab">论文全文</a></li>
                <li role="presentation" id="p4"><a href="#page4" role="tab" data-toggle="tab">论文/期刊封底</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="page1">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false"
                                   data-min-file-count="1">
                        </div>
                    </form>
                    <div class="alert alert-success hidden" id="f1">
                        上传成功！<a href="#page2" role="tab" data-toggle="tab" onclick="clickf2()">点击此处</a>进入下一个文件上传...
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="page2">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-2" type="file" multiple class="file" data-overwrite-initial="false"
                                   data-min-file-count="1">
                        </div>
                    </form>
                    <div class="alert alert-success hidden" id="f2">
                        上传成功！<a href="#page3" role="tab" data-toggle="tab" onclick="clickf3()">点击此处</a>进入下一个文件上传...
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane" id="page3">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-3" type="file" multiple class="file" data-overwrite-initial="false"
                                   data-min-file-count="1">
                        </div>
                    </form>
                    <div class="alert alert-success hidden" id="f3">
                        上传成功！<a href="#page4" role="tab" data-toggle="tab" onclick="clickf4()">点击此处</a>进入下一个文件上传...
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="page4">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-4" type="file" multiple class="file" data-overwrite-initial="false"
                                   data-min-file-count="1">
                        </div>
                    </form>
                    <div class="alert alert-success hidden" id="f4">
                        上传成功！请确认上传清单上目录均已打钩才可继续下一步哦
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 hidden" id="us2">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active"><a href="#paperwhole2" role="tab" data-toggle="tab">论文全文</a></li>
                <li role="presentation"><a href="#profile2" role="tab" data-toggle="tab">论文检索证明</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="paperwhole2">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-5" type="file" multiple class="file" data-overwrite-initial="false"
                                   data-min-file-count="1">
                        </div>
                    </form>
                    <div class="alert alert-success hidden" id="f5">
                        上传成功！<a href="#profile2" role="tab" data-toggle="tab" onclick="clickf5()">点击此处</a>进入下一个文件上传...
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile2">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-6" type="file" multiple class="file" data-overwrite-initial="false"
                                   data-min-file-count="1">
                        </div>
                    </form>
                    <div class="alert alert-success hidden" id="f6">
                        上传成功！请确认上传清单上目录均已打钩才可继续下一步哦
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <button class="btn btn-block btn-primary" id="paperproxy_show">上一步</button>
        </div>
        <div class="col-md-6">
            <button class="btn btn-block btn-warning" id="paperproxy_submit"
                    disabled>确认录入论文
            </button>

        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal_success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel1">录入结果</h4>
                    </div>
                    <div class="modal-body">
                        录入成功
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal_failed" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel2">录入结果</h4>
                    </div>
                    <div class="modal-body">
                        录入失败,请稍后再试!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" value="${requestScope.teacher_no}" name="teacher_no"
           id="teacher_no"/>
    <input type="hidden" value="${requestScope.paperproxy_id}" name="paperproxy_id"
           id="paperproxy_id"/>
    <input type="hidden" value="${requestScope.paperproxy_publishType}" name="paperproxy_publishType"
           id="paperproxy_publishType"/>
    <div class="col-md-12">&nbsp;</div>
</div>
<!--footer开始-->
<jsp:include page="../../../layout/footer.jsp"/>
<!--footer结束-->
</body>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/js/paper/file/fileinput.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/js/paper/file/locales/zh.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/js/paper/input/paper.input.upload.js"></script>
</html>