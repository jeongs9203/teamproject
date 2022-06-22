<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#menu_sub {
text-align:center;
width: 300px;
float: left
}
#menu_store {
text-align:center;
width: 300px;
float: left
}
#menu_cs {
text-align:center;
width: 300px;
float: left

}


</style>
</head>
<body id="headerBody">
	<div id="menu">
		<div id="menu_sub"><a href="">구독서비스</a></div>
		<div id="menu_store"><a href="">스토어</a></div>
		<div id="menu_cs"><a href="">고객센터</a></div>
	</div>
	<div>
		<c:choose>
			<c:when test="${empty sessionScope.sId }">
				<div><a href="login_form.me">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="join_form.me">회원가입</a></div>
			</c:when>
			<c:otherwise>
				<div><a href="">${sId }</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="mypage.me">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.me">로그아웃</a></div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>