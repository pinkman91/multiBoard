<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>


<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<style type="text/css">
	/* 여기에 스타일 추가 */
 
 
	.subject:hover {
	 cursor: pointer;
	}
	 
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<script type="text/javascript">

$(function() {
	$("#tableName").bind("keyup",function(){
		 re = /[~!@\#$%^&*\()\-=+_']/gi; 
		 var temp=$("#tableName").val();
		 if(re.test(temp)){ //특수문자가 포함되면 삭제하여 값으로 다시셋팅
		 $("#tableName").val(temp.replace(re,"")); } });
});

function add(){
    var boardOption = $("#boardOption");
    // select 태그의 option을 정의한다.
    var op = new Option();
    op.value = boardOption;
    op.text = boardOption;
 
    // select 태그에 생성 된 option을 넣는다.
    document.forms["frm"].sel.add(op);
}
 
function clearAll(){
    // select 태그의 option을 전체 삭제한다.
    document.forms["frm"].sel.options.length = 0;
}

</script>
</head>



<body>

<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
 
<table class="table table-sm table-hover table-dark">
		<tr>
			<td colspan="7" class="title">게시판 목록</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>테이블명</th>
			<th>게시판이름</th>
			<th>읽기권한</th>
			<th>쓰기권한</th>
			<th>댓글권한</th>
			<th>파일권한</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="7" align="center">
					등록된 게시판이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }" varStatus="vs">
				<tr align="center" class="subject" onclick="location.href='${pageContext.request.contextPath}/index?tb=${vo.tableName }&boardName=${vo.boardName }'">
					<td>${vo.idx }</td>
					<td>${vo.tableName }</td>
					<td>${vo.boardName }</td>
					<td>${vo.readLevel }</td>
					<td>${vo.writeLevel }</td>
					<td>${vo.commentLevel }</td>
					<td>${vo.fileLevel }</td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="7" style="border: none;text-align: right;">
				
				 <form action="${pageContext.request.contextPath }/adminInsert">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="게시판만들기" class="btn btn-success btn-sm">
		</form>
				 
			</td>
		</tr>
	
		
	</table>
	
<div class="adminDelete container">
 <form action="${pageContext.request.contextPath}/admin/deleteOk">
	 <select name="idx" class="form-control text-center" style="margin-left:220px; margin-bottom:30px; width: 500px;">
	<c:forEach var="vo" items="${list }" >
		<option value="${vo.idx }">${vo.boardName } 게시판을 삭제 합니다.</option>
	</c:forEach>
	</select>
<input type="submit" value="게시판삭제" class="btn btn-outline-primary btn-sm">
</div> 
<br><br>
	
  <a href="<c:url value="/logout" />" class="btn btn-outline-primary btn-sm">로그아웃</a>
  
</body>
</html>


<html>
  <head>
    <title></title>
    <sitemesh:write property='head'/>
    
    
  </head>
  <body>
    <sitemesh:write property='body'/>
  </body>
</html>
