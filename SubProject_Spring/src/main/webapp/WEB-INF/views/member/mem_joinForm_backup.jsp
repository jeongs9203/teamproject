<%@page import="com.springProject.subProject.mail.GenerateAuthenticationCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%GenerateAuthenticationCode genCode = new GenerateAuthenticationCode();
String mem_auth_code = genCode.getAuthenticationCode(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/joinFunc.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<section class="join-form">
	<!-- <h1>JOIN</h1> -->
	<form action="mem_join.me" name ="fr" method="post">
		<input type="hidden" name="mem_auth_code" value="<%=mem_auth_code%>">
		<div class="int-area">
			<input type="text" name="mem_id" id="id" autocomplete="off" required="required" readonly>
			<label for="id">아이디(필수)</label>	<!-- 아이디 중복방지 -->	
			<input type="button" value="아이디 중복 확인" class="dup" id="btn" onclick="checkDuplicateId()"><br>				
		</div>
		<div class="int-area">
			<input type="password" name="mem_password" id="passwd" autocomplete="off" required="required"  onkeyup="checkPass(this.value)">
<!-- 			<label for="email_input">필수정보입니다!</label> -->
			<label for="id">비밀번호(필수)</label>	<!-- 정규표현식 -->					
		</div>
		<span id="passResult" class="passResult"></span>
		<div class="int-area">
			<input type="password" name="mem_password2" id="passwd2" autocomplete="off" required="required"  onkeyup="checkRetypePass(this.value)">
<!-- 			<label for="email_input">필수정보입니다!</label> -->
			<label for="id">비밀번호 재확인(필수)</label>	<!-- 정규표현식 -->					
		</div>
		<span id="checkRetypePassResult" class="checkRetypePassResult"></span>
		<div class="int-area">
			<input type="text" name="mem_name" id="name" autocomplete="off" required="required">
			<label for="id">이름(필수)</label>					
		</div>
		<div class="date">
			<input type="text" name="mem_year" id="year" autocomplete="off"  placeholder="년(4자)">&nbsp;&nbsp;
			<select onselect="" id="selectMon" name="mem_month">
					<option value="">월</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			</select> &nbsp;&nbsp;
			<input type="text" name="mem_day" id="day" autocomplete="off"  placeholder="일">
<!-- 			<label for="id">생년월일</label>				 -->
		</div>
		<div class="int-area">
<!-- 			<input type="radio" value="남" name="mem_gender" id="gender">남 -->
<!-- 			<input type="radio" value="여" name="mem_gender" id="gender">여 -->
			<select id="selectGender" name="mem_gender">
				<option value="">선택안함</option>
				<option value="남">남</option>
				<option value="여">여</option>
			</select>
<!-- 			<label for="id">성별</label>					 -->
		</div>
		<div class="int-area">
			<input type="text" name="mem_mailAdd" id="email">@<input type="text" name="domain" id="domain"  >&nbsp;
<!-- 			<label for="id">이메일</label>					 -->
			<select id="sDomain" onchange="selectDomain(this.value)">
					<option value="">선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="daum.net">daum.net</option>
				</select>
		</div>
		<div class="int-area">
			<input type="button" value="메일 인증" class="mail_btn" id="mail_btn">				
<!-- 			<input type="text" name="mem_auth" id="auth" autocomplete="off" required="required"> -->
<!-- 			<label for="id">메일 인증</label>	아이디 중복방지	 -->
		</div>
		<div class="phone">
			<select id="selectPhoneCode" name="mem_phoneF">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
			</select>-
			<input type="text" name="mem_phoneM" id="phone1" autocomplete="off">-
			<input type="text" name="mem_phoneL" id="phone2" autocomplete="off" >
<!-- 			<label for="id">전화번호</label>						 -->
		</div>
		<div class="int-area">
			<input type="text" name="mem_postcode" id="postcode" autocomplete="off">
			<input type="button" value="주소검색" id="postcode_se" onclick="postCodeSearch()">
			<input type="text" id="address" name="address"><input type="text" id="add_detail" name="add_detail" placeholder="상세주소 입력">
<!-- 			<label for="id">주소</label>					 -->
		</div>
		<div class="btn-area" >
			<button type="submit" id="btn">회원가입</button>
		</div>
	</form>
	</section>
</body>
</html>