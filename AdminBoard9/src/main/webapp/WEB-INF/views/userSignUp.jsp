<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js"></script>

<style type="text/css">
.userWellcome{
	display: none;
}
.userLogOut{
	display: none;
}
 
	#signButton{
	
 		margin-bottom: 25px;
	}
</style>
<script type="text/javascript">
	// 자바 스크립트 추가!!!
	$(function() {

	});
	
	function formCheck(){
		var data = $("#userid").val();
		if(isNullCheck(data)){
			alert('아이디는 반드시 입력해야 합니다.');
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		var data = $("#password").val();
		if(isNullCheck(data)){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var data = $("#name").val();
		if(isNullCheck(data)){
			alert('이름은 반드시 입력해야 합니다.');
			$("#subject").val("");
			$("#subject").focus();
			return false;
		}
		var data = $("#email").val();
		if(isNullCheck(data)){
			alert('이메일은 반드시 입력해야 합니다.');
			$("#content").val("");
			$("#content").focus();
			return false;
		}
		return true;
	}	
</script>
</head>
<body>
	<div class="signUpBody">
		<form action="${pageContext.request.contextPath}/userSignUpOk" method="post" onsubmit="return formCheck();">
		<input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요" class="signForm form-control input-lg" style="margin-top:100px; margin-left:350px; width: 300px;"><br>
		<input type="password" id="password" name="pwd" placeholder="비밀번호를 입력하세요" class="signForm form-control input-lg" style="margin-left:350px; width: 300px;"><br>
		<input type="text" id="name" name="name" placeholder="이름을 입력하세요" class="signForm form-control input-lg" style="margin-left:350px; width: 300px;"><br>
		<input type="text" id="email" name="email" placeholder="이메일을 입력하세요" class="signForm form-control input-lg" style="margin-left:350px; width: 300px;"><br>
		<div id="signButton"><input type="submit" value="회원가입" id="signForm" class="btn btn-outline-primary btn-sm text-center"></div>
		<div id="signButton"><input type="button" onclick="location.href='${pageContext.request.contextPath}/'" value="메인페이지 이동" class="btn btn-outline-primary btn-sm text-center" ></div>
		
		</form>
	</div>	
</body>
</html>