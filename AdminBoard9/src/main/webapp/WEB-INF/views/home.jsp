<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<html>
<head>
	<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js"></script>

<style type="text/css">
	/* 여기에 스타일 추가 */
	table{width: 1000px;margin: auto;}
	th {padding: 5px; border: 1px solid gray; background: silver;text-align: center;}
	td {padding: 5px; border: 1px solid gray;}
	.title {font-size: 18pt; text-align: center; border: none;}
	.sub_title {font-size: 10pt; text-align: right; border: none;}
	.subject:hover {
		background-color: silver;cursor: pointer;
	}
	.boardList{
		width:200px;
		float: left;
		margin: 5px;
		border: 1px;
	}
	.boardList:hover {
		cursor: pointer;
}
</style>
<script type="text/javascript">
	// 자바 스크립트 추가!!!
	$(function() {

	});
</script>
</head>
<body>

<c:forEach var="vo" items="${list }" varStatus="vs">
				<div><span class="boardList" onclick="location.href='${pageContext.request.contextPath}/index?tb=${vo.tableName }&boardName=${vo.boardName }'">
					${vo.boardName }
				</span></div>
</c:forEach>


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