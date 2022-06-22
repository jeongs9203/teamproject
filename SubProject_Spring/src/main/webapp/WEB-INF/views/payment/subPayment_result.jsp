<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>  <!-- 헤더 들어가는 곳 -->
<div class="container h-100">
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div class="col-3"></div>
	        <div class="col-6 text-center">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">결제완료</h5>
						<p class="card-text">
							정기구독 신청이 완료되었습니다
						</p>
						<a href="paymentSubResultMove.pm?code=inquiry" class="btn btn-success">주문내역</a>
						<a href="paymentSubResultMove.pm?code=home" class="btn btn-primary">홈으로</a>
					</div>
				</div>
	        </div>
		<div class="col-3"></div>       
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>