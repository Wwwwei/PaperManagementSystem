<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<base href="<%=basePath%>">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="js/common/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/softwareCopyright.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/pms.css"/>
    <script type="text/javascript">
        $(function () {
            $("#uploadFile").click(function () {
                if (confirm('确认上传文件并覆盖之前的教师信息吗？'))
                    ajaxFileUpload();
            });
            $("#downloadFile").click(function () {
                window.open("template/template.xls");

            })
        });
        function ajaxFileUpload() {
            $.ajaxFileUpload({
                url: 'admin/insertTeacher.do', //用于文件上传的服务器端请求地址
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: 'file', //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                type: 'post',
                success: function (data, status) //服务器成功响应处理函数
                {
                    alert(data.status);
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            })
            return false;
        }
    </script>
    <title>Insert title here</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="container" style="margin-top: 5%;min-height:450px">
    <div class="row">
        <table class="table" style="border-color: #FFFFFF">
            <tr>
                <td width="20%">
                    <jsp:include page="left.jsp">
                        <jsp:param value="1" name="location"/>
                    </jsp:include>
                </td>
                <td>
                    <blockquote>
                        <span> 批量录入 </span>
                    </blockquote>
                    <p>
                    <div class="form-group">
                    </div>
                    <!-- <input id="file" type="file" name="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">-->
                    <input id="file" type="file" name="file">
                    </p>
                    <input type="button" class="btn btn-primary" id="downloadFile" value="模板下载"/>
                    <input type="button" class="btn btn-primary" id="uploadFile" value="录入教师信息"/>
                    <div class="col-lg-12">&nbsp;</div>
                </td>
            </tr>
        </table>
    </div>

</div>
<jsp:include page="../../../layout/footer.jsp"/>
</body>
</html>