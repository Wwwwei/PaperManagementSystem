var result;// 论文信息json
var authorResult;// 作者信息json
// 获取论文信息
function shoWPaperProxy(paperproxy_id) {
    htmlobj = $
        .ajax({
            //url: "../paper_proxy/show.do",
            url: "../paper_proxy/getPaper.do",
            type: 'POST',
            data: {
                paperproxy_id: paperproxy_id
            },
            datatype: "json",
            success: function (data, stats) {
                if (stats == "success") {
                    var addText = "<div class='row'>";
                    var journalsORconference = "";
                    result = JSON.parse(htmlobj.responseText);
                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>论文名称</dt>"
                        + "<dd>" + result.paper_name + "</dd>"
                        + "</dl>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>录入者排名</dt>"
                        + "<dd>" + result.paper_rank + "</dd>"
                        + "</dl>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>作者人数</dt>"
                        + "<dd>" + result.paper_authorNum + "</dd>"
                        + "</dl>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>收录类型</dt>"
                        + "<dd>" + result.paper_includedType + "</dd>"
                        + "</dl>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>论文状态</dt>";
                    var time_name;
                    switch (result.paper_status) {
                        case 0:
                            addText += "<dd>已录用</dd></dl></div>";
                            time_name = "录用时间";
                            break;
                        case 1:
                            addText += "<dd>已发表</dd></dl></div>";
                            time_name = "发表时间";
                            break;
                    }

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>" + time_name + "</dt>"
                        + "<dd>" + result.paper_time + "</dd>"
                        + "</dl>";
                    addText += "<span id='paper_time_ErrorArea'></span>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>检索编号</dt>";
                    if (null == result.paper_accNum || 0 == result.paper_status) {
                        addText += "<dd>无</dd></dl>"
                    } else {
                        addText += "<dd>" + result.paper_accNum + "</dd></dl>";
                    }
                    addText += "<span id='paper_accNum_ErrorArea'></span>"
                        + "</div>";
                    addText += "<div class='col-md-6' style='min-height:41px;'>&nbsp;</div>"
                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>Web of Science 总引</dt>"
                        + "<dd>" + result.paper_citations + "</dd>"
                        + "</dl>";
                    addText += "<span id='paper_citations_ErrorArea'></span>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>Web of Science 他引</dt>"
                        + "<dd>" + result.paper_citations_others + "</dd>"
                        + "</dl>";
                    addText += "<span id='paper_citations_others_ErrorArea'></span>"
                        + "</div>";

                    addText += "<div class='col-md-6'>"
                        + "<dl class='dl-horizontal text-overflow'>"
                        + "<dt>Google Scholar 引用</dt>"
                        + "<dd>" + result.paper_citations_google + "</dd>"
                        + "</dl>";
                    addText += "<span id='paper_citations_google_ErrorArea'></span>"
                        + "</div></div>";
                    var list = "";
                    var conj = "";
                    addText += "<div class='panel panel-primary'>"
                        + "<div class='panel-heading'>"
                        + "<table width='100%'>"
                        + "<tr>"
                        + "<td width='85%'>发表方式：  ";
                    switch (result.paper_issue) {
                        case 0:
                            addText += "期刊";
                            list = "收起期刊列表";
                            conj = "期刊";
                            break;
                        case 1:
                            addText += "会议";
                            list = "收起会议列表";
                            conj = "会议";
                            break;
                    }
                    addText += "</td>"
                        + "<td style='text-align: right;'>"
                        + "<input class='btn btn-primary' value='" + list + "' type='button' onClick='clicka()' id='sala' data-toggle='collapse' data-target='#collapseExample2' aria-expanded='false' aria-controls='collapseExample2'>"
                        + "</td>"
                        + "</tr>"
                        + "</table>"
                        + "</div>";
                    addText += "<div class='panel-collapse collapse in' id='collapseExample2'>"
                        + "<div class='panel-body'>"
                        + "<div class='table-responsive'>"
                        + "<table width='100%' class='table table-hover'>";
                    switch (result.paper_journals_conference_other) {
                        case 0:
                            addText += "<tr><td>期刊类别：其他</td></tr></table></div></div></div></div>";
                            break;
                        case 1:
                            addText += "<thead>"
                                + "<tr>"
                                + "<th>" + conj + "名称</th>"
                                + "<th>期刊号</th>"
                                + "<th>卷期</th>"
                                + "<th>页码</th>"
                                + "</tr>"
                                + "</thead>";
                            if (null != result.paper_journals_conference_ZKY) {
                                addText += "<tr><td>" + result.paper_journals_conference_ZKY.journals_conference_name + "</td>";
                                var location = result.paper_location_ZKY.split("$");
                                addText += "<td>" + location[0] + "</td><td>" + location[1] + "</td><td>" + location[2] + "</td></tr>";
                            }
                            if (null != result.paper_journals_conference_JCR) {
                                addText += "<tr><td>" + result.paper_journals_conference_JCR.journals_conference_name + "</td>";
                                var location = result.paper_location_JCR.split("$");
                                addText += "<td>" + location[0] + "</td><td>" + location[1] + "</td><td>" + location[2] + "</td></tr>";
                            }
                            if (null != result.paper_journals_conference_CCF) {
                                addText += "<tr><td>" + result.paper_journals_conference_CCF.journals_conference_name + "</td>";
                                var location = result.paper_location_CCF.split("$");
                                addText += "<td>" + location[0] + "</td><td>" + location[1] + "</td><td>" + location[2] + "</td></tr>";
                            }
                            addText += "</table></div></div></div></div>";
                            break;
                    }
                    $("span#showPaperProxyList").html(addText);
                    showAuthorInputList(paperproxy_id);

                }
            },
            error: function (data) {
                alert("请求失败");
            }
        });
}

