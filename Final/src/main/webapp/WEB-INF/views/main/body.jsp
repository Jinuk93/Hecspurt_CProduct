<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/Final/resources/css/jquery.fullPage.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/body.css">	

<style type="text/css">
.section {  width:100%; height:100%; position:relative; color:#ffffff; font-size:24pt; }
.section .second_section_text { position:relative; top:26%; transform:translate(-47%, -50%); opacity:0;}  
.fp-completely .second_section_text, .fp-completely .text_container { animation:fade_in .5s  0s forwards;  }
@keyframes fade_in {
	0% { opacity:0; left:40%;}
	100% { opacity:1; left:50%;} 
}
</style>

<body>
<!-- 전체영역 -->
<div id="fullPage">

	<!-- FullPage -->
	<div id="fullpage">
		<section class="section" style="background-attachment: fixed;">
			<div class="sildeDiv">
				<ul>
					<li>
						<img src="./resources/image/pullscrollpic1.jpg" alt="imageSlide.jpg" id="pullscrollpic1">
					</li>
					<li>
						<img src="./resources/image/pullscrollpic2.jpg" alt="imageSlide.jpg" id="pullscrollpic2">
					</li>
					<li>
						<img src="./resources/image/pullscrollpic3.jpg" alt="imageSlide.jpg" id="pullscrollpic3">
					</li>
				</ul>
				<div id="dotDiv" style="text-align:center">
					<span class="dotSpan"></span> 
					<span class="dotSpan"></span> 
					<span class="dotSpan"></span> 
				</div>
			</div>
		</section>
		
		<section class="section">
			<div class="second_section_text">
				<h1>Pick Your Favorite</h1>
	
				<h2 style="white-space:pre-line;">
				다양한 상품을 헥토몰에서 즐겨보세요<br>
         		</h2>
			</div>
		</section>
		
		<section class="section">
		세번째내용
		</section>
	</div>	
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/jquery.fullPage.js"></script>
<script src="./resources/js/body.js"></script>
<script type="text/javascript"></script>
</body>
</html>