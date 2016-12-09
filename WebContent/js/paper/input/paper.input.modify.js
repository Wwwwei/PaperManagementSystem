var resultList;// 期刊和晦气下拉框,ajax结果,json格式
var authors = [];// 作者列表数组（全局变量）
var RANK = 0;// 作者排名改变前的值（全局变量）
var authorsID = [];// 作者列表id数组（全局变量）
// 作者列表中类型为外校,则隐藏工号/学号输入框
function showAuthorIDByAuthorType(type, authorRank) {
    if (type == 2) {
        $("input#AuthorID" + authorRank).val("")
        $("input#AuthorOffice" + authorRank).val("");
        $("input#AuthorID" + authorRank).attr("disabled", true);
        $("input#AuthorOffice" + authorRank).attr("disabled", true);
    } else {
        $("input#AuthorID" + authorRank).attr("disabled", false);
        $("input#AuthorOffice" + authorRank).attr("disabled", false);
    }
}
// 作者上移下移操作 upORdown=0,上移;upORdown=1，下移
function authorMove(upORdown, index) {
    if (upORdown == "0") {
        authorSwap(index, index - 1);
    } else {
        authorSwap(index, index + 1);
    }
}
// 作者交换操作
function authorSwap(index_dst, index_src) {
    var rank = $("input#paper_rank").val();
    var authorNumber = $("input#paper_authorNum").val();
    if (index_src == rank) {
        if (index_dst < index_src) {
            index_src++;
        } else {
            index_src--;
        }
    }
    if (index_src > authorNumber || index_src <= 0) {
        return;
    }
    authorsRead();
    var index_dst_author = 0;
    var index_src_author = 0;
    for (var i = 0; i < authors.length; i++) {
        if (authors[i].rank == index_src) {
            index_src_author = i;
        } else if (authors[i].rank == index_dst) {
            index_dst_author = i;
        }
    }
    authors[index_dst_author].rank = index_src;
    authors[index_src_author].rank = index_dst;
    showAuthorList(authorNumber);
    authorsWrite();
}
// 作者列表读入
function authorsRead() {
    var authorNumber = $("input#paper_authorNum").val();
    var rank = $("input#paper_rank").val();
    for (var i = 0; i < authorNumber; i++) {
        var author = new Object();
        var authorRank = (i + 1) + "";
        author.rank = authorRank;
        if (authorRank == rank) {
            var author_temp = new Object();
            author.name = $("input#teacher_name").val();
            author.office = $("input#teacher_office").val();
            author.id = $("input#teacher_no").val();
            author.type = 1;
            author_temp.rank = RANK;
            author_temp.authorId = null;
            author_temp.name = $("input#AuthorName" + authorRank).val();
            author_temp.id = $("input#AuthorID" + authorRank).val();
            author_temp.office = $("input#AuthorOffice" + authorRank).val();
            author_temp.type = $("input#authorType" + authorRank + ":checked")
                .val();
            authors.push(author_temp);
        } else {
            author.name = $("input#AuthorName" + authorRank).val();
            author.id = $("input#AuthorID" + authorRank).val();
            author.office = $("input#AuthorOffice" + authorRank).val();
            author.type = $("input#authorType" + authorRank + ":checked").val();
        }
        if (!(authorRank == RANK)) {
            authors.push(author);
        }
    }
}