// 显示作者表清单
function showAuthorInputList(paperproxy_id) {
    htmlobj = $
        .ajax({
            url: "../author_proxy/show.do",
            type: 'POST',
            data: {
                paperproxy_id: paperproxy_id
            },
            datatype: "json",
            success: function (data, stats) {
                if (stats == "success") {
                    var addText = "<div class='panel panel-primary'>"
                        + "<div class='panel-heading'>"
                        + "<table width='100%'>"
                        + "<tr>"
                        + "<td width='85%'>作者表</td>"
                        + "<td style='text-align: right;'>"
                        + "<input class='btn btn-primary' value='收起作者表' type='button' onClick='clicke()' id='sele' data-toggle='collapse' data-target='#collapseExample' aria-expanded='false' aria-controls='collapseExample'>"
                        + "</td>"
                        + "</tr>"
                        + "</table>"
                        + "</div>";

                    addText += "<div class='panel-collapse collapse in' id='collapseExample'>"
                        + "<div class='panel-body'>"
                        + "<div class='table-responsive'>"
                        + "<table width='100%' class='table table-hover'>"
                        + "<thead>"
                        + "<tr>"
                        + "<th>作者排名</th>"
                        + "<th>作者姓名</th>"
                        + "<th>作者类型</th>"
                        + "<th>工号/学号</th>"
                        + "<th>作者单位</th>"
                        + "</tr>"
                        + "</thead>";

                    authorResult = JSON.parse(htmlobj.responseText);
                    for (var i in authorResult) {
                        addText += "<tr><td>" + authorResult[i].author_rank + "</td>";
                        addText += "<td>" + authorResult[i].author_name + "</td>";
                        switch (authorResult[i].author_type) {
                            case 1:
                                addText += "<td>本校</td>";
                                break;
                            case 2:
                                addText += "<td>外校</td>";
                                break;
                            case 3:
                                addText += "<td>研究生</td>";
                                break;
                            case 4:
                                addText += "<td>本科生 </td>";
                                break;
                        }
                        if (authorResult[i].author_type == 2) {
                            addText += "<td>无</td>";
                            addText += "<td>无</td>";
                        } else {
                            addText += "<td>" + authorResult[i].author_no + "</td>";
                            addText += "<td>" + authorResult[i].author_office + "</td>";
                        }
                        addText += "</tr>";

                    }
                    addText += "</table></div></div></div></div>";
                    for (var j in authorResult) {
                        addText += "<span id='author_ErrorArea" + authorResult[j].author_rank + "'></span>";
                    }
                    $("span#showAuthorProxyList").html(addText);

                }
            },
            error: function (data) {
                alert("请求失败");
            }
        });
}
// 上传文件
function UpladFile(paper_id) {
    var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
    if (fileObj == null) {
        alert("请选择上传文件!");
    } else {
        var FileController = "../paper_proxy/upload.do"; // 接收上传文件的后台地址
        // FormData 对象
        var form = new FormData();
        form.append("teacher_name", result.paper_teacher.teacher_name); // 可以增加表单数据
        form.append("paper_id", paper_id);
        form.append("file", fileObj); // 文件对象
        // XMLHttpRequest 对象
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            switch (xhr.readyState) {
                case 0:
                    // outLine("xhr请求已初始化");
                    break;
                case 1:
                    // outLine("xhr请求已打开");
                    break;
                case 2:
                    // outLine("xhr请求已发送");
                    break;
                case 3:
                    // outLine("xhr请求已响应");
                    break;
                case 4:
                    // outLine("xhr请求已完成");
                    if (xhr.status == 200) {
                        // alert(xhr.responseText);
                        // alert(result.paper_id);
                        // alert(result.paper_teacher.teacher_name);
                        // addText+="<input type='hidden' name='papaer_name'
                        // value='"+result.paper_name+"'/>";
                        // addText+="<input type='hidden' name='papaer_rank'
                        // value='"+result.paper_rank+"'/>";
                        // addText+="<input type='hidden' name='paper_authorNum'
                        // value='"+result.paper_authorNum+"'/>";
                        // addText+="<input type='hidden' name='paper_includedType'
                        // value='"+result.paper_includedType+"'/>";
                        // addText+="<input type='hidden' name='paper_accNum'
                        // value='"+result.result.paper_accNum+"'/>";
                        // addText+="<input type='hidden' name='paper_time'
                        // value='"+result.paper_time+"'/>";
                        // addText+="<input type='hidden'
                        // name='paper_journals_Conference.journals_conference_id'
                        // value='"+paper_journals_Conference.journals_conference_id+"'/>";
                        // addText+="<input type='hidden' name='paper_location'
                        // value='"+result.paper_location+"'/>";
                        /*
                         * var addText="<form action='../paper_proxy/submit.do'
                         * method='post'>"; addText+="<input type='hidden'
                         * name='paper_id' value='"+result.paper_id+"'/>";
                         * addText+="<input type='hidden' name='paper_url'
                         * value='"+xhr.responseText+"'/>"; addText+="<input
                         * type='submit' value='提交' /></form>";
                         * $("span#showSubmitArea").html(addText);
                         */
                    } else {
                        // outLine("xhr请求失败：" + xhr.status);
                    }
                    break;
                default:
                    break;
            }

        }
        xhr.open("post", FileController, true);
        xhr.onload = function () {
            // alert("上传完成!");
        };
        xhr.upload.addEventListener("progress", progressFunction, false);
        xhr.send(form);
    }
}

