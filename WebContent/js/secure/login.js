function checkInput() {
	var teacher_no_value = $("#teacher_no").val();
	var teacher_password_value = $("#teacher_password").val();
	var reg = /^\d+$/;
	if (teacher_no_value == "") {
		alert("请输入工号！");
		return false;
	} else if (teacher_password_value == "") {
		alert("请输入密码！");
		return false;
	}else if (teacher_password_value.length > 16) {
		alert("已超过密码最长限制，请检查输入！");
		return false;
	}else if (teacher_password_value.length < 6) {
		alert("密码过短，请检查输入！");
		return false;
	} else if (!reg.test(teacher_no_value)) {
		alert("工号格式输入错误！");
		return false;
	} else
		return true;
}

function keyLogin(){
	  if (event.keyCode==13)   //回车键的键值为13
	     $("#confirmLogin").click();  //调用登录按钮的登录事件
}

window.onload = function() {
	var obj_lis = document.getElementById("navul").getElementsByTagName("li");
	var oldobj = document.getElementById("navul")
			.getElementsByClassName("test");
	for (i = 0; i < obj_lis.length; i++) {
		obj_lis[i].onclick = function() {
			var test = this.getElementsByTagName("a");
			oldobj[0].removeAttribute("class");
			test[0].setAttribute("class", "test");
		}
	}
}

$(document).ready(function() {
	$("#confirmLogin").click(function() {
		if (checkInput()) {
			var teacher_no_value = $("#teacher_no").val();
			var teacher_password_value = $("#teacher_password").val();
			var sha_password = hex_sha1(teacher_password_value);
			$.ajax({
				url : "teacher/login.do",
				type : 'POST',
				data : {
					teacher_no : teacher_no_value,
					teacher_password : sha_password
				},
				datatype : "json",
				success : function(result) {
					if(result == "success") {
						window.location.href="teacher/teacherFunction.do"
					} 
					if(result == "teacher_not_found"){
						alert("该教师不存在，请检查输入或者联系管理员！")
					}
					if(result == "error"){
						alert("用户名或密码错误！")
					}

				},
				error : function(data) {
					alert("请求失败");
				}
			});
		} else {
		}
	})
});
