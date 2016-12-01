$(document)
    .ready(
        function () {
            var teacher_no = $("input#teacher_no").val();
            var paperproxy_id = $("input#paperproxy_id").val();
            var htmlobj = $
                .ajax({
                    url: "../paper_proxy/file/getFile.do",
                    type: 'POST',
                    data: {
                        paperproxy_id: paperproxy_id,
                        teacher_no: teacher_no
                    },
                    datatype: "json",
                    success: function (data, stats) {
                        if (stats == "success") {
                            result = JSON.parse(htmlobj.responseText);
                            var flag2 = 0;
                            for (var i in result) {
                                if (result[i].file_type == 5)
                                    flag2 = 1;
                            }
                            if (flag2 == 0) {
                                for (var i in result) {
                                    if (result[i].file_type == 1) {
                                        var f1 = document.getElementById("f1");
                                        var text1 = document.getElementById("text1");
                                        var textok1 = document.getElementById("textok1");
                                        f1.setAttribute("class", "alert alert-success");
                                        text1.setAttribute("class", "text-success");
                                        textok1.setAttribute("class", "glyphicon glyphicon-ok-sign");
                                        var h1 = document.getElementById("h1");
                                        var h2 = document.getElementById("h2");
                                        var h3 = document.getElementById("h3");
                                        var h4 = document.getElementById("h4");
                                        var next = document.getElementById("paperproxy_submit");
                                        h1.setAttribute("value", "1");
                                        if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
                                            next.removeAttribute("disabled");
                                        }
                                    }
                                    else if (result[i].file_type == 2) {
                                        var f2 = document.getElementById("f2");
                                        var text2 = document.getElementById("text2");
                                        var textok2 = document.getElementById("textok2");
                                        f2.setAttribute("class", "alert alert-success");
                                        text2.setAttribute("class", "text-success");
                                        textok2.setAttribute("class", "glyphicon glyphicon-ok-sign");
                                        var h1 = document.getElementById("h1");
                                        var h2 = document.getElementById("h2");
                                        var h3 = document.getElementById("h3");
                                        var h4 = document.getElementById("h4");
                                        var next = document.getElementById("paperproxy_submit");
                                        h2.setAttribute("value", "1");
                                        if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
                                            next.removeAttribute("disabled");
                                        }
                                    }
                                    else if (result[i].file_type == 3) {
                                        var f3 = document.getElementById("f3");
                                        var text3 = document.getElementById("text3");
                                        var textok3 = document.getElementById("textok3");
                                        f3.setAttribute("class", "alert alert-success");
                                        text3.setAttribute("class", "text-success");
                                        textok3.setAttribute("class", "glyphicon glyphicon-ok-sign");
                                        var h1 = document.getElementById("h1");
                                        var h2 = document.getElementById("h2");
                                        var h3 = document.getElementById("h3");
                                        var h4 = document.getElementById("h4");
                                        var next = document.getElementById("paperproxy_submit");
                                        h3.setAttribute("value", "1");
                                        if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
                                            next.removeAttribute("disabled");
                                        }
                                    }
                                    else if (result[i].file_type == 4) {
                                        var f4 = document.getElementById("f4");
                                        var text4 = document.getElementById("text4");
                                        var textok4 = document.getElementById("textok4");
                                        f4.setAttribute("class", "alert alert-success");
                                        text4.setAttribute("class", "text-success");
                                        textok4.setAttribute("class", "glyphicon glyphicon-ok-sign");
                                        var h1 = document.getElementById("h1");
                                        var h2 = document.getElementById("h2");
                                        var h3 = document.getElementById("h3");
                                        var h4 = document.getElementById("h4");
                                        var next = document.getElementById("paperproxy_submit");
                                        h4.setAttribute("value", "1");
                                        if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
                                            next.removeAttribute("disabled");
                                        }
                                    }
                                }
                            }
                            else if (flag2 == 1) {
                                var incountry = document.getElementById("incountry");
                                var outcountry = document.getElementById("outcountry");
                                incountry.removeAttribute("checked");
                                outcountry.setAttribute("checked", "true");
                                for (var i in result) {
                                    if (result[i].file_type == 2) {
                                        var f5 = document.getElementById("f5");
                                        var text5 = document.getElementById("text5");
                                        var textok5 = document.getElementById("textok5");
                                        f5.setAttribute("class", "alert alert-success");
                                        text5.setAttribute("class", "text-success");
                                        textok5.setAttribute("class", "glyphicon glyphicon-ok-sign");
                                        var h5 = document.getElementById("h5");
                                        var h6 = document.getElementById("h6");
                                        var next = document.getElementById("paperproxy_submit");
                                        h5.setAttribute("value", "1");
                                        if (h5.value == "1" && h6.value == "1") {
                                            next.removeAttribute("disabled");
                                        }
                                    }
                                    else if (result[i].file_type == 5) {
                                        var listarea1 = document.getElementById("china");
                                        var listarea2 = document.getElementById("us");
                                        var filearea1 = document.getElementById("china2");
                                        var filearea2 = document.getElementById("us2");
                                        listarea1.setAttribute("class", "col-md-12 hidden");
                                        listarea2.setAttribute("class", "col-md-12");
                                        filearea1.setAttribute("class", "col-md-12 hidden");
                                        filearea2.setAttribute("class", "col-md-12");
                                        var f6 = document.getElementById("f6");
                                        var text6 = document.getElementById("text6");
                                        var textok6 = document.getElementById("textok6");
                                        f6.setAttribute("class", "alert alert-success");
                                        text6.setAttribute("class", "text-success");
                                        textok6.setAttribute("class", "glyphicon glyphicon-ok-sign");
                                        var h5 = document.getElementById("h5");
                                        var h6 = document.getElementById("h6");
                                        var next = document.getElementById("paperproxy_submit");
                                        h6.setAttribute("value", "1");
                                        if (h5.value == "1" && h6.value == "1") {
                                            next.removeAttribute("disabled");
                                        }
                                    }
                                }
                            }
                        }
                    },
                    error: function (data) {
                        alert("请求失败");
                    }
                });
            $("button#paperproxy_show").click(
                function () {
                    window.location.href = "../paper_proxy/show.do?paperproxy_id=" + paperproxy_id;
                });
            $("button#paperproxy_submit").click(
                function () {
                    var htmlobj = $
                        .ajax({
                            url: "../paper_proxy/submit.do",
                            type: 'POST',
                            data: {
                                paperproxy_id: paperproxy_id
                            },
                            datatype: "json",
                            success: function (data, stats) {
                                if (stats == "success") {
                                    var result = JSON.parse(htmlobj.responseText);
                                    alert(result);
                                }
                            },
                            error: function (data) {
                                alert("请求失败");
                            }
                        });
                });
        }
    )