function progressFunction(evt) {
    var progressBar = document.getElementById("progressBar");
    var percentageDiv = document.getElementById("percentage");
    if (evt.lengthComputable) {
        progressBar.max = evt.total;
        progressBar.value = evt.loaded;
        percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100)
            + "%";
    }
}
function resetProgressBar() {
    var progressBar = document.getElementById("progressBar");
    var percentageDiv = document.getElementById("percentage");
    if (progressBar.value != 0) {
        progressBar.value = 0;
        percentageDiv.innerHTML = "";
    }
}
// 检查所有信息均不为空，若有空项，显示提示信息
function checkAllWithoutNull() {
    var checked = true;
    // 论文清单检查
    if (result.paper_status == 1 && (result.paper_accNum == null || $.trim(result.paper_accNum) == "")) {
        $("span#paper_accNum_ErrorArea").html("<div class='col-md-7 col-md-offset-1'><div class='alert alert-danger' role='alert'><strong>检索编号</strong>不能为空！</div></div>");
        checked = false;
    } else {
        $("span#paper_accNum_ErrorArea").html("");
    }
    if (result.paper_time == null || $.trim(result.paper_time) == "") {
        $("span#paper_time_ErrorArea").html("<div class='col-md-7 col-md-offset-1'><div class='alert alert-danger' role='alert'><strong>发表时间</strong>不能为空！</div></div>");
        checked = false;
    } else {
        $("span#paper_time_ErrorArea").html("");
    }

//	var bool_location0=true;
//	var bool_location1=true;
//	var bool_location2=true;
//	var locationAddText="";
//	var location=result.paper_location.split("$");
//	if($.trim(location[0])=="")
//	{
//		locationAddText+=" 期刊号";
//		checked=false;
//		bool_location0=false;
//	}
//	if($.trim(location[1])=="")
//	{
//		locationAddText+=" 卷期";
//		checked=false;
//		bool_location1=false;
//	}
//	if($.trim(location[2])=="")
//	{
//		locationAddText+=" 页码";
//		bool_location2=false;
//		checked=false;
//	}
//	if(bool_location0==false||bool_location1==false||bool_location2==false){
//	$("span#paper_location_ErrorArea").html("<div class='col-md-7 col-md-offset-1'><div class='alert alert-danger' role='alert'><strong>"+ locationAddText +"</strong>不能为空！</div></div>");
//	}else{
//		$("span#paper_location_ErrorArea").html("");
//	}
    if (result.paper_citations == null || $.trim(result.paper_citations) == "") {
        $("span#paper_citations_ErrorArea").html("<div class='col-md-7 col-md-offset-1'><div class='alert alert-danger' role='alert'><strong>web of science 总引</strong>不能为空！</div></div>");
        checked = false;
    } else {
        $("span#paper_citations_ErrorArea").html("");
    }
    if (result.paper_citations_others == null || $.trim(result.paper_citations_others) == "") {
        $("span#paper_citations_others_ErrorArea").html("<div class='col-md-7 col-md-offset-1'><div class='alert alert-danger' role='alert'><strong>web of science 他引</strong>不能为空！</div></div>");
        checked = false;
    } else {
        $("span#paper_citations_others_ErrorArea").html("");
    }
    if (result.paper_citations_google == null || $.trim(result.paper_citations_google) == "") {
        $("span#paper_citations_google_ErrorArea").html("<div class='col-md-7 col-md-offset-1'><div class='alert alert-danger' role='alert'><strong>Google Scholar 引用</strong>不能为空！</div></div>");
        checked = false;
    } else {
        $("span#paper_citations_google_ErrorArea").html("");
    }
    // 作者清单检查
    for (var i in authorResult) {
        var addText = "";
        if (authorResult[i].author_name == null || $.trim(authorResult[i].author_name) == "") {
            if (addText == "") {
                addText += "<div class='row'><div class='col-md-12'><div class='alert alert-danger' role='alert'>排名第" + authorResult[i].author_rank + "名的";
            }
            addText += "<strong>作者姓名</strong>不能为空!";
            checked = false;
        }
        if (authorResult[i].author_type != "outSchool" && (authorResult[i].author_no == null || $.trim(authorResult[i].author_no) == "")) {
            if (addText == "") {
                addText += "<div class='row'><div class='col-md-12'><div class='alert alert-danger' role='alert'>排名第" + authorResult[i].author_rank + "名的";
            }
            addText += "<strong>工号/学号</strong>不能为空!";
            checked = false;
        }
        addText += "</div></div></div></td>";
        $("span#author_ErrorArea" + authorResult[i].author_rank).html(addText);
    }
    return checked;
}
/**
 * 获取指定的URL参数值 URL:http://www.quwan.com/index?name=tyler 参数：paramName URL参数
 * 调用方法:getParam("name") 返回值:tyler
 */
