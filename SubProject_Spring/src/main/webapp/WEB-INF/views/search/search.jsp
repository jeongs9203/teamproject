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
	
		<!-- 배너 -->
	<div class="mainBanner">
		<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="3000">
					<header class="bg-primary py-5">
						<div class="container px-4 px-lg-5 my-5">
				        	<div class="text-center text-dark">
				                <h1 class="display-4 fw-bolder">회원 가입 하러 가기</h1>
				                <p class="lead fw-normal text-dark-50 mb-0">신규 회원 가입 시 5000포인트를 드려요!</p>
				            </div>
				        </div>
			    	</header>
				</div>
				<div class="carousel-item" data-bs-interval="3000">
					<header class="bg-secondary py-5">
						<div class="container px-4 px-lg-5 my-5">
				        	<div class="text-center text-dark">
				                <h1 class="display-4 fw-bolder">베스트 상품 보러 가기</h1>
				                <p class="lead fw-normal text-dark-50 mb-0">인기 상품만 모아모아 보여드려요!</p>
				            </div>
				        </div>
			    	</header>
				</div>
				<div class="carousel-item" data-bs-interval="3000">
					<header class="bg-danger py-5">
						<div class="container px-4 px-lg-5 my-5">
				        	<div class="text-center text-dark">
				                <h1 class="display-4 fw-bolder">정기 구독하러 가기</h1>
				                <p class="lead fw-normal text-dark-50 mb-0">한 달을 특별하게 해주는 가장 편리한 방법!</p>
				            </div>
				        </div>
			    	</header>
				</div>
			</div>
		</div>
	</div>
	
	<main class="mt-3" >
		<div class="container" >
			<div class="row mb-2">
				<div class="col-12">
				${listCount } 건의 결과가 있어요
				</div>
			</div>
				<div class="row g-3" >
					<c:if test="${not empty productList}">
						<c:forEach var="product" items="${productList }">
							<div class="col-lg-3 col-md-6">
								<div class="card" style="width: 18rem;" onclick="location.href='productDetail.st?pd_code=${product.getPd_code() }'">
									<img src="${product.getPd_img() }" alt="...">
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
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>