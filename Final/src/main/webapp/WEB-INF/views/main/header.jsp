<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style type="text/css">
@font-face {font-family:MalgunGothic; src:url(font/MalgunGothic.eot);}
html, body {
	width: 100%;
	height: 100%;
}
body { margin : 0; padding : 0; height: 3000px;}
#Allheader html { font-size: 18px; }
#Allheader body { font-size: 13pt; }
a { text-decoration-line: none; }
ul { list-style:none; }
#headerSection { background-color : rgba(255,255,255,0.5); overflow: hidden; position: fixed; top: 0; width:100%; height: 120px; z-index: 99;}

/* header의 전체메뉴 */
/* 가운데정렬 = { position: relative; width: 69rem; margin: 0 auto; } */
#Allheader header > div {  margin: 0 auto; padding: 24px 0 0 30px ; } 
/* header > div { position: relative; width: 69rem; margin: 0 auto; }  */
#Allheader header > div:after { content: ""; display: block; clear: both; }

/* 로고 */
#Allheader header > div h1 { float: left; padding: 1.5rem 0 0.1mres; margin: auto 0; }

/* 전체 스크롤 */
body::-webkit-scrollbar {
   width: 5px;
}
body::-webkit-scrollbar-thumb {
   background-color: #666;
   border-radius: 5px;
}
body::-webkit-scrollbar-track {
   background-color: #ccc;
}

/*header 하단메뉴*/
#Allheader header > div .menu {  font-size: 1rem; float: left; 
font-weight:bold; padding: 18px 0 10px 4rem; height: 95px;}
#Allheader header > div nav > ul > li { float: right; }
#Allheader header > div nav > ul > li > a { display: block; padding: 12px 1.7rem 0; height: .4rem; 
font-size: .9rem; color:#444; line-height: 100%;}

/*header 상단메뉴*/
#Allheader header > div .spot {  padding: 1.5rem 12rem 0 0; }
#Allheader header > div .spot li { float:right; position: relative; }
#Allheader header > div .spot li a { padding: 0 .5rem; font-size: .7rem; color:#333; 
line-height: 100%; text-align: left;}
</style>

<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<div id="Allheader">
	<header>
		<div>
			<h1><a href="/Final/"><img src="/Final/views/image/logo.jpg" alt="logo"></a></h1>
			<!-- 로고 -->
			<nav>
				<ul class="menu">
					<li><a href="">BOTTOM</a></li>		
					<li><a href="#">TOP</a></li>
					<li><a href="#">OUTER</a></li>
					<li><a href="#">BEST</a></li>
					<li><a href="#">NEW</a></li>
				</ul>
			</nav>
		 	<!--				header 로그인메뉴				-->
				<ul class="spot">
					<c:if test="${memId == null }">
						<li><a href="#"><span>Sign Up</span></a></li>
						<li><a href="../login/loginForm."><i class="xi-user"></i><span>Login</span></a></li>					
					</c:if>
					
					<c:if test="${memId != null }">
						<li><a href="#"><span>My Page</span></a></li>
						<li><a href="#"><span>Logout</span></a></li>
						<li><a href="#"><span>cart</span></a></li>
					</c:if>
				</ul>
			</div>
	  	</div>	
	</header>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>