function getParam(paramName) {
    paramValue = "", isFound = !1;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
        while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
    }
    return paramValue == "" && (paramValue = null), paramValue
}
function backFunction() {
    window.location.href = "../teacher/backFunction.do";
}
$(document)
    .ready(
        function () {
            var paperproxy_id = $("input#paperproxy_id").val();
            var commited_paper_id = $("input#commited_paper_id").val();
            var user_flag = $("input#user_flag").val();
            var currentPage = $("input#currentPage").val();
            var column = $("input#column").val();
            var order = $("input#order").val();
            var teacher_no = $("input#teacher_no").val();
            shoWPaperProxy(paperproxy_id);
            $("button#paperproxy_confirm").click(
                function () {
                    if (checkAllWithoutNull()) {
                        window.location.href = "../paper_proxy/upload.do?teacher_no="+teacher_no + "&paperproxy_id=" + paperproxy_id;
                    }
                });
            $("button#paperproxy_modify").click(
                function () {
                    window.location.href = "../paper_proxy/modify.do?commited_paper_id=" + commited_paper_id + "&paperproxy_id=" + paperproxy_id;
                });
            $("button#backFunction").click(
                function backFunction() {
                    window.location.href = "../teacher/backFunction.do";
                });
            //$("button#paperproxy_upload").click(
            //    function () {
            //      //  window.location.href = "../paper_proxy/modify.do?commited_paper_id=" + commited_paper_id + "&paperproxy_id=" + paperproxy_id;
            //        alert("123");
            //    });
            //  $("button#paperproxy_upload").click(
            //      function () {
            //     alert("123");
            //   if (checkAllWithoutNull()) {
            //    window.location.href = "../paper_proxy/view/upload.do?teacher_no=2" + "&paperproxy_id=" + paperproxy_id;
            /*
             htmlAjax = $
             .ajax({
             url : "../paper_proxy/submit.do",
             type : 'POST',
             data : {
             // paper_id : result.paper_id,
             commited_paper_id : commited_paper_id,
             paper_id:result.paper_id
             },
             datatype : "json",
             success : function(data, stats) {
             if (stats == "success") {
             if(data!=null){
             if(commited_paper_id ==0)
             alert("论文录入成功！");
             if(commited_paper_id !=0)
             alert("论文修改成功！");
             $("button#paperproxy_confirm").attr("disabled","true");
             // 跳转到我的成果页面
             if(user_flag == 1)
             window.location.href="../teacher/findPaper.do?isCommited=true";
             if(user_flag == 0)
             window.location.href="../findAllPaper.do?currentPage="+currentPage+"&column="+column+"&order="+order;
             // var addText="<br>上传原文<br>";
             // addText+="<progress id='progressBar' value='0' max='100'> </progress><span
             // id='percentage'></span><br /><input type='file' id='file'
             // onclick='resetProgressBar()' name='myfile' />";
             // addText+="<br><input type='button' onclick='UpladFile("+data+")' value='立刻上传'
             // /><button onclick='' >暂不上传</button>";
             // $("span#showUploadArea").html(addText);
             }
             }
             },
             error : function(data) {
             alert("论文录入失败！");
             }
             });
             */
            //  }

            //   });
        });