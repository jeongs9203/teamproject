<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

	<main class="mt-3">
			<!-- 팝업창  -->
		<form action="productBasket.st" name="fr" method="post">
<!-- 		<form action="productCart.st" name="fr"> -->
			<input type="hidden" name ="pd_code"value="${productDetail.getPd_code()}">
			<input type="hidden" name ="mem_id"value="${sessionScope.sId }">
			<input type="hidden" name ="pd_price"value="${productDetail.getPd_price()}">
			<input type="hidden" name ="choiceCheck" id="choiceCheck">
			<div class="container" >
				<div class="row">
					<div class="col-md-4">
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
							<div class="carousel-indicators">
						    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						  	</div>
						  	<div class="carousel-inner">
						    	<div class="carousel-item active">
						    		<!-- 임시 사진 -->
						     		<img src="${pageContext.request.contextPath}/resources/img/pic2.png" class="d-block w-100" alt="...">
						    	</div>
						   		<div class="carousel-item">
						   			<!-- 임시 사진 -->
						      		<img src="${pageContext.request.contextPath}/resources/img/pic2.png" class="d-block w-100" alt="...">
						    	</div>
						    	<div class="carousel-item">
						    		<!-- 임시 사진 -->
						      		<img src="${pageContext.request.contextPath}/resources/img/pic2.png" class="d-block w-100" alt="...">
						   		 </div>
						  	</div>
						  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    	<span class="visually-hidden">Previous</span>
						  	</button>
						  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						  		<span class="carousel-control-next-icon" aria-hidden="true"></span>
						    	<span class="visually-hidden">Next</span>
						  	</button>
						</div>
					</div>
					<div class="col-md-8">
						<div class="card shadow-sm" >
							<div class="card-body">
								<h5 class="card-title" >${productDetail.getPd_name() }</h5>
								<fieldset id="star"> 
									<c:forEach begin="1" end="${reviewAvg }" step="1">
										<label>★</label>
									</c:forEach>
									<span id="count">(${reviewCount })</span>
								</fieldset>
								<h5 class="card-title pt-3 pb-3 border-top"><fmt:formatNumber value="${productDetail.getPd_price() }" pattern="#,###원" /></h5>
								<p class="card-text border-top pt-3">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:parseDate var="rdate" value="${productDetail.getPd_rdate() }" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="now" />
									<fmt:formatDate value="${rdate}" pattern="yyyyMMdd" var="rdate" />
									<c:if test="${now le rdate + 14}">
										<span class="badge bg-dark">new</span>
									</c:if>
									<span class="badge bg-dark">best</span>
									<span class="badge bg-dark">정보3</span>
								</p>
								<p class="card-text pb-3">
									배송비 2,500원 | 도서산간(제주도) 배송비 추가 5,000원 | 택배배송 | 5일 이내 출고 (주말,공휴일 제외)
								</p>
								<p class="card-text border-top pb-3">
									<div class="row">
										<div class="col-auto">
											<label class="col-form-label">구매수량</label>
										</div>
										<div class="col-auto">
											<c:choose>
												<c:when test="${productDetail.getPd_stock() == 0 }">
													<div class="input-group">
														<input type="text" class="form-control" style="width:90px;" value="${productDetail.getPd_state() }" readonly="readonly">
													</div>
												</c:when>
												<c:otherwise>
													<div class="input-group" >
														<input type="hidden" id="stock" value="${articleDetail.getPd_stock() }" >
														<span type="button" class="input-group-text" onclick="del()">-</span>
	                                       				<input type="text" name="bk_qty" id="bk_qty" value="1" class="form-control" style="width:45px; text-align:center;" onchange="change();">
	                                     				<span type="button" class="input-group-text" onclick="add()">+</span>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</p>	
								<div class="row pt-3 pb-3 border-top">
									<div class="col-6">
										<h3>총 상품 금액</h3>
									</div>
									<div class="col-6" style="text-align: right;">
										<c:choose>
										<c:when test="${productDetail.getPd_stock() == 0 }">
	                                		<input type="text" name="sum" id="sum" size="7" value="0" readonly><span id="sum">원</span>
										</c:when>
										<c:otherwise>
											<input type="hidden" name="sell_price" value="${productDetail.getPd_price() }" size="11" readonly>
	                                		<input type="text" name="sum" id="sum" size="7" value="${productDetail.getPd_price() }" readonly><span id="sum">원</span>
										</c:otherwise>
									</c:choose>
										
									</div>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<c:choose>
										<c:when test="${productDetail.getPd_stock() == 0 }">
											<div class="col-6 d-grid p-1">
												<button type="button" class="btn btn-lg btn-dark" onclick="stock()">장바구니담기</button>
											</div>
											<div class="col-6 d-grid p-1">
												<button type="button" class="btn btn-lg btn-danger" onclick="stock()">주문하기</button>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-6 d-grid p-1">
												<button type="button" value="submit" onclick="choice()" class="btn btn-lg btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">장바구니담기</button>
