$(document).ready(function() {
	$("#teacher_no").blur(function() {
			var teacher_no_value = $("#teacher_no").val();
			if(teacher_no_value.length=="")
				$("#teacher_no_info").html("工號不能為空");
			else{
				var reg = /^\d+$/;
				if(!reg.test(teacher_no_value)){
					$("#teacher_no_info").html("工號格式錯誤！")
				}
				else{
				$.ajax({
					url : "admin/findTeacherNo.do",
					type : 'POST',
					data : {
						teacher_no : teacher_no_value
						
					},
					datatype : "json",
					success : function(result) {
						if(result == "true") {
							$("#teacher_no_info").html("工號已經存在");
						} 
						else if(result == "false"){
							$("#teacher_no_info").html("");
						}

					},
					error : function(data) {
						alert("请求失败");
					}
				});
				}
			}
	})
});