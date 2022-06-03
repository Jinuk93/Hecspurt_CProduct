<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/css/writeAgreeForm.css">

  <form id="memberWriteForm" action="/write/writeForm" method="post">
    <ul id="memberWriteBox">
      <li id="memberWriteLi">
        <p id="memberWriteTitle">회원가입</p>
      </li>
      <div align="center">
        <img src="/resources/image/logo.png" id="image1">
      </div>
      <li id="memberWriteContent">
          <ul>
            <li>헥토몰에 오신 것을 환영합니다.</li>
            <li>본인인증 없이 간편하게 가입하실 수 있습니다</li>
            <li>(만14세 이상 가입 가능)</li>
          </ul>
      </li>
      <li id="blankSpace"></li>
      <li class="blankLi">
        <div class="labelName">
          <p>ID <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteId" name="userID" placeholder="영문,숫자포함 5~10자">
          <input type="hidden" id="checkId" val="">
          <div id="idDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>비밀번호 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="password" id="memberWritePwd" name="pwd" placeholder="영문,숫자,특수문자 포함 8~16자">
          <div id="pwdDiv" style="width:20%; display:inline;"></div>
        </div>  
      </li>
    
      <li class="blankLi">
        <div class="labelName">
          <p>이름 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteName" name="uName" placeholder="한글만 적어주세요">
          <div id="nameDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
          <li class="blankLi">
        <div class="labelName">
          <p>주소 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteName" name="address" placeholder="한글만 적어주세요">
          <div id="nameDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>휴대폰 번호 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <!-- <select id="writeTel1" name="tel1">
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
              <option value="018">018</option>
              <option value="019">019</option>
          </select> -  -->
        <!-- <input type="text" id="writeTel2" name="tel2"> - --> 
        <input type="text" id="writeTel3" name="tell">
      </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>이메일 주소 <span>*</span></p>
        </div>
        <div class="writeInputText">
          	<input type="text" id="memberWriteEmail" name="email">
			<!-- @ -->
			<!-- <input type="text" id="memberWriteEmail1" name="email2" list="email2" placeholder="직접입력"> -->
			<!-- <datalist id="email2" name="email2">
				<option value="naver.com">naver.com
				<option value="daum.net">daum.net
				<option value="gmail.com">gmail.com
			</datalist> -->
		<!-- 	<input type="button" id="athntEmail" class="btn" value="인증메일 전송"> -->
        </div>
      </li>
      <li class="blankLi athntHide">
        <div class="labelName">
          <p>이메일 인증번호<span>*</span></p>
        </div>
        <div align="center" id="athnt" class="writeInputText">
      		<input type="text" id="athntNmbr">
      		<input type="button" id="athBtn" value="인증" class="btn"> <div id="athDiv" style="width:20%; display:inline;"></div>
      	</div>
      </li>
      <li style="height: 30px;">
      	<div>
			<div id="emailDiv"></div>   	
       	</div>
      </li>
      <li style="height:80px;">
        <div align="center">
          <input type="submit" id="memberWriteBtn" class="btn" value="회원가입">
          <input type="reset" id="memberWriteReset" class="btn" value="취소">
        </div>
      </li>
    </ul>
  </form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/write.js"></script> -->