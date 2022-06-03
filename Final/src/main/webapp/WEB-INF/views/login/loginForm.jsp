<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/login.css">
<form name="loginForm" id="loginForm" method="post" action="/login/login">
<div id="main-container">
	<h1>로그인</h1>
	<div id="main-wrap">
		<div id="welcomdeLogin">
			<span>Welcome! </span> 헥토몰에 오신 것을 환영합니다.
		</div>
		<section id="login-input-wrap">
			<div id="id-input-wrap">	
				<input type="text" id="id-input" name="userID" placeholder="아이디"></input>
			</div>
			<div id="pwd-input-wrap">	
				<input type="password" id="pwd-input" name="pwd" placeholder="비밀번호"></input>
			</div>
			<div id="login-button-wrap">
				<button type="submit" id="login-button" class="btn">로그인</button>
			</div>
		</section>
		
		<section id="easy-login-wrap">
			<!-- <ul>
				<li>
					<button type="button" id="kakao-login-btn" class="btn">
						<img src="/resources/image/kakao.png" alt="kakao">
						<span>카카오 로그인</span>
					</button>
				</li>
			</ul> -->
			<div id="result-div"> </div>
			<div id="find-write">
				<p><a href="">아이디 찾기</a></p> | 
				<p><a href="">비밀번호 찾기</a></p> | 
				<p><a href="/write/writeForm">회원가입</a></p>
			</div>
		</section>
	</div>
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/login.js"></script> -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>