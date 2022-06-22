<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="container">
      <h1 class="display-5">주문조회</h1>
    </div>
    <div class="container">
		<table class="table table-striped">
			<c:choose>
			<c:when test="${empty comment }">
				<thead>
					<tr class="text-center">
						<th scope="col">상품</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">주문금액</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
				<!--  주문목록  -->
					<c:forEach items="${list }" var="oc">
				    <tr class="text-center">
				      <td>${oc.pd_name }</td>
				      <td>${oc.pd_price }</td>
				      <td>${oc.order_qty }</td>
				      <td>${oc.totalprice }</td>
				      <td>${oc.order_status }</td>
				    </tr>
					</c:forEach>
				<!-- /주문목록  -->    
				</tbody>
			</c:when>
			<c:otherwise>
				<thead>
					<tr>
						<th scope="col">상품</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">주문금액</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
					<tr><td colspan="5" class="text-center">${comment }</td></tr>
				</tbody>
			</c:otherwise>
			</c:choose>
		</table>   	
    </div>
</div>
  <!-- /본문 -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>