function changefile() {
    var radioflag = $("input[name='paper_type']:checked").val();
    var listarea1 = document.getElementById("china");
    var listarea2 = document.getElementById("us");
    var filearea1 = document.getElementById("china2");
    var filearea2 = document.getElementById("us2");
    var h1 = document.getElementById("h1");
    var h2 = document.getElementById("h2");
    var h3 = document.getElementById("h3");
    var h4 = document.getElementById("h4");
    var h5 = document.getElementById("h5");
    var h6 = document.getElementById("h6");
    var next = document.getElementById("paperproxy_submit");

    if (radioflag == 1) {//国外
        next.setAttribute("disabled", "true");
        listarea1.setAttribute("class", "col-md-12 hidden");
        listarea2.setAttribute("class", "col-md-12");
        filearea1.setAttribute("class", "col-md-12 hidden");
        filearea2.setAttribute("class", "col-md-12");
        if (h5.value == "1" && h6.value == "1") {
            next.removeAttribute("disabled");
        }
    }
    if (radioflag == 0) {//国内
        next.setAttribute("disabled", "true");
        listarea2.setAttribute("class", "col-md-12 hidden");
        listarea1.setAttribute("class", "col-md-12");
        filearea2.setAttribute("class", "col-md-12 hidden");
        filearea1.setAttribute("class", "col-md-12");
        if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
            next.removeAttribute("disabled");
        }
    }
}

