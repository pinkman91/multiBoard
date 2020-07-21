<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

	.signUpComplete{
				margin: 0 auto;
				width: 1000px;
				padding-left: 200px;
				padding-top: 100px;
			}
	span{
		
		font-size: 50px;
	
	}
	.maingogo{
		font-size:24px;
		margin-top: 24px;
		padding-left: 700px;
	}
	 #navA:link { color: red; text-decoration: none;}
	 #navA:visited { color: white; text-decoration: none;}
	 #navA:hover { color: yellow; text-decoration: underline;}
</style>
</head>
<body>
		<div class="signUpComplete"><span>${userName }가입해주셔서 감사합니다!</span></div> 
		<div id="signUpComplete" class="btn btn-outline-primary btn-sm"><a href="${pageContext.request.contextPath}/"><span class="maingogo" >메인으로</span></a></div> 
</body>
</html>