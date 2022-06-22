<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./resources/js/store.js"></script>
<link href="./resources/css/subpage.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<main class="mt-3" >
		<div class="container" >
			<div class="row mb-2">
				<div class="col-12">
					<select class="form-select" id="selectBox" name="list" >
						<c:set var="select" value="${select }"></c:set>
						<option value="pre" <c:if test="${select eq null or select eq 'pre'}">selected</c:if>>최신순</option>
						<option value="avg" <c:if test="${select ne null and select eq 'avg'}">selected</c:if>>평점순</option>	
						<option value="low" <c:if test="${select ne null and select eq 'low'}">selected</c:if>>낮은가격순</option>	
						<option value="hei" <c:if test="${select ne null and select eq 'hei'}">selected</c:if>>높은가격순</option>
					</select>
				</div>
			</div>
				<div class="row g-3" >
					<c:if test="${not empty productList and pageInfo.getListCount() > 0}">
						<c:forEach var="product" items="${productList }">
							<div class="col-lg-3 col-md-6">
								<div class="card" style="width: 18rem;" onclick="location.href='productDetail.st?pd_code=${product.getPd_code() }'">
									<!-- 임시 사진 -->
									<img src="${pageContext.request.contextPath}/resources/img/pic2.png" id="image">
<%-- 									<img src="${product.getPd_img() }" alt="..."> --%>
									<div class="card-body">
										<h5 class="card-title">${product.getPd_name() }</h5>
										<p class="card-text"><fmt:formatNumber value="${product.getPd_price() }" pattern="#,###원" /></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
	</main>
	
	
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />
	
	<section id="pageList">
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='storeMain.st?pageNum=${pageNum - 1}&select=${select }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전" disabled="disabled">
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="storeMain.st?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value="다음" onclick="location.href='storeMain.st?pageNum=${pageNum + 1}&select=${select }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음" disabled="disabled">
			</c:otherwise>
		</c:choose>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>