// 作者列表写入
function authorsWrite() {
    var authorsID_index = 0; // authorsID数组索引
    while (authors.length > 0) {
        var author = authors.shift();
        var authorRank = author.rank;
        if (authorsID.length > authorsID_index) {
            $("input#author_id" + authorRank).val(authorsID[authorsID_index]);
            authorsID_index++;
        }
        $("input#AuthorName" + authorRank).val(author.name);
        $("input#AuthorID" + authorRank).val(author.id);
        $("input#AuthorOffice" + authorRank).val(author.office);
        if (author.type == 4) {
            $("input#authorType" + authorRank + "[value='4']").attr("checked",
                true);
            $("input#AuthorID" + authorRank).attr("disabled", false);
            $("input#AuthorOffice" + authorRank).attr("disabled", false);

        } else if (author.type == 3) {
            $("input#authorType" + authorRank + "[value='3']").attr("checked",
                true);
            $("input#AuthorID" + authorRank).attr("disabled", false);
            $("input#AuthorOffice" + authorRank).attr("disabled", false);

        } else if (author.type == 2) {
            $("input#authorType" + authorRank + "[value='2']").attr("checked",
                true);
            $("input#AuthorID" + authorRank).val("");
            $("input#AuthorOffice" + authorRank).val("");
            $("input#AuthorID" + authorRank).attr("disabled", true);
            $("input#AuthorOffice" + authorRank).attr("disabled", true);
        } else if (author.type == 1) {
            $("input#authorType" + authorRank + "[value=1]").attr("checked",
                true);
            $("input#AuthorID" + authorRank).attr("disabled", false);
            $("input#AuthorOffice" + authorRank).attr("disabled", false);
        }
    }
}
// 显示作者表
function showAuthorList(authorNumber) {
    var rank = $("input#paper_rank").val();
    var addTest = "";
    // 判断是否是数字,若为数字则显示作者表单，否则提示
    if (isNaN(authorNumber) == false) {
        var addText = "<div class='table-responsive'><table width='100%' class='table table-hover'><thead><tr><th>作者排名</th><th>作者姓名</th><th>作者类型</th><th>工号/学号</th><th>作者单位</th></tr></thead>";
        for (var i = 0; i < authorNumber; i++) {
            // 作者排名
            var authorRank = (i + 1);
            // 作者id
            var author_id = "<input type='hidden' name='author_id" + authorRank
                + "' id='author_id" + authorRank + "'>";
            // 作者名称
            var authorName = "<input type='text' name='authorName" + authorRank
                + "' id='AuthorName" + authorRank
                + "' class='form-control'>";
            // 作者类型(1:本校教师 2:外校教师 3:研究生 4:本科生)
            var authorType1 = "<label class='radio-inline'><input type='radio' name='authorType"
                + authorRank
                + "' id='authorType"
                + authorRank
                + "' value='1' checked='checked' onclick='showAuthorIDByAuthorType(1,"
                + authorRank + ");' />本校</label>";
            var authorType2 = "<label class='radio-inline' style='margin-top:5px'><input type='radio' name='authorType"
                + authorRank
                + "'  id='authorType"
                + authorRank
                + "' value='2' onclick='showAuthorIDByAuthorType(2,"
                + authorRank + ");' />外校</label>";
            var authorType3 = "<label class='radio-inline' style='margin-top:5px'><input type='radio' name='authorType"
                + authorRank
                + "'  id='authorType"
                + authorRank
                + "' value='3' onclick='showAuthorIDByAuthorType(3,"
                + authorRank + ");' />研究生</label>";
            var authorType4 = "<label class='radio-inline' style='margin-top:5px'><input type='radio' name='authorType"
                + authorRank
                + "'  id='authorType"
                + authorRank
                + "' value='4' onclick='showAuthorIDByAuthorType(4,"
                + authorRank + ");' />本科生</label>";
            // 作者工号/学号（外校类型不填）
            var authorID = "<input type='text' name='authorID" + authorRank
                + "' id='AuthorID" + authorRank + "' class='form-control'>";
            // 办公地点
            var authorOffice = "<input type='text' name='authorOffice"
                + authorRank + "' id='AuthorOffice" + authorRank
                + "' class='form-control'>";
            // 上移和下移操作
            // 排名为我的排名的作者无法上移和下移
            if (authorRank == rank) {
                var authorMoveButton = " ";
                // 排名为1的作者无法上移
            } else if (authorRank == 1) {
                var authorMoveButton = "<div class='btn-group'><button type='button' class='btn btn-info' onclick='authorMove(1,"
                    + authorRank
                    + ");'><span class='glyphicon glyphicon-arrow-down'></span></button></div>";
                // 排名为最后的作者无法下移
            } else if (authorRank == authorNumber) {
                var authorMoveButton = "<div class='btn-group'><button type='button' class='btn btn-info' onclick='authorMove(0,"
                    + authorRank
                    + " );'><span class='glyphicon glyphicon-arrow-up'></button></div>";
            } else {
                var authorMoveButton = "<div class='btn-group'><button  type='button' class='btn btn-info' onclick='authorMove(0,"
                    + authorRank
                    + " );'><span class='glyphicon glyphicon-arrow-up'></button><button type='button' class='btn btn-info' onclick='authorMove(1,"
                    + authorRank
                    + ");'><span class='glyphicon glyphicon-arrow-down'></button></div>";
            }
            addText = addText + author_id + "<tr><td>" + authorRank
                + "</td><td>" + authorName + "</td><td>" + authorType1
                + authorType2 + authorType3 + authorType4 + "</td><td>"
                + authorID + "</td><td>" + authorOffice + "</td><td>"
                + authorMoveButton + "</td></tr>";
        }
        addText = addText + "</table></div>";
        $("span#AuthorArea").html(addText);

    } else {
        alert("请输入数字！");
    }
}
// 显示作者表清单
function showAuthorInputList(paperproxy_id) {
    htmlobj = $.ajax({
        url: "../author_proxy/show.do",
        type: 'POST',
        data: {
            paperproxy_id: paperproxy_id
        },
        datatype: "json",
        success: function (data, stats) {
            if (stats == "success") {
                authorResult = JSON.parse(htmlobj.responseText);
                for (var i in authorResult) {
                    $("input#author_id" + authorResult[i].author_rank).val(
                        authorResult[i].author_id);
                    authorsID.push(authorResult[i].author_id);
                    $("input#AuthorName" + authorResult[i].author_rank).val(
                        authorResult[i].author_name);
                    switch (authorResult[i].author_type) {
                        case 1:
                            $("input#AuthorID" + authorResult[i].author_rank).val(
                                authorResult[i].author_no);
                            $("input#AuthorOffice" + authorResult[i].author_rank)
                                .val(authorResult[i].author_office);
                            break;
                        case 2:
                            $(
                                "input#authorType"
                                + authorResult[i].author_rank
                                + "[value='2']").attr("checked", true);
                            $("input#AuthorID" + authorResult[i].author_rank).attr(
                                "disabled", true);
                            $("input#AuthorOffice" + authorResult[i].author_rank)
                                .attr("disabled", true);
                            break;
                        case 3:
                            $(
                                "input#authorType"
                                + authorResult[i].author_rank
                                + "[value='3']").attr("checked", true);
                            $("input#AuthorID" + authorResult[i].author_rank).val(
                                authorResult[i].author_no);
                            $("input#AuthorOffice" + authorResult[i].author_rank)
                                .val(authorResult[i].author_office);
                            break;
                        case 4:
                            $(
                                "input#authorType"
                                + authorResult[i].author_rank
                                + "[value='4']").attr("checked", true);
                            $("input#AuthorID" + authorResult[i].author_rank).val(
                                authorResult[i].author_no);
                            $("input#AuthorOffice" + authorResult[i].author_rank)
                                .val(authorResult[i].author_office);
                            break;
                    }
                }

            }
        },
        error: function (data) {
            alert("请求失败");
        }
    });
}

