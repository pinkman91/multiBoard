<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
  <head>
    <title>FreeComunity<sitemesh:write property='title'/></title>
    <style type='text/css'>
      /* Some CSS */
     
     body {
     		 margin: 0 auto;
     		 font-family: arial, sans-serif; background-color: white; }
     
     .centerBody{width: 1000px; margin:0 auto;}
     .mainBody { 
	 				width: 1000px; margin:0 auto;
     padding: 10px; border: 1px solid #ffffff; }
     .disclaimer { text-align: center; border-top: 1px solid #cccccc;
                   margin-top: 100px; color: PINK; font-size: smaller; 
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
			width:1000px;
	 		margin: 0 auto;
	 }
	 ul{
	 	list-style: none;
	 }
	 
	 	 #navA:link { color: red; text-decoration: none;}
		 #navA:visited { color: white; text-decoration: none;}
		 #navA:hover { color: yellow; text-decoration: underline;}
	 .mainNav>div>ul>li{
	 
	 		width:100px;
	 		height:50px;
	 		color:white;
	 		font-size:20px;
	 		float: left;
	 		
	 }
    </style>
    <sitemesh:write property='head'/>
    
  </head>
  <body>

    <!-- <div class="centerBody"><h1 class='title'><sitemesh:write property='title'/></h1></div> -->
	<div class="centerBody"><a href="/board/"><img alt="커뮤니티게시판" id="mainLogo" src="resources/images/COMUNITY.jpg"></a></div></br>
	<div class="mainNav">
			<div class="mainNavList">
				<ul>
					<li><a href="${pageContext.request.contextPath}/index?tb=notice&boardName=공지사항%20게시판" id="navA">공지사항</a></li>
					<li><a href="https://news.google.com/topstories?hl=ko&gl=KR&ceid=KR:ko" id="navA">뉴스</a></li>
					<li><a href="https://www.google.com/" id="navA">구글검색</a></li>
					<li><a href="${pageContext.request.contextPath }/login" id="navA">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/userSignUp" id="navA">회원가입</a></li>
					<li style="font-size:11px;">${user}님 환영합니다</li>
					<li style="font-size:11px;"><a href="<c:url value="/logout" />" id="navA">로그아웃</a></li>
				</ul>
			</div>
	</div>
    
    
    
    
    <div class='mainBody'>
      <sitemesh:write property='body'/>
    </div>

    <div class='disclaimer'>만든이 : LEE <a href="${pageContext.request.contextPath}/admin" id="navA">관리자 페이지로 이동</a></div>

  </body>
</html>