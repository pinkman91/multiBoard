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
<title>자유 게시판 글삭제</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js"></script>


<style type="text/css">
	/* 여기에 스타일 추가 */
	table{width: 900px;margin: auto;}
	th {padding: 5px; border: 1px solid gray; background: silver;text-align: center;}
	td {padding: 5px; border: 0px solid gray;}
	.title {font-size: 18pt; text-align: center; border: none;}
	.sub_title {font-size: 10pt; text-align: right; border: none;}
	.subject:hover {
		background-color: silver;cursor: pointer;
	}
</style>
<script type="text/javascript">
	// 자바 스크립트 추가!!!
	$(function() {

	});
	
	//function formCheck(){
		//var data = $("#password").val();
		//if(isNullCheck(data)){
			//alert('비번은 반드시 입력해야 합니다.');
			//$("#password").val("");
			//$("#password").focus();
			//return false;
		//}
		//return true;
	//}	
</script>
</head>

<body>
	<form action="deleteOk" method="post" onsubmit="return formCheck();">
	<%-- 몇가지는 숨겨서 가자!!! --%>
	<input type="hidden" name="idx" value="${vo.idx }">
	<input type="hidden" name="p" value="${commVO.currentPage }">
	<input type="hidden" name="s" value="${commVO.pageSize }">
	<input type="hidden" name="b" value="${commVO.blockSize }">
	<input type="hidden" name="tb" value="${commVO.tableName }">
	<input type="hidden" name="boardName" value="${commVO.boardName }">
	<input type="hidden" name="ip" value="${pageContext.request.remoteAddr }">
	<table style="border: 1px;text-align: center;">
		<tr>
			<td colspan="4" class="title">${commVO.boardName } 글삭제</td>
		</tr>
		<tr>
			<td align="right" width="10%">이름</td>
			<td width="40%" align="left">
				<input type="text" name="name" value="${vo.name }" readonly="readonly">
			</td>
			<!-- <td align="right" width="10%">비번</td>
			<td width="40%" align="left">
				<input type="password" name="password" required="required" placeholder="비번입력" id="password">
			</td> -->
		</tr>
		<tr>
			<td align="right" valign="top">제목</td>
			<td align="left" colspan="3">
				<input type="text" name="subject" id="subject" readonly="readonly" size="78" value="${vo.subject }">
			</td>
		</tr>
		<tr>
			<td align="right" valign="top">내용</td>
			<td align="left" colspan="3">
				<textarea rows="10" cols="80" name="content" readonly="readonly">${vo.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right" style="padding-right: 120px;">
				<input type="submit" value="삭제하기" class="btn btn-outline-primary btn-sm" >
				<input type="button" value="취소하기" class="btn btn-outline-dark btn-sm"
				        onclick='post_to_url("view",{"boardName":"${commVO.boardName }","tb":"${commVO.tableName}","idx":${vo.idx },"m":"0", "p":${commVO.currentPage },"s":${commVO.pageSize},"b":${commVO.blockSize }})'>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>