<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
html, body {
	height: 100%;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	IMP.init("imp05633369"); // https://admin.iamport.kr/settings#tab_profile 가맹점 식별코드
	
	function kakaoPay() {
		IMP.request_pay({
			pg: 'kakaopay',
			pay_method : 'card', // 기능 없음.
			merchant_uid: 'merchant_'+new Date().getTime(), // 상점에서 관리하는 주문 번호
			name : '${payInfoVO.pd_name}',
			amount : ${payInfoVO.amount}, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
			customer_uid : '${payInfoVO.mem_email}', // 필수 입력
			buyer_email: '${payInfoVO.mem_email}',
			buyer_name: '${payInfoVO.mem_name}',
			buyer_tel: '${payInfoVO.mem_phoneNum}',
			buyer_addr: '${payInfoVO.order_address}',
	        buyer_postcode: '${payInfoVO.order_postcode}'
		}, function(rsp) {
			if ( rsp.success ) {
				alert('빌링키 발급 성공');
				$.ajax({
			        url: "./subResult.pm", 
			        type : "POST",
			        data: {
			          customer_uid: '${payInfoVO.mem_email}', // 카드(빌링키)와 1:1로 대응하는 값
			          price : ${payInfoVO.amount},
			          merchant_uid: 'merchant_'+new Date().getTime()
			        }
			      }).done(function(result) {
					alert("정기결제가 설정되었습니다")
					location.href="./subPayResult.pm"
				});
			} else {
				alert('빌링키 발급 실패');
			}
		});
	}

	function kgPay() {
		 
		IMP.request_pay({
			pg: 'html5_inicis',
			pay_method : 'card', // 기능 없음.
			merchant_uid: 'merchant_'+new Date().getTime(), // 상점에서 관리하는 주문 번호
			name : '${payInfoVO.pd_name}',
			amount : ${payInfoVO.amount}, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
			customer_uid : '${payInfoVO.mem_email}'+new Date().getTime(), // 필수 입력
			buyer_email: '${payInfoVO.mem_email}',
			buyer_name: '${payInfoVO.mem_name}',
			buyer_tel: '${payInfoVO.mem_phoneNum}',
			buyer_addr: '${payInfoVO.order_address}',
	        buyer_postcode: '${payInfoVO.order_postcode}'
		}, function(rsp) {
			if ( rsp.success ) {
				alert('빌링키 발급 성공');
				$.ajax({
			        url: "subResult.pm", 
			        method: "POST",
			        headers: { "Content-Type": "application/json" },
			        data: {
			          customer_uid: '${payInfoVO.mem_email}'+new Date().getTime(), // 카드(빌링키)와 1:1로 대응하는 값
			        }
			      }).done(function(result) {
					alert(result)
				});
			} else {
				alert('빌링키 발급 실패');
			}
		});
	   
	  }
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>  <!-- 헤더 들어가는 곳 -->
<div class="container h-100">
	<div class="row d-flex justify-content-center align-items-center h-100">
	        <div class="col-6 text-center">
				<div class="card">
					<img src="resources//assets/credit-card.png" alt="스탠다드패키지" class="card-img-top" onclick="kgPay()"/>
					<div class="card-body">
						<button class="btn btn-outline-success btn-block" onclick="kgPay()">카드결제</button><br>
					</div>
				</div>
	        </div>
	        <div class="col-6 text-center">
				<div class="card">
					<img src="resources//assets/payment_icon_yellow_large.png" alt="스탠다드패키지" class="card-img-top" onclick="kakaoPay()"/>
					<div class="card-body">
						<button class="btn btn-outline-warning btn-block" onclick="kakaoPay()">카카오페이</button><br>
					</div>
				</div>
	        </div>
	     
	</div>
</div>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>