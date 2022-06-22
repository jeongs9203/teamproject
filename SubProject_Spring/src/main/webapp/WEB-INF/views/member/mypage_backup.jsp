<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mypage_menu {
text-align: center;
float: left;
box-sizing: border-box;
width:20%;
height: 100%;
background-color:gray;
}

#mainPanel {
text-align: center;
float: left;
}
</style>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div id="mypage_menu">
	<table border='1'>
		<tr><th>전체 목록</th></tr>
		<tr><td>회원정보</td></tr>
		<tr><td>회원수정</td></tr>
		<tr><td>장바구니</td></tr>
		<tr><td>주문목록</td></tr>
		<tr><td>후기작성</td></tr>
	</table>
</div>
<div id="mainPanel">
<h1>본문</h1>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>