//文件1
$("#file-1").fileinput({
    language: 'zh',
    uploadUrl: '../paper_proxy/file/upload.do?fileType=1&paperproxy_id=' + $("input#paperproxy_id").val() + "&teacher_no=" + $("input#teacher_no").val(),
    allowedFileExtensions: ['pdf', 'doc', 'docx'],
    overwriteInitial: false,
    maxFileSize: 1000,
    maxFilesNum: 1,
    slugCallback: function (filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
$("#file-1").on("fileuploaded", function (event, data, previewId, index) {
    var f1 = document.getElementById("f1");
    var text1 = document.getElementById("text1");
    var textok1 = document.getElementById("textok1");
    f1.setAttribute("class", "alert alert-success");
    text1.setAttribute("class", "text-success");
    textok1.setAttribute("class", "glyphicon glyphicon-ok-sign");
    var h1 = document.getElementById("h1");
    var h2 = document.getElementById("h2");
    var h3 = document.getElementById("h3");
    var h4 = document.getElementById("h4");
    var next = document.getElementById("paperproxy_submit");
    h1.setAttribute("value", "1");
    if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
        next.removeAttribute("disabled");
    }
});
function clickf2() {
    var p1 = document.getElementById("p1");
    var p2 = document.getElementById("p2");
    p2.setAttribute("class", "active");
    p1.removeAttribute("class");
}

//文件2
$("#file-2").fileinput({
    language: 'zh',
    uploadUrl: '../paper_proxy/file/upload.do?fileType=2&paperproxy_id=' + $("input#paperproxy_id").val() + "&teacher_no=" + $("input#teacher_no").val(),
    allowedFileExtensions: ['pdf', 'doc', 'docx'],
    overwriteInitial: false,
    maxFileSize: 1000,
    maxFilesNum: 1,
    slugCallback: function (filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
$("#file-2").on("fileuploaded", function (event, data, previewId, index) {
    var f2 = document.getElementById("f2");
    var text2 = document.getElementById("text2");
    var textok2 = document.getElementById("textok2");
    f2.setAttribute("class", "alert alert-success");
    text2.setAttribute("class", "text-success");
    textok2.setAttribute("class", "glyphicon glyphicon-ok-sign");
    var h1 = document.getElementById("h1");
    var h2 = document.getElementById("h2");
    var h3 = document.getElementById("h3");
    var h4 = document.getElementById("h4");
    var next = document.getElementById("paperproxy_submit");
    h2.setAttribute("value", "1");
    if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
        next.removeAttribute("disabled");
    }
});
function clickf3() {
    var p2 = document.getElementById("p2");
    var p3 = document.getElementById("p3");
    p3.setAttribute("class", "active");
    p2.removeAttribute("class");
}

//文件3
$("#file-3").fileinput({
    language: 'zh',
    uploadUrl: '../paper_proxy/file/upload.do?fileType=3&paperproxy_id=' + $("input#paperproxy_id").val() + "&teacher_no=" + $("input#teacher_no").val(),
    allowedFileExtensions: ['pdf', 'doc', 'docx'],
    overwriteInitial: false,
    maxFileSize: 1000,
    maxFilesNum: 1,
    slugCallback: function (filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
$("#file-3").on("fileuploaded", function (event, data, previewId, index) {
    var f3 = document.getElementById("f3");
    var text3 = document.getElementById("text3");
    var textok3 = document.getElementById("textok3");
    f3.setAttribute("class", "alert alert-success");
    text3.setAttribute("class", "text-success");
    textok3.setAttribute("class", "glyphicon glyphicon-ok-sign");
    var h1 = document.getElementById("h1");
    var h2 = document.getElementById("h2");
    var h3 = document.getElementById("h3");
    var h4 = document.getElementById("h4");
    var next = document.getElementById("paperproxy_submit");
    h3.setAttribute("value", "1");
    if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
        next.removeAttribute("disabled");
    }
});
function clickf4() {
    var p3 = document.getElementById("p3");
    var p4 = document.getElementById("p4");
    p4.setAttribute("class", "active");
    p3.removeAttribute("class");
}

//文件4
$("#file-4").fileinput({
    language: 'zh',
    uploadUrl: '../paper_proxy/file/upload.do?fileType=4&paperproxy_id=' + $("input#paperproxy_id").val() + "&teacher_no=" + $("input#teacher_no").val(),
    allowedFileExtensions: ['pdf', 'doc', 'docx'],
    overwriteInitial: false,
    maxFileSize: 1000,
    maxFilesNum: 1,
    slugCallback: function (filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
$("#file-4").on("fileuploaded", function (event, data, previewId, index) {
    var f4 = document.getElementById("f4");
    var text4 = document.getElementById("text4");
    var textok4 = document.getElementById("textok4");
    f4.setAttribute("class", "alert alert-success");
    text4.setAttribute("class", "text-success");
    textok4.setAttribute("class", "glyphicon glyphicon-ok-sign");
    var h1 = document.getElementById("h1");
    var h2 = document.getElementById("h2");
    var h3 = document.getElementById("h3");
    var h4 = document.getElementById("h4");
    var next = document.getElementById("paperproxy_submit");
    h4.setAttribute("value", "1");
    if (h1.value == "1" && h2.value == "1" && h3.value == "1" && h4.value == "1") {
        next.removeAttribute("disabled");
    }

});

//文件5
$("#file-5").fileinput({
    language: 'zh',
    uploadUrl: '../paper_proxy/file/upload.do?fileType=2&paperproxy_id=' + $("input#paperproxy_id").val() + "&teacher_no=" + $("input#teacher_no").val(),
    allowedFileExtensions: ['pdf', 'doc', 'docx'],
    overwriteInitial: false,
    maxFileSize: 1000,
    maxFilesNum: 1,
    slugCallback: function (filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
$("#file-5").on("fileuploaded", function (event, data, previewId, index) {
    var f5 = document.getElementById("f5");
    var text5 = document.getElementById("text5");
    var textok5 = document.getElementById("textok5");
    f5.setAttribute("class", "alert alert-success");
    text5.setAttribute("class", "text-success");
    textok5.setAttribute("class", "glyphicon glyphicon-ok-sign");
    var h5 = document.getElementById("h5");
    var h6 = document.getElementById("h6");
    var next = document.getElementById("paperproxy_submit");
    h5.setAttribute("value", "1");
    if (h5.value == "1" && h6.value == "1") {
        next.removeAttribute("disabled");
    }
});
function clickf5() {
    var p5 = document.getElementById("p5");
    var p6 = document.getElementById("p6");
    p6.setAttribute("class", "active");
    p5.removeAttribute("class");
}

$("#file-6").fileinput({
    language: 'zh',
    uploadUrl: '../paper_proxy/file/upload.do?fileType=5&paperproxy_id=' + $("input#paperproxy_id").val() + "&teacher_no=" + $("input#teacher_no").val(), // you must set a valid URL here else you will get an error
    allowedFileExtensions: ['pdf', 'doc', 'docx'],
    overwriteInitial: false,
    maxFileSize: 1000,
    maxFilesNum: 1,
    slugCallback: function (filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
$("#file-6").on("fileuploaded", function (event, data, previewId, index) {
    var f6 = document.getElementById("f6");
    var text6 = document.getElementById("text6");
    var textok6 = document.getElementById("textok6");
    f6.setAttribute("class", "alert alert-success");
    text6.setAttribute("class", "text-success");
    textok6.setAttribute("class", "glyphicon glyphicon-ok-sign");
    var h5 = document.getElementById("h5");
    var h6 = document.getElementById("h6");
    var next = document.getElementById("paperproxy_submit");
    h6.setAttribute("value", "1");
    if (h5.value == "1" && h6.value == "1") {
        next.removeAttribute("disabled");
    }
});