$(document)
    .ready(
        function () {
            $(".update-paper-status")
                .click(
                    function () {
                        var paper_status = $(".paper_status")
                            .val();
                        if (paper_status == 0) {
                            $(".paper-status-text").text("已发表");
                            $(".paper_status").val(1);
//											$("[name=update_ZKY]").val(1);
//											$("[name=update_JCR]").val(1);
//											$("[name=update_CCF]").val(1);
                            $(".location-area").css("display",
                                "block");
                            $(
                                ".dl-horizontal.text-overflow.acc-num")
                                .css("display", "block");

                        } else {
                            $(".paper-status-text").text("未发表");
                            $(".paper_status").val(0);
//											$("[name=update_ZKY]").val(0);
//											$("[name=update_JCR]").val(0);
//											$("[name=update_CCF]").val(0);
                            $(".location-area").css("display",
                                "none");
                            $(
                                ".dl-horizontal.text-overflow.acc-num")
                                .css("display", "none");
                        }
                    });
            $(".confirm-button")
                .click(
                    function () {
                        var paper_status = $(".paper_status")
                            .val();
                        if (paper_status == 0) {
                            alert("您还未修改任何信息，请修改后再提交！");
                            return false;
                        } else {
                            var paper_id = $("[name=paper_id]")
                                .val();
                            var paper_accNum = $(
                                "[name=paper_accNum]")
                                .val();
                            if (paper_accNum == "") {
                                alert("请填写检索编号！");
                                return false;
                            }
                            var paper_time = $("[name=paper_time]").val();
                            if (paper_time == "") {
                                alert("请填写发表时间！");
                                return false;
                            }

                            var confirm_update_status = false;
                            var paper_issue = $("[name=paper_issue]").val();
                            if (paper_issue == 0) {
//											var paper_location_issuing = $(
//													"[name=paper_location_issuing]")
//													.val();
                                var paper_location_volume = $(
                                    "[name=paper_location_volume]")
                                    .val();
                                var paper_location_pagination = $(
                                    "[name=paper_location_pagination]")
                                    .val();
                                if (
                                    paper_location_volume == ""
                                    || paper_location_pagination == "") {
                                    confirm_update_status = true;
                                }
                                var paper_location = paper_location_volume
                                    + '$'
                                    + paper_location_pagination;
                                var data = {
                                    paper_id: paper_id,
                                    paper_status: 1,
                                    paper_accNum: paper_accNum,
                                    paper_time: paper_time,
                                    paper_location: paper_location,
//													paper_location_JCR : paper_location_JCR,
//													paper_location_CCF : paper_location_CCF
                                };

                            }
                            if (paper_issue == 1) {
                                var meeting_page = $(
                                    "[name=meeting_page]")
                                    .val();
                                if (meeting_page == "") {
                                    confirm_update_status = true;
                                }
                                var paper_location = meeting_page
//													+ '&'
//													+ meeting_place

                            }
                            var data = {
                                paper_id: paper_id,
                                paper_status: 1,
                                paper_accNum: paper_accNum,
                                paper_time: paper_time,
                                paper_location: paper_location,
//												paper_location_JCR : paper_location_JCR,
//												paper_location_CCF : paper_location_CCF
                            };
                        }

                        if (confirm_update_status) {
                            if (confirm('还有相应的信息未填写，提交后将无法修改信息，是否确认修改？'))
                                updatePaper(data);
                        } else {
                            updatePaper(data);
                        }

                    });
            var updatePaper = function (data) {

                $.ajax({
                    url: "teacher/updatePaperById.do",
                    type: 'GET',
                    data: data,
                    datatype: "json",
                    success: function (result) {
                        if (result == "success") {
                            alert("修改论文成功！")
                            history.go(0);
                            window.location.href = "teacher/modifyPaper.do?paper_id="
                                + paper_id + "&teacher_no=" + teacher_no;
                        }
                        if (result == "error") {
                            alert("修改论文失败，请重新尝试！");
                        }
                    },
                    error: function (data) {
                        alert("请求失败");
                    }
                });

            }


        })


function selectType() {
    var dowloadType = document.getElementById('dowloadType');
//	var dowloadTypeValue = dowloadType.value;//这里获取value
    var paper_id = $("[name=paper_id]").val();
    var teacher_no = $("[name=teacher_no]").val();
    if (dowloadType.value != 0) {
        var a = document.getElementsByTagName("a");
        for (var i = 0; i < a.length; i++) a[a.length - 1].href = "teacher/download.do?paper_id=" + paper_id + "&fileType=" + dowloadType.value;
    }
    if (dowloadType.value == 0) {
        var a = document.getElementsByTagName("a");
        for (var i = 0; i < a.length; i++) a[a.length - 1].href = "";
    }

}
//function dowload()
//{
//	alert("434");
//	var dowloadType = document.getElementById('dowloadType');
//	if(dowloadType.value=0)
//		alert("请选择！");
//
//}
