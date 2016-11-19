function checkPassword() {
	// var password = "${teacher.teacher_password}";
	var reg = /^[0-9a-zA-Z]+$/;
	var oldPassword = $("#oldPassword").val();
	var newPassword = $("#newPassword").val();
	var renewPassword = $("#renewPassword").val();
	if (oldPassword.length == 0) {
		alert("请输入旧密码！");
		return false;
	} else if (newPassword == oldPassword) {
		alert("新密码跟旧密码不能相同！");
		return false;
	} else if (newPassword == "") {
		alert("请输入新密码！");
		return false;
	} else if (!reg.test(newPassword)) {
		alert("新密码只能由数字或字母组成！");
		return false;
	} else if (newPassword.length < 6) {
		alert("新密码过短！");
		return false;
	} else if (newPassword.length > 32) {
		alert("新密码过长！");
		return false;
	} else if (newPassword != renewPassword) {
		alert("两次新密码输入不一致，请重新输入！");
		return false;
	} else
		return true;
}
$(document).ready(function() {
	$("#confirmUpdate").click(function() {
		if (checkPassword()) {
			var oldPassword_value = $("#oldPassword").val();
			var newPassword_value = $("#newPassword").val();
			var sha_oldPassword = hex_sha1(oldPassword_value);
			var sha_newPassword = hex_sha1(newPassword_value);
			$.ajax({
				url : "teacher/updatePassword.do",
				type : 'POST',
				data : {
					oldPassword : sha_oldPassword,
					newPassword : sha_newPassword
				},
				datatype : "json",
				success : function(result) {
					if(result == "success") {
						alert("修改密码成功！")
						window.location.href="teacher/quit.do"
					} 
					if(result == "oldPassword_error"){
						alert("旧密码错误请检查输入")
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
