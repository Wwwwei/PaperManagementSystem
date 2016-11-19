<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/softwareCopyright.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/pms.css" />
<script type="text/javascript">
	$(function() {
		$("#resetPassword").click(function() {
			var teacher_no = $("#teacher_no").val();
			var teacher_id = $("#teacher_id").val();
			$.ajax({
				url : "admin/resetPassword.do",
				type : 'POST',
				data : {
					teacher_id : teacher_id,
					teacher_no : teacher_no
				},
				datatype : "json",
				success : function(result) {
					if (result == "success") {
						alert("重置密码成功！")
					} 
					else if(result == "admin_not_login"){
						window.location.href="login.jsp";
					}
// 					else {
// 						alert("重置密码失败，请重新尝试！");
// 					}
				},
				error : function(data) {
					alert("网络错误，请重新尝试！");
				}
			});
		});

	
		var teacher_sex_value = "${teacher.teacher_sex}";
		$("#teacher_sex").val(teacher_sex_value);

		var teacher_institute_id_value = "${teacher.teacher_institute.institute_id}";
		$("#teacher_institute").val(teacher_institute_id_value);

		var teacher_title_value = "${teacher.teacher_title}";
		$("#teacher_title").val(teacher_title_value);

		var updateTeacherResult_value = "${updateTeacherResult}";
		if (updateTeacherResult_value != "")
			alert(updateTeacherResult_value);
	});
</script>
<body>
	
	<!--导航条开始-->
	<jsp:include page="head.jsp"/>
	
	<div class="container" style="margin-top: 5%;min-height:350px">
		<div class="row">
			<div class="col-lg-2">
				<jsp:include page="left.jsp"><jsp:param value="3" name="location" /></jsp:include>
			</div> 
			<div class="col-lg-10">
				<blockquote>
					<span> 查询教师信息 </span>
				</blockquote>
				<form action="admin/findTeacherInfo.do" method="post" class="form-inline">
					<div class="col-lg-6">
    					<div class="input-group" style="width:100%">
     						<input type="text" name="find_string" value="${find_string}" class="form-control">
	      					<span class="input-group-btn">
	        					<button type="submit" class="btn btn-primary"style="font-size: 22px"><span class="glyphicon glyphicon-search"></span></button>
	      					</span>
					    </div><!-- /input-group -->
					  </div>					
				</form>
	<c:if test="${requestScope.teacher==null&&requestScope.isFindTeacher == true}">
 		<div class="col-lg-12">&nbsp;</div>
 		<div class="col-lg-6">
 			<div class="alert alert-danger alert-dismissible" role="alert">
  				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  					没有该教师信息，请检查输入！
				</div>
		</div>
	</c:if>
	<c:if test="${requestScope.teacher!=null}">
		<form id="updateTeacher" action="admin/updateTeacher.do" method="post">
			<!--  <form id="updateTeacher"> -->
			<div class="col-lg-12">&nbsp;</div>
			<input type="hidden" id="teacher_id" name="teacher_id"
				value="${teacher.teacher_id}">
			<div class="col-lg-2"><label>教师姓名：</label></div>
			<div class="col-lg-4"><input type="text"
				name="teacher_name" value="${teacher.teacher_name}" class="form-control"></div>
			<div class="col-lg-2"><label>教师工号：</label></div>
			<div class="col-lg-4"><input type="text" name="teacher_no" id="teacher_no"
				value="${teacher.teacher_no}" readonly="readonly"class="form-control"> </div>
			
			<div class="col-lg-12">&nbsp;</div>
			
			<div class="col-lg-2"><label>教师性别：</label></div>
			<div class="col-lg-4"><select
				id="teacher_sex" name="teacher_sex" class="form-control">
				<option value="0">女</option>
				<option value="1">男</option>
			</select></div>
			<div class="col-lg-2"><label>教师职称：</label></div>
			<div class="col-lg-4"><select id="teacher_title" name="teacher_title"
				class="form-control">
				<option value="教授">教授</option>
				<option value="副教授">副教授</option>
				<option value="讲师">讲师</option>
				<option value="">其他</option>
			</select> </div>
			
			<div class="col-lg-12">&nbsp;</div>
			
			<div class="col-lg-2"><label>出生年月：</label></div>
			<div class="col-lg-4"><input type="date" name="teacher_birth"
				value="${teacher.teacher_birth}" min="1900-01-01" max="2019-09-26" class="form-control"/></div>
			<div class="col-lg-2"><label>教师手机号：</label></div>
			<div class="col-lg-4"><input type="text" name="teacher_phoneNumber"
				id="teacher_phoneNumber" value="${teacher.teacher_phoneNumber}"class="form-control"/></div>
			
			<div class="col-lg-12">&nbsp;</div>
			
			<div class="col-lg-2"><label>教师办公电话：</label></div>
			<div class="col-lg-4"><input type="text" name="teacher_officeNumber"
				id="teacher_officeNumber" value="${teacher.teacher_officeNumber}"class="form-control"/></div>
			<div class="col-lg-2"><label>教师QQ：</label></div>
			<div class="col-lg-4"><input type="text" name="teacher_qq" id="teacher_qq"
				value="${teacher.teacher_qq}" class="form-control"/></div>
				
			<div class="col-lg-12">&nbsp;</div>
				
			<div class="col-lg-2"><label>教师身份证：</label></div>
			<div class="col-lg-4"><input type="text"
				name="teacher_idCard" id="teacher_idCard"
				value="${teacher.teacher_idCard}" class="form-control"/></div>
			<div class="col-lg-2"><label>教师邮箱：</label></div>
			<div class="col-lg-4"><input type="text"
				name="teacher_email" value="${teacher.teacher_email}" class="form-control"/></div>
				
			<div class="col-lg-12">&nbsp;</div>
				
			<div class="col-lg-2"><label>教师毕业院校：</label></div>
			<div class="col-lg-4"><input type="text" name="teacher_graUniversity"
				value="${teacher.teacher_graUniversity}" class="form-control"/></div>
			<div class="col-lg-2"><label>来工大时间：</label></div>
			<div class="col-lg-4"><input
				type="date" name="teacher_comeTime"
				value="${teacher.teacher_comeTime}" min="1900-01-01"
				max="2019-09-26" class="form-control"/></div>
					
			<div class="col-lg-12">&nbsp;</div>
				
			<div class="col-lg-2"><label>教师研究所：</label></div>
			<div class="col-lg-4"><select
				id="teacher_institute" name="teacher_institute.institute_id"
				class="form-control">
				<c:forEach var="institute" begin="0" step="1"
					items="${requestScope.institutes}">
					<option value="${institute.institute_id}">${institute.institute_name}</option>
				</c:forEach>
			</select></div>
			<div class="col-lg-12">&nbsp;</div>
			<div class="col-lg-2"><label>教师简介：</label></div>
			<div class="col-lg-10"><textarea name="teacher_info"
				 class="form-control" style="height:80px">${teacher.teacher_info}</textarea></div>
			<div class="col-lg-12">&nbsp;</div>
				<div class="col-lg-3 col-lg-offset-3">
					<input type="submit" class="btn btn-primary" value="确认修改">
				</div>
		</form>
		<div class="col-lg-3">
			<button  class="btn btn-danger" id="resetPassword">重置密码</button>
		</div>
		
	</c:if>
	<div class="col-lg-12">&nbsp;</div>
			</div> 
		</div>
		
	</div>
	<jsp:include page="../../../layout/footer.jsp" />
</body>
</html>