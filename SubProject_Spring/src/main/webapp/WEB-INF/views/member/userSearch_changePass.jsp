<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/joinFunc.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="card text-center">
		<div class="card-header">비밀번호찾기</div>
		<div class="card-body">
			<h5 class="card-title">고객님의 새 비밀번호를 변경해주세요.</h5>
			<form action="changePass.me" method="post" name ="fr" onsubmit="return checkForm()">
				<!-- 			<input type="text" name="mem_password" placeholder="새 비밀번호" -->
				<!-- 				required="required" class="card-text"><br> -->
				<input type="hidden" name="mem_name" value="${mem_name }">
				<input type="hidden" name="mem_phoneNum" value="${mem_phoneNum }">
				<input type="hidden" name="mem_email" value="${mem_email }">
				<input type="text" name="mem_password" id="passwd" placeholder="새 비밀번호"
					class="card-text" style="font-weight: bold; font-size: 20px" onkeyup="checkPass(this.value)"><br>
				<span id="passResult" class="passResult"></span><br>	
				<input type="text" name="mem_password2" id="passwd2" placeholder="새 비밀번호(재확인)"
					class="card-text" style="font-weight: bold; font-size: 20px" onkeyup="checkRetypePass(this.value)"><br>
				<span id="checkRetypePassResult" class="checkRetypePassResult"></span><br>
				<input type="submit" class="btn btn-primary" value="비밀번호 변경">
			</form>
			<!-- 			<a href=""	class="btn btn-primary">홈으로</a> -->
		</div>
	</div>
</body>
</html>