// 根据期刊和会议二级下拉框选择
function showSelect(flag) {
    htmlobj = $
        .ajax({
            url: "../journals_conference/findByFlag.do",
            type: 'POST',
            data: {
                flag: flag
            },
            datatype: "json",
            success: function (data, stats) {
                if (stats == "success") {
                    var addText = "";
                    $("span#journalsORconferenceZKYArea").html("");
                    $("span#journalsORconferenceJCRArea").html("");
                    $("span#journalsORconferenceCCFArea").html("");
                    result = JSON.parse(htmlobj.responseText);
                    resultList = JSON.parse(htmlobj.responseText);
                    if (flag == 0) {
                        var select_ZKY = "<option value ='-1'>无</option>";
                        var select_JCR = "<option value ='-1'>无</option>";
                        var select_CCF = "<option value ='-1'>无</option>";

                        for (var i in result) {
                            switch (result[i].journals_conference_type) {
                                case 1:
                                    select_ZKY += "<option value ='"
                                        + result[i].journals_conference_id
                                        + "'>"
                                        + result[i].journals_conference_name
                                        + "</option>";
                                    break;
                                case 2:
                                    select_JCR += "<option value ='"
                                        + result[i].journals_conference_id
                                        + "'>"
                                        + result[i].journals_conference_name
                                        + "</option>";
                                    break;
                                case 3:
                                    select_CCF += "<option value ='"
                                        + result[i].journals_conference_id
                                        + "'>"
                                        + result[i].journals_conference_name
                                        + "</option>";
                                    break;
                            }
                        }
                        select_ZKY += "</select>";
                        select_JCR += "</select>";
                        select_CCF += "</select>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label' style='font-size:12px'>中科院分区</label><div class='col-md-8'><select id='journalsORconferenceSelect_ZKY' class='form-control' name='paper_journals_conference_ZKY.journals_conference_id' onchange='showLocationAreaByJournals(1)'>"
                            + select_ZKY
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>JCR等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_JCR' class='form-control' name='paper_journals_conference_JCR.journals_conference_id' onchange='showLocationAreaByJournals(2)'>"
                            + select_JCR
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>CCF等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_CCF' class='form-control' name='paper_journals_conference_CCF.journals_conference_id' onchange='showLocationAreaByJournals(3)'>"
                            + select_CCF
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += "<label class='col-md-4 control-label'>其他</label><div class='col-md-8'> <input type='checkbox' id='journalsORconferenceSelect_OTHER' name='paper_journals_conference_other' value='0' onchange='checkJournalsORConferenceOther(0)'/> ";
                    } else {
                        var selectText = "<option value ='-1'>无</option>";
                        for (var i in result) {
                            selectText += "<option value ='"
                                + result[i].journals_conference_id
                                + "'>"
                                + result[i].journals_conference_name
                                + "</option>";
                        }
                        selectText += "</select>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>选择会议</label><div class='col-md-8'><select id='journalsORconferenceSelect_CCF' class='form-control' name='paper_journals_conference_CCF.journals_conference_id' onchange='showLocationAreaByConference()'>"
                            + selectText
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += " <label class='col-md-4 control-label'>其他</label><div class='col-md-8'> <input type='checkbox' id='journalsORconferenceSelect_OTHER' name='paper_journals_conference_isOther' value='0' onchange='checkJournalsORConferenceOther(1)'/> ";
                    }
                    $("span#journalsORconferenceArea").html(addText);
                }
            },
            error: function (data) {
                alert("请求失败");
            }
        });
}
// 根据期刊和会议二级下拉框选择
//function showSelectByFlag(paperproxy_id, flag, ZKY_id, JCR_id, CCF_id,
//                          ZKY_location, JCR_location, CCF_location, OTHER_check) {
function showSelectByFlag(paperproxy_id, flag, ZKY_id, JCR_id, CCF_id, ESI_id, OTHER_id, isZjut100, isOther, custom) {
    htmlobj = $
        .ajax({
            url: "../journals_conference/findByFlag.do",
            type: 'POST',
            data: {
                flag: flag
            },
            datatype: "json",
            success: function (data, stats) {
                if (stats == "success") {
                    var addText = "";
                    //$("span#journalsORconferenceZKYArea").html("");
                    //$("span#journalsORconferenceJCRArea").html("");
                    //$("span#journalsORconferenceCCFArea").html("");
                    resultList = JSON.parse(htmlobj.responseText);
                    if (0 == flag) {
                        //var ZKY_locations = ZKY_location.split("$");
                        //var JCR_locations = JCR_location.split("$");
                        //var CCF_locations = CCF_location.split("$");
                        //for (i = 0; i < 3; i++) {
                        //    if ('null' == ZKY_locations[i]) {
                        //        ZKY_locations[i] = '';
                        //    }
                        //}
                        //for (i = 0; i < 3; i++) {
                        //    if ('null' == JCR_locations[i]) {
                        //        JCR_locations[i] = '';
                        //    }
                        //}
                        //for (i = 0; i < 3; i++) {
                        //    if ('null' == CCF_locations[i]) {
                        //        CCF_locations[i] = '';
                        //    }
                        //}
                        var select_ZKY = "<option value ='-1'>无</option>";
                        var select_JCR = "<option value ='-1'>无</option>";
                        var select_CCF = "<option value ='-1'>无</option>";
                        var select_ESI = "<option value ='-1'>无</option>";
                        var select_OTHER = "<option value ='-1'>无</option>";
                        for (var i in resultList) {
                            var select_withoutCheck = "<option value ='"
                                + resultList[i].journals_conference_id
                                + "'>"
                                + resultList[i].journals_conference_name
                                + "</option>";
                            var select_withCheck = "<option value ='"
                                + resultList[i].journals_conference_id
                                + "' selected='true'>"
                                + resultList[i].journals_conference_name
                                + "</option>";
                            switch (resultList[i].journals_conference_type) {
                                case 1:
                                    if (ZKY_id == resultList[i].journals_conference_id) {
                                        select_ZKY += select_withCheck;
                                        //var addText_ZKY = "";
                                        //addText_ZKY += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_ZKY' value='"
                                        //    + ZKY_locations[0]
                                        //    + "' class='form-control'></div>";
                                        //addText_ZKY += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_ZKY' value='"
                                        //    + ZKY_locations[1]
                                        //    + "' class='form-control'></div>";
                                        //addText_ZKY += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_ZKY' value='"
                                        //    + ZKY_locations[2]
                                        //    + "' class='form-control'></div>";
                                        //$("span#journalsORconferenceZKYArea")
                                        //    .html(addText_ZKY);
                                    } else {
                                        select_ZKY += select_withoutCheck;
                                    }
                                    break;
                                case 2:
                                    if (JCR_id == resultList[i].journals_conference_id) {
                                        select_JCR += select_withCheck;
                                        //var addText_JCR = "";
                                        //addText_JCR += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_JCR' value='"
                                        //    + JCR_locations[0]
                                        //    + "' class='form-control'></div>";
                                        //addText_JCR += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_JCR' value='"
                                        //    + JCR_locations[1]
                                        //    + "' class='form-control'></div>";
                                        //addText_JCR += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_JCR' value='"
                                        //    + JCR_locations[2]
                                        //    + "' class='form-control'></div>";
                                        //$("span#journalsORconferenceJCRArea")
                                        //    .html(addText_JCR);
                                    } else {
                                        select_JCR += select_withoutCheck;
                                    }
                                    break;
                                case 3:
                                    if (CCF_id == resultList[i].journals_conference_id) {
                                        select_CCF += select_withCheck;
                                        //var addText_CCF = "";
                                        //addText_CCF += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_CCF' value='"
                                        //    + CCF_locations[0]
                                        //    + "' class='form-control'></div>";
                                        //addText_CCF += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_CCF' value='"
                                        //    + CCF_locations[1]
                                        //    + "' class='form-control'></div>";
                                        //addText_CCF += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_CCF' value='"
                                        //    + CCF_locations[2]
                                        //    + "' class='form-control'></div>";
                                        //$("span#journalsORconferenceCCFArea")
                                        //    .html(addText_CCF);
                                    } else {
                                        select_CCF += select_withoutCheck;
                                    }
                                    break;
                                case 4:
                                    if (ESI_id == resultList[i].journals_conference_id) {
                                        select_ESI += select_withCheck;
                                        //var addText_CCF = "";
                                        //addText_CCF += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_CCF' value='"
                                        //    + CCF_locations[0]
                                        //    + "' class='form-control'></div>";
                                        //addText_CCF += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_CCF' value='"
                                        //    + CCF_locations[1]
                                        //    + "' class='form-control'></div>";
                                        //addText_CCF += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_CCF' value='"
                                        //    + CCF_locations[2]
                                        //    + "' class='form-control'></div>";
                                        //$("span#journalsORconferenceCCFArea")
                                        //    .html(addText_CCF);
                                    } else {
                                        select_ESI += select_withoutCheck;
                                    }
                                    break;
                                case 5:
                                    if (OTHER_id == resultList[i].journals_conference_id) {
                                        select_OTHER += select_withCheck;
                                        //var addText_CCF = "";
                                        //addText_CCF += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_CCF' value='"
                                        //    + CCF_locations[0]
                                        //    + "' class='form-control'></div>";
                                        //addText_CCF += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_CCF' value='"
                                        //    + CCF_locations[1]
                                        //    + "' class='form-control'></div>";
                                        //addText_CCF += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_CCF' value='"
                                        //    + CCF_locations[2]
                                        //    + "' class='form-control'></div>";
                                        //$("span#journalsORconferenceCCFArea")
                                        //    .html(addText_CCF);
                                    } else {
                                        select_OTHER += select_withoutCheck;
                                    }
                                    break;
                            }
                        }
                        select_ZKY += "</select>";
                        select_JCR += "</select>";
                        select_CCF += "</select>";
                        select_ESI += "</select>";
                        select_OTHER += "</select>";
                        if (0 == isZjut100) {
                            addText += " <label class='col-md-3 control-label'>是否ZJUT100期刊论文</label><div class='col-md-3'> <input type='checkbox' id='paper_journals_conference_isZjut100' name='paper_journals_conference_isZjut100' value='1'/></div><div class='col-md-12'>&nbsp;</div>";
                        }
                        else {
                            addText += " <label class='col-md-3 control-label'>是否ZJUT100期刊论文</label><div class='col-md-3'> <input type='checkbox' id='paper_journals_conference_isZjut100' name='paper_journals_conference_isZjut100' value='1' checked='checked'/></div><div class='col-md-12'>&nbsp;</div>";
                        }
                        addText += "<div class='form-group'><label class='col-md-4 control-label' style='font-size:12px'>中科院分区</label><div class='col-md-8'><select id='journalsORconferenceSelect_ZKY' class='form-control' name='paper_journals_conference_ZKY.journals_conference_id'>"
                            + select_ZKY
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";

                        addText += "<div class='form-group'><label class='col-md-4 control-label'>JCR等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_JCR' class='form-control' name='paper_journals_conference_JCR.journals_conference_id'>"
                            + select_JCR
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>CCF等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_CCF' class='form-control' name='paper_journals_conference_CCF.journals_conference_id'>"
                            + select_CCF
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>ESI等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_ESI' class='form-control' name='paper_journals_conference_ESI.journals_conference_id'>"
                            + select_ESI
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>其他等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_OTHER' class='form-control' name='paper_journals_conference_OTHER.journals_conference_id'>"
                            + select_OTHER
                            + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        if (0 == isOther) {
                            addText += " <label class='col-md-4 control-label'>其他</label><div class='col-md-8'> <input type='checkbox' id='journalsORconferenceSelect_OTHER' name='paper_journals_conference_other' value='0' onchange='checkJournalsORConferenceOther(0)' checked='checked'/>";
                            $("input#paper_journals_conference_CUSTOM_input").val(custom);
                            $("div#paper_journals_conference_CUSTOM").removeAttr("hidden");
                        } else {
                            addText += " <label class='col-md-4 control-label'>其他</label><div class='col-md-8'> <input type='checkbox' id='journalsORconferenceSelect_OTHER' name='paper_journals_conference_other' value='0' onchange='checkJournalsORConferenceOther(0)'/> ";
                            $("input#paper_journals_conference_CUSTOM_input").val("");
                            $("div#paper_journals_conference_CUSTOM").attr("hidden",
                                "hidden");
                        }
                    } else {
                        var selectText = "<option value ='-1'>无</option>";
                        for (var i in resultList) {
                            if (CCF_id == resultList[i].journals_conference_id) {
                                selectText += "<option value ='"
                                    + resultList[i].journals_conference_id
                                    + "' selected='true'>"
                                    + resultList[i].journals_conference_name
                                    + "</option>";
                            } else {
                                selectText += "<option value ='"
                                    + resultList[i].journals_conference_id
                                    + "'>"
                                    + resultList[i].journals_conference_name
                                    + "</option>";
                            }
                        }
                        selectText += "</select>";

                        //var location = CCF_location.split("$");
                        //for (i = 0; i < 2; i++) {
                        //    if ('null' == location[i]) {
                        //        location[i] = '';
                        //    }
                        //}
                        //var area1 = document.getElementById("ZKYA");
                        //var area2 = document.getElementById("JCRA");
                        //area1.removeAttribute("style");
                        //area1.setAttribute("style", "height:0px");
                        //area2.removeAttribute("style");
                        //area2.setAttribute("style", "height:0px");
                        addText += "<div class='form-group'><label class='col-md-4 control-label'>CCF等级</label><div class='col-md-8'><select id='journalsORconferenceSelect_CCF' class='form-control' name='paper_journals_conference_CCF.journals_conference_id' >"
                            + selectText + "</div></div><div class='col-md-12'>&nbsp;</div>";
                        if (0 == isOther) {
                            addText += " <label class='col-md-4 control-label'>其他</label><div class='col-md-8'> <input type='checkbox' id='journalsORconferenceSelect_OTHER' name='paper_journals_conference_other' value='0' onchange='checkJournalsORConferenceOther(1)' checked='checked'/>";
                            $("input#paper_journals_conference_CUSTOM_input").val(custom);
                            $("div#paper_journals_conference_CUSTOM").removeAttr("hidden");
                        } else {
                            addText += " <label class='col-md-4 control-label'>其他</label><div class='col-md-8'> <input type='checkbox' id='journalsORconferenceSelect_OTHER' name='paper_journals_conference_other' value='0' onchange='checkJournalsORConferenceOther(1)'/> ";
                            $("input#paper_journals_conference_CUSTOM_input").val("");
                            $("div#paper_journals_conference_CUSTOM").attr("hidden",
                                "hidden");
                        }
                        //var addText_CCF = "";
                        //addText_CCF += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_CCF' value='"
                        //    + location[0]
                        //    + "' class='form-control'></div>";
                        //addText_CCF += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_CCF' value='"
                        //    + location[1]
                        //    + "' class='form-control'></div>";
                        //addText_CCF += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_CCF' value='"
                        //    + location[2]
                        //    + "' class='form-control'></div>";
                        //$("span#journalsORconferenceCCFArea").html(
                        //    addText_CCF);
                    }
                    $("span#journalsORconferenceArea").html(addText);
                    switch (flag) {
                        case 0:
                            checkJournalsORConferenceOther(0);
                            break;
                        case 1:
                            checkJournalsORConferenceOther(1);
                            break;
                    }
                    showAuthorInputList(paperproxy_id);
                }
            },
            error: function (data) {
                alert("请求失败");
            }
        });
}
// 期刊会议选中其他事件(若为期刊,选中则将所有下拉框选项置为无并只读且不出现论文位置信息，不选中则恢复正常态;若为会议,选中则将下拉框选项置为无并只读且不出现论文位置信息，不选中恢复正常态)
function checkJournalsORConferenceOther(type) {
    var other = $("input#journalsORconferenceSelect_OTHER");
    if (other.prop("checked")) {
        $("div#paper_journals_conference_CUSTOM").removeAttr("hidden");
        switch (type) {
            case 0:
                $("select#journalsORconferenceSelect_ZKY").val(-1);
                $("select#journalsORconferenceSelect_JCR").val(-1);
                $("select#journalsORconferenceSelect_CCF").val(-1);
                $("select#journalsORconferenceSelect_ESI").val(-1);
                $("select#journalsORconferenceSelect_OTHER").val(-1);
                $("select#journalsORconferenceSelect_ZKY").attr("disabled",
                    "disabled");
                $("select#journalsORconferenceSelect_JCR").attr("disabled",
                    "disabled");
                $("select#journalsORconferenceSelect_CCF").attr("disabled",
                    "disabled");
                $("select#journalsORconferenceSelect_ESI").attr("disabled",
                    "disabled");
                $("select#journalsORconferenceSelect_OTHER").attr("disabled",
                    "disabled");
                //showLocationAreaByJournals(1);
                //showLocationAreaByJournals(2);
                //showLocationAreaByJournals(3);
                break;
            case 1:
                $("select#journalsORconferenceSelect_CCF").val(-1);
                $("select#journalsORconferenceSelect_CCF").attr("disabled",
                    "disabled");
                //   showLocationAreaByConference();
                break;
        }

    } else {
        $("input#paper_journals_conference_CUSTOM_input").val("");
        $("div#paper_journals_conference_CUSTOM").attr("hidden",
            "hidden");
        $("select#journalsORconferenceSelect_ZKY").removeAttr("disabled");
        $("select#journalsORconferenceSelect_JCR").removeAttr("disabled");
        $("select#journalsORconferenceSelect_CCF").removeAttr("disabled");
        $("select#journalsORconferenceSelect_ESI").removeAttr("disabled");
        $("select#journalsORconferenceSelect_OTHER").removeAttr("disabled");
    }
}
//// 期刊显示论文期刊号、卷期、页码输入(type表示期刊类型,1:中科院;2:JCR;3:CCF)
//function showLocationAreaByJournals(type) {
//    switch (type) {
//        case 1:
//            var options_ZKY = $("select#journalsORconferenceSelect_ZKY option:selected");
//            if (-1 != options_ZKY.val()) {
//                var addText = "";
//                addText += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_ZKY' class='form-control'></div>";
//                addText += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_ZKY' class='form-control'></div>";
//                addText += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_ZKY' class='form-control'></div>";
//                $("span#journalsORconferenceZKYArea").html(addText);
//            } else {
//                $("span#journalsORconferenceZKYArea").html("");
//            }
//            break;
//        case 2:
//            var options_JCR = $("select#journalsORconferenceSelect_JCR option:selected");
//            if (-1 != options_JCR.val()) {
//                var addText = "";
//                addText += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_JCR' class='form-control'></div>";
//                addText += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_JCR' class='form-control'></div>";
//                addText += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_JCR' class='form-control'></div>";
//                $("span#journalsORconferenceJCRArea").html(addText);
//            } else {
//                $("span#journalsORconferenceJCRArea").html("");
//            }
//            break;
//        case 3:
//            var options_CCF = $("select#journalsORconferenceSelect_CCF option:selected");
//            if (-1 != options_CCF.val()) {
//                var addText = "";
//                addText += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_CCF' class='form-control'></div>";
//                addText += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_CCF' class='form-control'></div>";
//                addText += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_CCF' class='form-control'></div>";
//                $("span#journalsORconferenceCCFArea").html(addText);
//            } else {
//                $("span#journalsORconferenceCCFArea").html("");
//            }
//            break;
//    }
//
//}
//// 会议显示论文期刊号、卷期、页码输入(type表示会议类型,1:CCF;2:其他)
//function showLocationAreaByConference() {
//    var type = 2;
//    var options_CCF = $("select#journalsORconferenceSelect_CCF option:selected");
//    for (var i in resultList) {
//        if (resultList[i].journals_conference_id == options_CCF.val()) {
//            type = resultList[i].journals_conference_type;
//            break;
//        }
//    }
//    switch (type) {
//        case 1:
//            var addText = "";
//            addText += "<label class='col-md-1 control-label' style='padding-left: 0px;padding-right: 0px;'>期刊号</label><div class='col-md-3'><input type='text' name='paper_location_issuing_CCF' class='form-control'></div>";
//            addText += "<label class='col-md-1 control-label'>卷期</label><div class='col-md-3'><input type='text' name='paper_location_volume_CCF' class='form-control'></div>";
//            addText += "<label class='col-md-1 control-label'>页码</label><div class='col-md-3'><input type='text' name='paper_location_pagination_CCF' class='form-control'></div>";
//            $("span#journalsORconferenceCCFArea").html(addText);
//            break;
//        case 2:
//            $("span#journalsORconferenceCCFArea").html("");
//            break;
//    }
//}
// 获取论文代理表信息
function shoWPaperProxyInputList(paperproxy_id) {
    htmlobj = $
        .ajax({
                // url: "../paper_proxy/show.do",
                url: "../paper_proxy/getPaper.do",
                type: 'POST',
                data: {
                    paperproxy_id: paperproxy_id
                },
                datatype: "json",
                success: function (data, stats) {
                    if (stats == "success") {
                        result = JSON.parse(htmlobj.responseText);
                        $("input#paper_name").val(result.paper_name);
                        $("input#paper_rank").val(result.paper_rank);
                        RANK = result.paper_rank;
                        $("input#paper_authorNum").val(
                            Number(result.paper_authorNum));
                        $("input#paper_authorNum").attr({
                            min: $("input#paper_rank").val()
                        });
                        showAuthorList(result.paper_authorNum);
                        if (result.paper_includedType == "SCI"
                            || result.paper_includedType == "EI"
                            || result.paper_includedType == "ISTP"
                            || result.paper_includedType == "SSCI") {
                            $("select#paper_includedType").val(
                                result.paper_includedType);
                        } else {
                            var addText = "<div class='form-group'>"
                                + "<label class='col-md-1 control-label'>请输入收录类型 </label>"
                                +

                                "<div class='col-md-5'><input type='text' name='other_includedType' value='"
                                + result.paper_includedType
                                + "' class='form-control'>"
                                + "</div></div>";
                            $("span#includedTypeArea").html(addText);
                            $("select#paper_includedType").val("other");
                        }
                        $("input#paper_accNum").val(result.paper_accNum);
                        $("input#paper_time").val(result.paper_time);
                        $("input#paper_if").val(result.paper_if);
                        switch (result.paper_status) {
                            case 0:
                                $("input#paper_status0").attr("checked", "checked");
                                $("input#paper_accNum").val("");
                                $("input#paper_accNum").attr("disabled", true);
                                $("input#paper_time").val("");
                                $("input#paper_time").attr("disabled", true);
                                break;
                            case 1:
                                $("input#paper_status1").attr("checked", "checked");
                                $("input#paper_accNum").attr("disabled", false);
                                $("input#paper_time").attr("disabled", false);
                                break;
                        }
                        $("select#journalsORconference")
                            .val(result.paper_issue);
                        $("input#paper_citations").val(result.paper_citations);
                        $("input#paper_citations_others").val(
                            result.paper_citations_others);
                        $("input#paper_citations_google").val(
                            result.paper_citations_google);
                        switch (result.paper_issue) {
                            case 0:
                                $("div#paper_conference_location").attr("hidden", "hidden")
                                $("div#paper_journals_location").removeAttr("hidden");
                                $("input#paper_journals_publishName").val(
                                    result.paper_publishName);
                                switch (result.paper_publishType) {
                                    case 1:
                                        $("input#paper_publishType1").attr("checked", "checked");
                                        $("input#paper_publishType2").removeAttr("checked");
                                        break;
                                    case 2:
                                        $("input#paper_publishType2").attr("checked", "checked");
                                        $("input#paper_publishType1").removeAttr("checked");
                                        break;
                                }
                                var ZKY_id = -1;
                                var JCR_id = -1;
                                var CCF_id = -1;
                                var ESI_id = -1;
                                var OTHER_id = -1;
                                if (null != result.paper_journals_conference_ZKY) {
                                    ZKY_id = result.paper_journals_conference_ZKY.journals_conference_id;
                                }
                                if (null != result.paper_journals_conference_JCR) {
                                    JCR_id = result.paper_journals_conference_JCR.journals_conference_id;
                                }
                                if (null != result.paper_journals_conference_CCF) {
                                    CCF_id = result.paper_journals_conference_CCF.journals_conference_id;
                                }
                                if (null != result.paper_journals_conference_ESI) {
                                    ESI_id = result.paper_journals_conference_ESI.journals_conference_id;
                                }
                                if (null != result.paper_journals_conference_OTHER) {
                                    OTHER_id = result.paper_journals_conference_OTHER.journals_conference_id;
                                }
                                if (null != result.paper_location) {
                                    var locations = result.paper_location.split("$");
                                    $("input#paper_journals_location1").val(locations[0]);
                                    $("input#paper_journals_location2").val(locations[1]);
                                    $("input#paper_journals_location3").val(locations[2]);
                                }
                                showSelectByFlag(paperproxy_id, result.paper_issue,
                                    ZKY_id, JCR_id, CCF_id, ESI_id, OTHER_id, result.paper_journals_conference_isZjut100,
                                    result.paper_journals_conference_isOther, result.paper_journals_conference_CUSTOM);
                                break;
                            case 1:
                                $("div#paper_journals_location").attr("hidden", "hidden");
                                $("div#paper_conference_location").removeAttr("hidden");
                                $("input#paper_conference_publishName").val(
                                    result.paper_publishName);
                                var CCF_id = -1;
                                if (null != result.paper_journals_conference_CCF) {
                                    CCF_id = result.paper_journals_conference_CCF.journals_conference_id;
                                }
                                if (null != result.paper_location) {
                                    var locations = result.paper_location.split("$");
                                    $("input#paper_conference_location1").val(locations[0]);
                                    $("input#paper_conference_location2").val(locations[1]);
                                }
                                showSelectByFlag(paperproxy_id, result.paper_issue,
                                    -1, -1, CCF_id, -1, -1, result.paper_journals_conference_isZjut100,
                                    result.paper_journals_conference_isOther, result.paper_journals_conference_CUSTOM);
                                break;
                        }

                    }
                },
                error: function (data) {
                    alert("请求失败");
                }
            }
        )
    ;
}
// 录入者信息填充
function authorInput() {
    var number = $("input#paper_authorNum").val();
    var rank = $("input#paper_rank").val();
    for (var i = 0; i < number; i++) {
        if ((i + 1) == rank) {
            $("input#authorName" + rank).val($("input#teacher_name").val());
            $("input#authorType" + rank + "[value=1]").attr("checked", true);
            $("input#AuthorID" + rank).val($("input#teacher_no").val())
            $("input#AuthorOffice" + rank).val($("input#teacher_office").val());
        }
    }
}
$(document)
    .ready(
        function () {
            var paperproxy_id = $("input#paperproxy_id").val();
            shoWPaperProxyInputList(paperproxy_id);
            $("select#journalsORconference").change(
                function () {
                    var flag = $("select#journalsORconference")
                        .children('option:selected').val();
                    showSelect(flag);
                });

            $("select#paper_includedType")
                .change(
                    function () {
                        if ($("select#paper_includedType")
                                .children('option:selected')
                                .val() == "other") {
                            var addText = "<div class='form-group'>"
                                + "<label class='col-md-1 control-label'>请输入收录类型 </label>"
                                +

                                "<div class='col-md-5'><input type='text' name='other_includedType' class='form-control'>"
                                + "</div></div>";
                            $("span#includedTypeArea").html(
                                addText);
                        } else {
                            $("span#includedTypeArea").html("");
                        }
                    });
            $('input:radio[name="paper_status"]')
                .change(
                    function () {
                        if ($(
                                "input:radio[name='paper_status']:checked")
                                .val() == 0) {
                            $("input#paper_accNum").val("");
                            $("input#paper_accNum").attr(
                                "disabled", true);
                            $("input#paper_time").val("");
                            $("input#paper_time").attr(
                                "disabled", true);
                        } else {
                            $("input#paper_accNum").attr(
                                "disabled", false);
                            $("input#paper_time").attr(
                                "disabled", false);
                        }
                    });
            $("input#paper_authorNum").change(function () {
                var authorNumber = $("input#paper_authorNum").val();
                authorsRead();
                showAuthorList(authorNumber);
                authorsWrite();
            });
            $("input#paper_rank").change(
                function () {
                    $("input#paper_authorNum").attr({
                        min: $("input#paper_rank").val()
                    });
                    if ($("input#paper_authorNum").val() < $(
                            "input#paper_rank").val()) {
                        $("input#paper_authorNum").val(
                            $("input#paper_rank").val());
                    }
                    var authorNumber = $("input#paper_authorNum")
                        .val();
                    authorsRead();
                    showAuthorList(authorNumber);
                    authorsWrite();
                    RANK = $("input#paper_rank").val();
                });
            var validate = $("#paperForm")
                .validate(
                    {
                        // debug : true, // 调试模式取消submit的默认提交功能
                        // errorClass : "label.error", //
                        // 默认为错误的样式类为：error
                        focusCleanup: true, // 被验证的元素获得焦点时移除错误信息
                        focusInvalid: false, // 当为false时，验证无效时，没有焦点响应
                        // onfocusout:true,//失去焦点时 验证
                        // onkeyup : false,
                        submitHandler: function (form) { // 表单提交句柄,为一回调函数，带一个参数：form
                            form.submit(); // 提交表单
                        },
                        rules: {
                            paper_name: {
                                required: true
                            },
                            paper_rank: {
                                required: true,
                                digits: true
                            },
                            paper_authorNum: {
                                required: true,
                                digits: true
                            },
                            paper_time: {
                                dateISO: true
                            },
                            paper_citations: {
                                digits: true
                            },
                            paper_citations_others: {
                                digits: true
                            },
                            paper_citations_google: {
                                digits: true
                            }
                        },
                        messages: {
                            paper_name: {
                                required: "必须论文名称！"
                            },
                            paper_rank: {
                                required: "请输入您的排名！",
                                digits: "请输入整数!"
                            },
                            paper_authorNum: {
                                required: "请输入作者人数！",
                                digits: "请输入整数!"
                            },
                            paper_time: {
                                dateISO: "请按照年/月/日格式输入日期，例如2016/6/1"
                            },
                            paper_citations: {
                                digits: "请输入整数!"
                            },
                            paper_citations_others: {
                                digits: "请输入整数!"
                            },
                            paper_citations_google: {
                                digits: "请输入整数!"
                            }

                        },
                        highlight: function (element) {
                            $(element).closest('.form-group')
                                .addClass('has-error');
                            $(element).closest('.form-group')
                                .addClass('has-feedback');
                            $(element).closest('.col-md-5')
                                .find('span.glyphicon')
                                .remove();
                            $(element)
                                .closest('.col-md-5')
                                .append(
                                    "<span class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        },
                        success: function (label) {
                            label.closest('.form-group')
                                .removeClass('has-error');
                            label.closest('.form-group')
                                .addClass('has-success');
                            label.closest('.col-md-5').find(
                                'span.glyphicon').remove();
                            label
                                .closest('.col-md-5')
                                .append(
                                    "<span class='glyphicon glyphicon-ok form-control-feedback'></span>");
                            label.remove();
                        },
                        errorPlacement: function (error,
                                                  element) {
                            element.parent('div').append(error);
                        }

                    });
        });
