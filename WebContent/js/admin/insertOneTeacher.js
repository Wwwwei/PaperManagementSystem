$(document).ready(function() {
	$("#teacher_no").blur(function() {
		var teacher_no_value = $("#teacher_no").val();
		$.ajax({
			url : "admin/findTeacherNo.do",
			type : 'POST',
			data : {
				teacher_no : teacher_no_value

			},
			datatype : "json",
			success : function(result) {
				if(result == "true") {
					$("#teacher_no_info").html("工号已经存在");
				}
				else if(result == "false"){
					$("#teacher_no_info").html("");
				}

			},
			error : function(data) {
				alert("请求失败");
			}
		});


	})
});

function check()
{
	var teacher_no=$("[name=teacher_no]").val();
	if(teacher_no=="")
	{
		alert("工号不能为空！")
		return false;
	}
	else
	{
		var reg = /^\d+$/;
		if(!reg.test(teacher_no)){
			alert("工号格式错误");
			return  false;
		}
	}
	var teacher_name = $("[name=teacher_name]").val();
	if(teacher_name=="")
	{
		alert("姓名不能为空!");
		return false;
	}
	var teacher_birth = $("[name=teacher_birth]").val();
	if(teacher_birth=="")
	{
		alert("出生年月不能为空!");
		return false;
	}
	var teacher_phoneNumber = $("[name=teacher_phoneNumber]").val();
	if(teacher_phoneNumber=="")
	{
		alert("手机号不能为空!");
		return false;
	}
	else
	{
		var RegCellPhone = /^([0-9]{11})?$/;
		var falg=teacher_phoneNumber.search(RegCellPhone);
		if (falg==-1){
			alert("手机号不合法！");
			return false;
		}
	}
	var teacher_officeNumber = $("[name=teacher_officeNumber]").val();
	if(teacher_officeNumber=="")
	{
		alert("办公电话不能为空!");
		return false;
	}
	else
	{
		var regofficeNumber=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		if(!regofficeNumber.test(teacher_officeNumber))
		{
			alert("办公电话格式有误")
			return false;
		}
	}
	var teacher_qq = $("[name=teacher_qq]").val();
	var repQq = /^\d{5,}$/;
	if (teacher_qq != "") {
		if (!repQq.test(teacher_qq)) {
			alert("qq格式有误!");
			return false;
		}
	}

	var teacher_idCard = $("[name=teacher_idCard]").val();
	if(teacher_idCard=="")
	{
		alert("身份证不能为空!");
		return false;
	}
	else
	{
		var regidCard=/\d{18}|\d{15}/;
		if(!regidCard.test(teacher_idCard))
		{
			alert("身份证号码格式有误")
			return false;
		}
	}

	var teacher_email = $("[name=teacher_email]").val();
	if(teacher_email=="")
	{
		alert("邮箱不能为空!");
		return false;
	}
	else
	{
		var regemail= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(!regemail.test(teacher_email))
		{
			alert("邮箱格式有误")
			return false;
		}
	}

	var teacher_graUniversity = $("[name=teacher_graUniversity]").val();
	if(teacher_graUniversity=="")
	{
		alert("毕业院校不能为空!");
		return false;
	}

	var teacher_comeTime = $("[name=teacher_comeTime]").val();
	if(teacher_comeTime=="")
	{
		alert("来工大时间不能为空!");
		return false;
	}
	var teacher_institute = $("#teacher_institute").val();
	if(teacher_institute==0)
	{
		alert("教师研究所不能为空!");
		return false;
	}

	var teacher_university = $("[name=teacher_university]").val();
	if(teacher_university=="")
	{
		alert("所在院校不能为空!");
		return false;
	}
	var teacher_subject = $("[name=teacher_subject]").val();
	if(teacher_subject=="")
	{
		alert("教学科目不能为空!");
		return false;
	}

	var teacher_subject_study = $("[name=teacher_subject_study]").val();
	if(teacher_subject_study=="")
	{
		alert("研究方向不能为空!");
		return false;
	}

	var teacher_teachingProfession = $("#teacher_teachingProfession").val();;
	if(teacher_teachingProfession==0)
	{
		alert("教学专业不能为空!");
		return false;
	}
	return true;

}