<!-- 												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Launch demo modal</button> -->
<!-- 												<button type="submit" class="btn btn-lg btn-dark" >장바구니담기</button> -->
											</div>
											<div class="col-6 d-grid p-1">
												<button type="button" class="btn btn-lg btn-danger">주문하기</button>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<c:choose>
				<c:when test="${not empty sessionScope.sId}">
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-80size modal-center">
					    	<div class="modal-content">
					    		<div class="modal-header">
					          		<h5 class="modal-title" id="exampleModalLabel">장바구니에 상품이 정상적으로 담겼습니다.</h5>
					          		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cartChoice('close')"></button>
					      		</div>
						      	<div class="modal-body">
<%-- 					      	  		<img src="${productDetail.getPd_img() }" id="image"> --%>
									<!-- 임시 사진 -->
									<img src="${pageContext.request.contextPath}/resources/img/pic2.png" id="image">
					      	  		<div id="na">상품코드 :</div>
					          		<div id="cr">${productDetail.getPd_code() }</div>
					      	  		<div id="na">상품명 :</div>
					          		<div id="cr">${productDetail.getPd_name() }</div>
					      		</div>
					      		<div class="modal-footer">
					       	  		<input type="button" value="장바구니 이동" class="btn btn-outline-dark" onclick="cartChoice('cart')">
							  		<input type="button" value="쇼핑 계속하기" class="btn btn-outline-dark" onclick="cartChoice('list')">
					      		</div>
					   		</div>
					  	</div>
					</div>
				</c:when>
			</c:choose>
		</form>

		<div class="container">
			<div class="row nav" style="margin: 100px 0 0 0">
				<nav id="middle_nav">
					<ul class="nav justify-content-center nav-tabs">
						<li class="nav-item" id="about"><a class="nav-link h5"
							aria-current="page">DETAIL</a></li>
						<li class="nav-item" id="review"><a class="nav-link h5">REVIEW</a>
						</li>
						<li class="nav-item" id="qna"><a class="nav-link h5">Q&A</a>
						</li>
					</ul>
				</nav>
			</div>



			<div class="row" style="margin: 50px 0;">
				<h1 class="jumbotron">
					<div class="container">
						<h1>Hello world</h1>
						<small>This is product page.</small>
					</div>
				</h1>
			</div>

			<div class="row about_product" style="text-align: center;">
				<h1 class="page-header">상품 상세</h1>
			</div>
			<div class="row reviews" style="text-align: center; margin: 80px 0;">
				<h1 class="page-header" style="margin-bottom: 50px;">Review</h1>

				<!-- 			리뷰 네비게이션 -->
				<ul class="nav justify-content-end" id="select">
					<li class="nav-item" value="pre" id="pre"><a
						href="javascript:pre();" class="nav-link text-muted">최신순</a></li>
					<li class="nav-item" value="avg" id="avg"><a
						href="javascript:avg();" class="nav-link text-muted">평점순</a></li>
				</ul>

				<input type="hidden" value="${pageInfo.getListCount() }" class="listCount"> 
				<input type="hidden" value="${productDetail.getPd_code()}" class="pd_code">

				<div class="resultArea1">
					<c:if test="${not empty productReviewList}">
						<c:forEach var="review" items="${productReviewList }">
							<div class="card mb-3" style="max-width: 100%;">
								<div class="row g-0">
									<div class="col-md-4">
										<!-- 임시 사진 -->
										<img src="${pageContext.request.contextPath}/resources/img/pic2.png"
											style="width: 150px; height: 180px;"
											class="img-fluid rounded-start" alt="...">
<%-- 										<img src="${review.getRe_img() }" --%>
<!-- 											style="width: 150px; height: 180px;" -->
<!-- 											class="img-fluid rounded-start" alt="..."> -->
									</div>
									<div class="col-md-8">
										<div class="card-body">
<%-- 											<h5 class="card-title">${review.getRe_score() }</h5> --%>
											<fieldset id="star"> 
												<c:forEach begin="1" end="${review.getRe_score() }" step="1">
													<label>★</label>
												</c:forEach>
											</fieldset>
											<p class="card-text">
												<small class="text-muted">${review.getRe_mem_id() }</small>
											</p>
											<p class="card-text">${review.getRe_title() }</p>
											<p class="card-text">
												<small class="text-muted">${review.getRe_comment() }</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
<!-- 				<div class="resultArea2"> -->
				
<!-- 				</div> -->
				
			</div>

			<div class="row qnas" style="text-align: center; margin: 80px 0;">
				<h1 class="page-header" style="margin-bottom: 50px;">상품 Q&A</h1>
				<div>
					<jsp:include page="./instructionProduct.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>