<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
	table{width: 900px;margin: auto; height: 11px;}
	th {padding: 5px; border-bottom: 1px solid gray; text-align: center;}
	td {padding: 5px; border-bottom: 1px solid gray;  }
	.title {font-size: 18pt; text-align: center; border: none;}
	.sub_title {font-size: 10pt; text-align: right; border: none;}
	.subject:hover {
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	// 자바 스크립트 추가!!!
	$(function() {

	});

	/* function post_to_url(path, params, method) {
		method = method || "POST"; // 메서드 지정
		var form = document.createElement("form"); // 폼 생성
		form.setAttribute("method", method); // 메서드 속성 추가
		form.setAttribute("action", path); // 액션 지정
		for ( var key in params) { // 파라메터를 input 태그로 만들어 폼에 추가
			var hiddenField = document.createElement("input"); // input태그 생성
			hiddenField.setAttribute("type", "hidden"); // 타입 속성을 hidden으로 지엉
			hiddenField.setAttribute("name", key); // name속성 지정
			hiddenField.setAttribute("value", params[key]); // value속성 지정
			form.appendChild(hiddenField); // 폼에 추가
		}
		document.body.appendChild(form);
		form.submit(); // 폼 전송 
	}*/
</script>
</head>
<body>
<div style="width: 300px; height: 50px;"><span style="font-size: 30px;">${commVO.boardName}</span></div>
	<table>
	<!-- 	<tr>
			<td colspan="5" class="title"></td>
		</tr> -->
		<tr> 
			<td colspan="5" class="sub_title">${pagingVO.pageInfo }</td>
		</tr>
		<tr>
			<th>번호</th>
			<th width="60%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${pagingVO.totalCount eq 0 }">
			<tr>
				<td colspan="5" align="center">
					등록된 글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${pagingVO.totalCount gt 0 }">
			<c:set var="no" value="${pagingVO.totalCount-(pagingVO.currentPage-1)*pagingVO.pageSize }"/>
			<c:forEach var="vo" items="${pagingVO.list }" varStatus="vs">
 				<tr align="center" class="subject" 
				onclick='post_to_url("view",{"tb":"${commVO.tableName}","idx":${vo.idx },"m":"1" ,"p":${commVO.currentPage} ,"s": ${commVO.pageSize }, "b":${commVO.blockSize },"boardName":"${commVO.boardName }"})'>	
					<td>${no-vs.index}</td>
					<td align="left">
						<c:out value="${vo.subject }"/>
						<c:if test="${vo.commentCount > 0 }">
							(${vo.commentCount })
						</c:if>
					</td>
					<td>
						<c:out value="${vo.name }"/>
					</td>
					<td>
						<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${vo.hit }</td>
				</tr>
			</c:forEach>
			<%-- 페이지 이동 --%>
			<tr>
				<td colspan="5" style="border: none;">
					${pagingVO.pageListPost }
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" style="border: none;text-align: right;">
				<button class="btn btn-success btn-sm" 
				 onclick='post_to_url("${pageContext.request.contextPath }/insert",{"tb":"${commVO.tableName}","p":${commVO.currentPage} ,"s": ${commVO.pageSize }, "b":${commVO.blockSize }, "boardName":"${commVO.boardName }"})'>글쓰기</button>
			</td>
		</tr>
		
	</table>
</body>
</html>








