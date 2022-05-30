<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<meta charset="UTF-8">
<style type="text/css">
#footerBody {
	margin: 0;
	padding: 0; 
	width: 100%;
	height: 100%;
	transition: all .3s all .3s cubic-bezier(0.16, 0.04, 0.03, 0.95);
}
#footerBody #footer {
	margin: 0;
	text-align: center;
	background: black;
}
#footerBody .footerGroup ul {
	margin: .8rem;	
}
#footerBody .footerGroup li {
	display: inline;
	padding: 0 7px 0 10px;
	white-space: nowrap;	  
}
#footerBody .footerMenu {
	font-size: 16px;
	font-weight: 600;
	color: white;
    padding-top: 3.2rem; 	
}
#footerBody .footerInfo {
	font-size: 12px;
	color: silver;
	padding-top: .2rem;
}
#footerBody .footerInfo li {
	position: relative;
}
#footerBody .footerInfo li:before {
	content:'';
	width: 1px;
	height:12px;
	background-color: #dbdbdb;
	position: absolute;
	left:0;
	top:2px;
}
#footerBody .footerInfo li:first-child:before {
	width:0;
}
#footerBody .footerCopy{
	font-size: 12px;
	color: silver;
	padding-top: .5rem;
	padding-bottom: 2.rem;
}
#footerBody .footerMenu a:link { color: white; text-decoration: none; }
#footerBody .footerMenu a:visited { color: white; text-decoration: none; }
#footerBody .footerMenu a:hover { color: #f5ce3e; text-decoration: underline; }
#footerBody .footerMenu a:active { color: white; text-decoration: none; }

}
</style>											
<body id="footerBody">
	<footer id="footer">
		<div class="container">
				<div class="footerGroup">
					<div class="footerMenu">
						<ul>
							<li><a href="#">이용약관</a> &nbsp;&ensp;&ensp;&ensp;&ensp; </li>	 
							<li><a href="#">개인정보처리방침</a> &nbsp;&ensp;&ensp;&ensp;&ensp; </li> 
							<li><a href="#">위치기반 서비스 이용약관</a> &nbsp;&ensp;&ensp;&ensp;&ensp; </li> 
							<li><a href="#">이메일 무단수집거부</a> &nbsp;&ensp;&ensp;&ensp;&ensp; </li>
							<li><a href="#">FAQ</a>  &nbsp;&ensp;&ensp;&ensp;&ensp; </li> 
							<li><a href="#">매장찾기</a> &nbsp;&ensp; </li>
						</ul>
					</div>
					<div class="footerInfo">
						<ul>
							<li>&ensp;&ensp; 대표이사 : 계명성 &ensp;&ensp; </li>
							<li>&ensp;&ensp;  개인정보보호책임자 : 김민주 &ensp;&ensp; </li>
							<li>&ensp;&ensp;  대표이사의 오른팔 : 김진욱  &ensp;&ensp;</li>
							<li>&ensp;&ensp;  대표이메일 abc@gmail.com </li>
						</ul>
					</div>
					<div class="footerCopy">
						<span> Copyright &copy; <b> 2022 HTmall Company.</b> </span>  
					    <span>&ensp; All Rights Reserved.</span>
					</div>
				<br><br>
			</div>
		</div>
	</footer>
</body>
