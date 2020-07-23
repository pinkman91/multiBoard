<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.newsLink').click(function(){
		window.open("https://news.google.com/topstories?hl=ko&gl=KR&ceid=KR:ko");
	});
	$('.searchLink').click(function(){
		window.open("http://www.google.com");
	});

	$('.hideLogin').val("");
});
</script>
<title>FreeCommunity<sitemesh:write property='title'/></title>
    <style type='text/css'>
      /* Some CSS */
     
	body {
		margin: 0 auto;
  		font-family: arial, sans-serif; background-color: white; }
	.centerBody{
		width: 100%; margin:0 auto;
		}
    .mainBody { 
		width: 1000px; margin:0 auto;
        padding: 10px; border: 1px solid #ffffff; 
        }
     .disclaimer { 
     	text-align: center; border-top: 1px solid #cccccc;
        margin-top: 100px; color: black; font-size: smaller; 
        clear: both; 
        }
     #mainLogo{
     		width: 300px;
     		height: 50px;
     }
	 .mainNav{
	 	width: 100%;
	 	height: 50px;
	 	background-color:red;
	 
	 }
	 .mainNavList{
			width: 1200px;
	 		margin: 0 auto;
	 }
	 ul{
	 	list-style: none;
	 }
	 
	 #navA:link { color: white; text-decoration: none;}
	 #navA:visited { color: white; text-decoration: none;}
	 #navA:hover { color: yellow; cursor:pointer;}
	 .newsLink:hover { color: yellow; text-decoration: underline;  cursor:pointer;}
	 .newsLink{ color:white;}
	 .searchLink:hover { color: yellow; text-decoration: underline;  cursor:pointer;}
	 .searchLink{ color:white;}
	 .mainNav>div>ul>li{
	 		width:100px;
	 		height:50px;
	 		float: left;
	 }
    </style>
    <sitemesh:write property='head'/>
    
  </head>
  <body class="text-center">

    <!-- <div class="centerBody"><h1 class='title'><sitemesh:write property='title'/></h1></div> -->
	<div class="centerBody"><a href="/board/"><img alt="커뮤니티게시판" id="mainLogo" src="resources/images/community.jpg"></a></div></br>
	<div class="mainNav navbar navbar-expand-sm bg-danger">
			<div class="mainNavList text-center">
				<ul class="text-center">
					<li><a href="${pageContext.request.contextPath}/index?tb=notice&boardName=공지사항%20게시판" id="navA" class="nav-link">공지사항</a></li>
					<li><span class="nav-link newsLink">구글뉴스</span></li>
					<li><span class="nav-link searchLink">구글검색</span></li>
					<li><a href="${pageContext.request.contextPath }/login" id="navA" class="nav-link">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/userSignUp" id="navA" class="nav-link" >회원가입</a></li>
		<c:set var="name" value="${user }" />
			<c:choose>
    			<c:when test="${name eq 'anonymousUser'}">
   		 			<li style=" width: 250px;" class="nav-link userWellcome" >로그인을 해주세요</li>
				</c:when>
				<c:when test="${name ne 'anonymousUser'}">
					<li style=" width: 250px;" class="nav-link userWellcome" >${user}님 환영합니다</li>
					<li style=" width: 200px;"><a href="<c:url value="/logout" />" id="navA"  class="nav-link userLogOut">로그아웃</a></li>
				</c:when>	 
			</c:choose>
			<c:choose>
    			<c:when test="${name eq 'admin'}">
   		 			<a href="${pageContext.request.contextPath}/admin" id="navA" class="adminGoPage nav-link"  >관리자 페이지로 이동</a>
				</c:when>	 
			</c:choose>
			
				</ul>
			</div>
	</div>
    
    
    
    
    <div class='mainBody'>
      <sitemesh:write property='body'/>
    </div>

    <div class='disclaimer'>어드민계정 -> ID: admin / PASSWORD : 1234

  </body>
</html>