<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="./resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
//체크 버튼에 따라 휴대전화/이메일 인증 변경
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchI").style.display = "";
		document.getElementById("searchP").style.display = "none";
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

	// 휴대폰 인증번호 전송
	$(function() {
		$("#goSMS").on("click", function() { // 버튼을 클릭 했을 경우
// 			let authNumber = $("#authNumber").val(); // 사용자가 입력한 인증번호
			let mem_phoneNum = $("#mem_phoneNum").val(); // 사용자가 입력한 전화번호
			let authCode = $("#authCode"); //휴대폰 인증번호 담을 변수
			// 		사용자가 입력한 전화번호가 공백이 아니고, 8자리 이상일 경우
			if (mem_phoneNum != '' && mem_phoneNum.length > 8) {
				$.ajax({
					url : './userSearchPass1.me', // 요청보낼 url
					method : 'POST',
					data : {
						mem_phoneNum : mem_phoneNum
					}, // 사용자가 입력한 휴대폰번호 전송
					dataType : "text",
					success : function(response) {
// 						document.getElementById("authCode").val = response;
						authCode.attr('value', response); // authCode의 속성 value값을 인증번호로 설정
						console.log("input태그에 담긴 인증번호: " + authCode.val()); // 확인용

						alert('인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.');
// 						authNumber.readOnly = false;
						$("#authNumber").removeAttr("readonly"); 
					},
					error : function(response) {
						alert('인증번호 발송에 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.')
					}
				});
			} else {
				alert("휴대폰 번호를 입력 해 주세요");
				return false;
			}
		});
	});

	// 휴대폰 인증번호 확인
	$(function() {
		$("#confirmBnt").on('click', function() {
			let authNumber = $("#authNumber").val();
			let authCode = $("#authCode").val();
			let mem_name = $("#mem_name").val();
			let mem_phoneNum = $("#mem_phoneNum").val();
// 			alert(authNumber);
// 			alert(authCode);
			if (!mem_name) {
				alert('이름을 입력해 주세요.');
				mem_name.focus();
				return false;
			} else if (!mem_phoneNum) {
				alert('휴대전화번호를 입력해 주세요.');
				mem_phoneNum.focus();
				return false;
			} else if (authNumber != '' && parseInt(authNumber) > 0) { // val()로 받으면 문자열이기 때문에 형변환
			// 인증번호가 공백이 아니고 0 이상일 경우
				if (authNumber == authCode) { // 인증번호가 일치할때
					alert('휴대폰 번호 인증이 완료되었습니다. 감사합니다.');
					return true;
				} else {
					alert('인증번호가 일치하지 않습니다.');
// 					authNumber.focus();
					return false;
				}
				// 인증번호를 입력하지 않았을 경우
			} else {
				alert("휴대전화 인증을 받고 다시 시도해 주세요.");
				goSMS.focus();
				return false;
			}
		});
	});
	
	// 이메일 인증번호 전송
	$(function() {
		$("#goEmail").on("click", function() {
			let mem_email = $("#mem_email1").val();
			let authCode = $("#authCode"); // 이메일 인증번호 담을 변수
			alert("mem_email : " + mem_email);

			$.ajax({
				url : './userSearchPass2.me',
				method : 'post',
				data : {
					mem_email : mem_email
				},
				dataType : "text",
				success : function(response) {
					alert(response);
					authCode.attr('value', response); // authCode의 속성 value값을 인증번호로 설정
					console.log("input태그에 담긴 인증번호: " + authCode.val()); // 확인용
					alert("입력하신 이메일로 인증번호가 전송되었습니다.");
					$("#authNumber2").removeAttr("readonly"); 
				},
				error : function() {
					alert("인증번호 발송에 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.");
				}
			});
		
		});
	});

		// 이메일 인증번호 확인
		$(function() {
			$("#confirmBnt2").on("click", function() {
				let authNumber2 = $("#authNumber2").val();
				let authCode = $("#authCode").val();
				let mem_name = $("#mem_name1").val();
				let mem_email = $("#mem_email1").val();
// 	 			alert(authNumber2);
// 	 			alert(authCode);
// 	 			alert(mem_name);
				if (!mem_name) {
					alert('이름을 입력해 주세요.');
					mem_name.focus();
					return false;
				} else if (!mem_email) {
					alert('이메일을 입력해 주세요.');
					mem_email.focus();
					return false;
				} else if (authNumber2 != '' && parseInt(authNumber2) > 0) { // val()로 받으면 문자열이기 때문에 형변환
				// 인증번호가 공백이 아니고 0 이상일 경우
					if (authNumber2 == authCode) { // 인증번호가 일치할때
						alert('이메일 인증이 완료되었습니다. 감사합니다.');
						return true;
					} else {
						alert('인증번호가 일치하지 않습니다.');
// 						authNumber2.focus();
						return false;
					}
					// 인증번호를 입력하지 않았을 경우
				} else {
					alert("이메일 인증을 받고 다시 시도해 주세요.");
					goEmail.focus();
					return false;
				}
			});
		});
