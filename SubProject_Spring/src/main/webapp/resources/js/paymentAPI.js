	var IMP = window.IMP; // 생략 가능
	IMP.init("imp74403648"); // https://admin.iamport.kr/settings#tab_profile 가맹점 식별코드
	
	//카카오페이
function kakaoPay() {

	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ // param
		pg: 'kakaopay', // 결제할 pg사 간편결제 카카오페이 테스트모드 ON 가맹점코드 일반결제용
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(), // 주문번호
		name: '파댕이', // 상품명
		amount: 100, // 가격
		buyer_email: 'lhj6346@gmail.com',
		buyer_name: '이현진',
		buyer_tel: '010-5771-6061',
		buyer_addr: '부산시 강서구',
		buyer_postcode: '46723'
	}, function(rsp) { // callback
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid; 
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			// 결제 성공 시 로직,

		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			// 결제 실패 시 로직,
		}
		alert(msg);
	});
}
  
  	//토스페이
function tossPay() {

	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ // param
		pg: 'tosspay', // 결제할 pg사 간편결제 토스
		// PG 상점 아이디 tosstest
		// apikey sk_test_w5lNQylNqa5lNQe013Nq
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(), // 주문번호
		name: '파댕이', // 상품명
		amount: 100, // 가격
		buyer_email: 'lhj6346@gmail.com',
		buyer_name: '이현진',
		buyer_tel: '010-5771-6061',
		buyer_addr: '부산시 강서구',
		buyer_postcode: '46723'
	}, function(rsp) { // callback
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			// 결제 성공 시 로직,

		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			// 결제 실패 시 로직,
		}
		alert(msg);
	});
}

//일반 카드 결제  
function kgPay() {

	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ // param
		pg: 'html5_inicis', // 결제할 pg사
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(), // 주문번호
		name: '파댕이', // 상품명
		amount: 100, // 가격
		buyer_email: 'lhj6346@gmail.com',
		buyer_name: '이현진',
		buyer_tel: '010-5771-6061',
		buyer_addr: '부산시 강서구',
		buyer_postcode: '46723'
	}, function(rsp) { // callback
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			// 결제 성공 시 로직,

		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			// 결제 실패 시 로직,
		}
		alert(msg);
	});
}
