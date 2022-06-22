<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div id="page-wrapper">
<jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <form action="">
      	<table class="table">
			<tr><td>아이디</td><td>${memberVO.mem_id}</td></tr>
			<tr><td>이름</td><td>${memberVO.mem_name}</td></tr>
			<tr><td>생년월일</td><td>${memberVO.mem_birth}</td></tr>
			<tr><td>성별</td><td>${memberVO.mem_gender}</td></tr>
			<tr><td>email</td><td>${memberVO.mem_email}</td></tr>
			<tr><td>전화번호</td><td>${memberVO.mem_phoneNum}</td></tr>
			<tr><td>주소</td><td>${memberVO.mem_address }</td></tr>
			<tr><td>멤버쉽등급</td><td>${memberVO.mem_grade }</td></tr>
      	</table>
      </form>
<!--       	<button type="submit" class="btn btn-secondary">수정하기</button> -->
    </div>
  </div>
  <!-- /본문 -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>