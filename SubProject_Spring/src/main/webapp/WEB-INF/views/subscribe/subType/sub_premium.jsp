<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
.bg-cover {
    background-size: cover !important;
}

body {
    min-height: 100vh;
}
</style>
</head>
<body>
	<jsp:include page="../../inc/header.jsp"/>  <!-- 헤더 들어가는 곳 -->
	<c:set var="pd_code" value="pre"></c:set>
	<div style="background: url(resources/assets/premiumPage.jpg)" class="jumbotron bg-cover text-white">
    <div class="container py-5 text-center">
        <h1 class="display-4 font-weight-bold">프리미엄 구독</h1>
        <p class="font-italic mb-0">스탠다드 구독 상품은 제철 식품과 시기에 맞춘 컨셉의 밀키트와 밀키트에 맞는 전통주를 페어링하여 제공합니다</p>
<!--         <p class="font-italic">Snippe by -->
<!--             <a href="https://bootstrapious.com" class="text-white"> -->
<!--                 <u>Bootstrapious</u> -->
<!--             </a> -->
        </p>
        <a href="sub_order.sub?pd_code=${pd_code }" role="button" class="btn btn-primary px-5">구독하기</a>
    </div>
</div>

<!-- For Demo Purpose -->
<div class="container py-5">
    <h2 class="h3 font-weight-bold">Some demo content</h2>
    <div class="row">
        <div class="col-lg-10 mb-4">
            <p class="font-italic text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.</p>
            <p class="font-italic text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.</p>
        </div>
        <div class="col-lg-8">
            <p class="font-italic text-muted">Lorem ipsum dolor sit amet, consectetur <strong class="font-weight-bold text-dark">adipisicing elit, sed </strong>do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in <strong class="font-weight-bold text-dark">reprehenderit in voluptate </strong>velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
    </div>
</div>
	
	
	
	
	
	
	
	
<!-- 	<h1>sub_standard.jsp</h1> -->
	
<!-- 	<div id="standard_img"><img src=""></div> -->
<!-- 	<p>스탠다드 패키지</p> -->
<!-- 	<p>상품 구성</p> -->
<!-- 	<p>상품 설명</p> -->
<!-- 	<p>상품 가격</p> -->
	
<!-- 	<p>이런 분들께 추천드려요!</p> -->
	
<!-- 	<input type="button" value="구독하기" onclick="location.href='sub_volume.sub'">  클릭 시 수량/개수 선택하는 페이지로 이동  -->
	
<!-- 	<p>결제일과 배송일</p> -->
	
<!-- 	<p>스탠다드 패키지와 함께하면 좋은 상품들</p> -->
<!-- 	<input type="button" value="스토어 이동" onclick="location.href=''"> -->
	
	<jsp:include page="../../inc/footer.jsp"/>  <!-- 푸터 들어가는 곳 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>