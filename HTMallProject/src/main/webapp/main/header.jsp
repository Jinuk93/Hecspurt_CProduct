<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href=/HTMallProject/css/header.css">
</head>
<body>
	<div class="all_header"> <!-- 최상위 header div -->
		<a href="#"><img src="./image/mainlogo.PNG" alt="mainlogo"></a>
		<!-- 쇼핑몰 메인로고 -->
	<nav>
		<ul class="menu">
			
			<li><a href="">아우터</a>
				<ul class="middleMenu">
					<li><a href="?pg=1">자켓</a></li>
					<li><a href="?pg=1">점퍼</a></li>
					<li><a href="?pg=1">코트</a></li>
				</ul>
			</li>
			
			<li><a href="">상의</a>
				<ul class="middleMenu">
					<li><a href="?pg=1">티셔츠</a></li>
					<li><a href="?pg=1">셔츠</a></li>
					<li><a href="?pg=1">니트</a></li>
				</ul>
			</li>
			
			<li><a href="">하의</a>
				<ul class="middleMenu">
					<li><a href="?pg=1">반바지</a></li>
					<li><a href="?pg=1">슬랙스</a></li>
					<li><a href="?pg=1">트레이닝 팬츠</a></li>
				</ul>
			</li>
			
			<li><a href="">셋업</a>
				<ul class="middleMenu">
					<li><a href="?pg=1">스웨트</a></li>
					<li><a href="?pg=1">수트</a></li>
				</ul>
			</li>
			
			<li><a href="">이너웨어</a>
				<ul class="middleMenu">
					<li><a href="?pg=1">팬티</a></li>
					<li><a href="?pg=1">언더셔츠</a></li>
					<li><a href="?pg=1">파자마</a></li>
				</ul>
			</li>
			
		</ul>
	</nav>
	
	<!-- 로그인/회원가입 메뉴 -->
			<ul class="spot">
				<c:if test="${memId == null }"> <!-- 로그인을 안했을 경우 -->
					<li><a href=""><span>회원가입</span></a></li>
					<li><a href=""><i class="xi-user"></i><span>로그인</span></a></li>					
				</c:if>
					
				<c:if test="${memId != null }"> <!-- 로그인을 했을 경우 -->
					<li><a href=""><span>마이페이지</span></a></li>
					<li><a href=""><span>로그아웃</span></a></li>
					<li><a href=""><span>장바구니</span></a></li>
				</c:if>
			</ul>
	
	</div> <!-- 최상위 div로서, 맨 밑에 위치 -->
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/HTMallProject/js/header.js"></script>
</html>