</script>
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	
		<div class="card text-center" style="width: 40rem; float: none; margin: 150px auto">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a class="nav-link text-muted"
						aria-current="true" href="userSearchId.me">아이디 찾기</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="userSearchPass.me">비밀번호 찾기</a></li>
				</ul>
			</div>
			<div class="card-body">
				<h5 class="card-title">비밀번호 찾기</h5>
				<p class="card-text">가입하신 방법에 따라 비밀번호 찾기가 가능합니다.</p>
				<input type="radio" class="custom-control-input" id="search_1" 	name="search_total" value="1" onclick="search_check('1')" checked="checked">
				<label class="custom-control-label font-weight-bold" for="search_1">휴대전화로 인증</label>
				<input type="radio" class="custom-control-input" id="search_2" 	name="search_total" value="2" onclick="search_check('2')">
				<label class="custom-control-label font-weight-bold"	for="search_1">이메일로 인증</label>
				
				<div id="searchI">
				<form action="SearchPass.me" method="post">
				<input type="hidden" id="authCode" />
				<table class="table table-borderless table-light">
					<tr>
						<th scope="row" class="col-4">이름</th>
						<td><input type="text" name="mem_name" placeholder="ex) 홍길동" id="mem_name" required="required"></td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">휴대폰 번호</th>
						<td><input type="text" name="mem_phoneNum" id="mem_phoneNum" placeholder="ex) 01077779999" required="required"></td>
						<td><input type="button" class="btn btn-outline-secondary btn-sm" id="goSMS" value="인증번호 받기" ></td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td><input id="authNumber" placeholder="인증번호 5자리 숫자" readonly="readonly"/> 
						<td></td>
					</tr>
				</table>

				<input type="submit" class="btn btn-secondary" value="비밀번호 찾기" id="confirmBnt" >
				</form>
				</div>
				
				<div id="searchP" style="display: none;">
				<form action="SearchPass.me" method="post">
				<input type="hidden" id="authCode" />
				<table class="table table-borderless table-light">
					<tr>
						<th scope="row" class="col-4">이름</th>
						<td><input type="text" name="mem_name" placeholder="ex) 홍길동" id="mem_name1"
							required="required"></td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td><input type="text" name="mem_email" id="mem_email1"
							placeholder="ex) hong@naver.com" required="required"></td>
						<td><input type="button" class="btn btn-outline-secondary btn-sm" id="goEmail" value="인증번호 받기" ></td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td><input id="authNumber2" placeholder="인증번호 5자리 숫자" readonly="readonly"/> 
						<td></td>
					</tr>
				</table>

				<input type="submit" class="btn btn-secondary" value="비밀번호 찾기" id="confirmBnt2" >
				</form>
				</div>
			</div>
		</div>

	

	

</body>
</html>