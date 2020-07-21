<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/common.js"></script>

<style type="text/css">
/* 여기에 스타일 추가 */
table {
	width: 900px;
	margin: auto;
}

th {
	padding: 5px;
	border: 1px solid gray;
	background: silver;
	text-align: center;
}

td {
	padding: 5px;
	border: 1px solid gray;
}

.title {
	font-size: 18pt;
	text-align: center;
	border: none;
}

.sub_title {
	font-size: 10pt;
	text-align: right;
	border: none;
}

.subject:hover {
	background-color: silver;
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
	<form action="${pageContext.request.contextPath}/admin/insertOK"
		method="post">
		<table>
			<tr>
				<td colspan="7" class="title">게시판 만들기</td>
			</tr>
			<tr>
				<td>테이블 이름</td>
				<td><input type="text" name="tableName" size="40"></td>
			</tr>
			<tr>
				<td>게시판 이름</td>
				<td><input type="text" name="boardName" size="40"></td>
			</tr>
			<tr>
				<td>읽기 권한</td>
				<td><select name="readLevel">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr>
				<td>쓰기 권한</td>
				<td><select name="writeLevel">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr>
				<td>댓글 권한</td>
				<td><select name="commentLevel">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr>
				<td>파일 권한</td>
				<td><select name="fileLevel">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="7" style="border: none; text-align: right;">

					<form action="${pageContext.request.contextPath }/admin/insert">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" value="게시판만들기"
							class="btn btn-success btn-sm">
					</form>

				</td>

			</tr>
		</table>
	</form>
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





