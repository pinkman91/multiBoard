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
	/* 여기에 스타일 추가 */
	table{width: 900px;margin: auto;}
	th {padding: 5px; border: 0px solid gray; background: silver;text-align: center;}
	td {padding: 5px; border: 0px solid gray;}
	.title {font-size: 18pt; text-align: center; border: none;}
	.sub_title {font-size: 10pt; text-align: right; border: none;}
</style>
<script type="text/javascript">
	// 자바 스크립트 추가!!!
	$(function() {

	});
	
	// 댓글 수정
	function commentUpdate(idx){
		var name = $("#name"+idx).text();
		var content = $("#content"+idx).text();
		$("#commentForm").attr("action","CommentUpdateOk");
		$("#idx").val(idx);
		$("#name").val(name);
		$("#content").val(content);
		$("#cancelBtn").css("display","inline");
		$("#submitBtn").val("수정");
	}
	// 댓글 삭제
	function commentDelete(idx){
		var name = $("#name"+idx).text();
		var content = $("#content"+idx).text();
		$("#commentForm").attr("action","CommentDeleteOk");
		$("#idx").val(idx);
		$("#name").val(name);
		$("#content").val(content);
		$("#cancelBtn").css("display","inline");
		$("#submitBtn").val("삭제");
	}
	// 폼 리셑
	function commentReset(){
		$("#commentForm").attr("action","CommentInsertOk");
		$("#idx").val(-1);
		$("#name").val("");
		$("#content").val("");
		$("#cancelBtn").css("display","none");
		$("#submitBtn").val("저장");
	}
	
	
</script>
</head>
<body>

<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>



	<table style="border: 1px;text-align: center;">
		<tr>
			<td colspan="6" class="title"> ${commVO.boardName} 내용보기</td>
		</tr>
		<tr>
			<td align="right" width="10%">이름 : </td>
			<td width="30%" align="left">
				<c:out value="${vo.name }"/>
			</td>
			<td align="right" width="10%">작성일 : </td>
			<td width="30%" align="left">
				<fmt:formatDate value="${vo.regDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss "/>
			</td>
			<td align="right" width="10%">조회수 : </td>
			<td width="10%" align="left">
				${vo.hit }
			</td>
		</tr>
		<tr>
			<td align="right" valign="top">제목 : </td>
			<td align="left" colspan="5">
				<c:out value="${vo.subject }"/>
			</td>
		</tr>
		<tr>
			<td align="right" valign="top">내용 : </td>
			<td align="left" colspan="5" style="border-bottom:1px solid black; padding:5px; height: 300px;" valign="top">
				<c:set var="content" value="${vo.content }"/>
				<c:set var="content" value="${fn:replace(content,'<','&nbsp;') }"/>
				<c:set var="content" value="${fn:replace(content, newLine,br) }"/>
				${content }				
			</td>
		</tr>
		<tr>
			<td colspan="6" align="right">
				<input type="button" value="수정하기" class="btn btn-outline-dark btn-sm"
				        onclick='post_to_url("update",{"tb":"${commVO.tableName}","idx":${vo.idx },"m":0, "p":${commVO.currentPage },"s":${commVO.pageSize},"b":${commVO.blockSize },"boardName":"${commVO.boardName }"})'>
				<input type="button" value="삭제하기" class="btn btn-outline-dark btn-sm"
				        onclick='post_to_url("delete",{"tb":"${commVO.tableName}","idx":${vo.idx },"m":0, "p":${commVO.currentPage },"s":${commVO.pageSize},"b":${commVO.blockSize },"boardName":"${commVO.boardName }"})'>
				<input type="button" value="목록으로" class="btn btn-outline-dark btn-sm"
				        onclick='post_to_url("${pageContext.request.contextPath }/index",{"tb":"${commVO.tableName}","p":${commVO.currentPage },"s":${commVO.pageSize},"b":${commVO.blockSize },"boardName":"${commVO.boardName }"})'>
			</td>
		</tr>
		<tr>
			<td colspan="6"  style="text-align: left;border: 1px solid gray " height="100px;">
				<%-- 댓글 폼 --%>
				<form action="CommentInsertOk" method="post" id="commentForm">
					<input type="hidden" name="idx" id="idx" value="-1">
					<input type="hidden" name="ref" id="ref" value="${vo.idx }">
					<input type="hidden" name="p" value="${commVO.currentPage }">
					<input type="hidden" name="s" value="${commVO.pageSize }">
					<input type="hidden" name="b" value="${commVO.blockSize }">
					<input type="hidden" name="tb" value="${commVO.tableName }">
					<input type="hidden" name="boardName" value="${commVO.boardName }">
					<input type="hidden" name="m" value="0">
					<input type="text" name="name" id="name" placeholder="이름" required="required">
					<input type="password" name="password" id="password" placeholder="비번" required="required">
					<br>
					<textarea rows="4" cols="90" name="content" id="content"></textarea>
					<br>
					<input type="submit" value="댓글저장" id="submitBtn" class="btn btn-outline-dark btn-sm">
					<input type="button" value="취소" id="cancelBtn" class="btn btn-outline-dark btn-sm" style="display: none;"  onclick="commentReset()">
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="6">
			<c:if test="${empty vo.commentList }">
				등록된 댓글이 없습니다.
			</c:if>
			<c:if test="${not empty vo.commentList }">
				<div style="text-align: left;">
				전체 ${fn:length(vo.commentList) }개의 댓글이 있습니다.
				</div><br>
				<hr>
				<c:forEach var="comment" items="${vo.commentList }">
					<div style="text-align: left;">
						 
						<strong><span id="name${comment.idx }" >${comment.name }</span></strong> ${comment.ip }
						<fmt:formatDate value="${comment.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
						<button class="btn btn-outline-dark btn-sm" onclick="commentUpdate('${comment.idx }')">수정</button>
						<button class="btn btn-outline-dark btn-sm" onclick="commentDelete('${comment.idx }')">삭제</button>
						 
						<div id="content${comment.idx }" style="display:none;">${comment.content }</div>
						<div>
							<c:set var="content2" value="${comment.content }"/>
							<c:set var="content2" value="${fn:replace(content2,'<','&nbsp;') }"/>
							<c:set var="content2" value="${fn:replace(content2, newLine,br) }"/>
							${content2 }	
						</div>
					</div>
				<hr>
				</c:forEach>
			</c:if>
			</td>
		</tr>	
	</table>
	
</body>
</html>