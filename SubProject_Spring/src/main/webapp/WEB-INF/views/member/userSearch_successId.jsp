<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<!-- header -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="card text-center"
		style="width: 40rem; float: none; margin: 150px auto">
		<div class="card-header">아이디찾기</div>
		<div class="card-body">
			<h5 class="card-title">고객님의 정보와 일치하는 아이디입니다.</h5>
			<p class="card-text text-muted" style="font-weight: bold; font-size: 20px">${searchId }</p>
			<a href="login_form.me" class="btn btn-secondary">로그인 하기</a> <a
				href="userSearchPass.me" class="btn btn-success">비밀번호 찾기</a>
		</div>
	</div>
</body>
</html>