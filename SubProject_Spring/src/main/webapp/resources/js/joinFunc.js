/**
 * 
 */
 
	var passResult = false;
var checkRetypePassResult = false;
//비밀번호 정규식
function checkPass(pass) {
	//		var passResult = document.getElementById("passResult");

	var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;

	// 			최소 8 자, 최소 하나의 문자 및 하나의 숫자 :
	// 			"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"

	// 			최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자 :
	// 			"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"


	// 			최소 8 자, 대문자 하나 이상, 소문자 하나 및 숫자 하나 :
	// 			^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$



	if (regex.exec(pass)) {
		document.getElementById("passResult").innerHTML = "사용 가능";
		document.getElementById("passResult").style.color = "GREEN";
		passResult = true;
	} else {
		document.getElementById("passResult").innerHTML = "사용 불가능(숫자, 영문 대문자, 소문자 세가지 조합 8~16자)";
		document.getElementById("passResult").style.color = "RED";
		passResult = false;
	}
}

// 비밀번호 재확인
function checkRetypePass(pass2) {
	/*
	함수에서 pass 와 pass2 의 항목 비교하여 일치하면 "패스워드 일치"(초록색) 표시하고
	아니면 "패스워드 불일치"(빨간색) 표시
	=> 패스워드 일치 시 checkRetypePassResult 를 true, 아니면 false 로 변경
	*/
	var password = document.fr.mem_password.value;
	var spanElem = document.getElementById("checkRetypePassResult");

	if (password == pass2) {
		spanElem.innerHTML = "패스워드 일치";
		spanElem.style.color = "GREEN";
		checkRetypePassResult = true;
	} else {
		spanElem.innerHTML = "패스워드 불일치";
		spanElem.style.color = "RED";
		checkRetypePassResult = false;
	}
}

// 비밀번호 변경 시 확인
function checkForm() {

	if (!passResult) {
		alert("비밀번호 조합 확인 필수!");
		document.fr.passwd.focus();
		return false;
	} else if (!checkRetypePassResult) {
		alert("비밀번호 일치 확인 필수!");
		document.fr.passwd2.focus();
		return false;
	}


}

	//전화번호 양식 변경
	function checkPhone(phone) {
		// 전화번호 검증 양식 : xxx-xxxx-xxxx(하이픈 포함 여부 무관) 가능
		var regex = /^(010|011|051|02|031)-?[0-9]{3,4}-?[0-9]{4}$/;
		if(!regex.exec(phone)) {
			alert("전화번호 양식(xxx-xxxx-xxxx) 필수!");
		} else {
			// 만약, 숫자가 아닌 기호(-)가 포함될 경우 전부 제거하는 방법
			// => 숫자가 아닌 데이터를 지정하는 패턴(/[^0-9])을 전체 문자에 여러번 적용하려면
			//    /패턴/ 뒤에 플래그 g 를 명시
// 			var NaNRegex = /[^0-9]/g;
			var NaNRegex = /\D/g; // 위의 문장과 동일한 패턴(\d 는 숫자, \D 는 숫자가 아닌 것)
			document.getElementById("phone").value = phone.replace(NaNRegex, "");
			// => 패턴에 해당하는 문자를 찾아 "" 문자로 교체(대체)함(=> 여러번 적용시킴(g 플래그))
		}
	}
	
	//아이디 중복체크 
	function checkDuplicateId() {
		window.open("MemberCheckId.me", "check", "width=400,height=200");
	}
	// 회원 탈퇴 창
	function memberDelete() {
		window.open("MemberDelete.me", "check", "width=400,height=200");
	}
	//domainselect
	function selectDomain() {
		document.fr.domain.value = document.fr.sDomain.value;
	}
	
	
	
	//postcode
	function postCodeSearch() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("postcode").value = data.zonecode;
	            document.getElementById("address").value = roadAddr;
	            
	           
	        }
	    }).open();
	}
	
	//password button
	$(document).ready(function(){
	    $('.main i').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa-solid fa-eye-slash")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa-solid fa-eye")
	            .prev('input').attr('type','password');
	        }
	    });
	});
	
	
	
	
	