<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() { 
		<%if(request.getParameter("mem_id") != null) {%>
			let id = "<%=request.getParameter("mem_id")%>";
			document.fr.id.value = id;
			let isDuplicate = "<%=request.getParameter("isDuplicate")%>";
			
			if(isDuplicate == 'null') { // 아이디가 중복이 아닐 경우
				let btn = "<input type='button' value='아이디 사용' onclick='useId()'>";
				document.getElementById("checkIdResult").innerHTML = "사용 가능한 아이디<br>" + btn;
				document.getElementById("checkIdResult").style.color = "GREEN";
			} else { // = 아이디 중복일 경우 
				document.getElementById("checkIdResult").innerHTML = "이미 사용중인 아이디";
				document.getElementById("checkIdResult").style.color = "RED";
				
			}
		<%}%>
	}
	
	function useId() {
		window.opener.document.fr.id.value = document.fr.id.value;
		
		window.close();
	}
	
	function checkId() {
		let id = document.fr.id.value;

		if(id.length >= 4 && id.length <= 8) { // 아이디 규칙이 적합할 경우
			location.href = "CheckIdDuplicate.me?mem_id=" + id; 
		} else { // 아이디 규칙이 적합하지 않을 경우
			alert("4~8글자만 사용 가능합니다.");
			document.getElementById("checkIdResult").innerHTML = "";
			document.fr.id.select();
		}
	}
	
</script>
</head>
<body>
	<h1>ID 중복 체크</h1>
	<form action="" name="fr">
		<input type="text" name="id" id="id" placeholder="4 ~ 8글자 문자, 숫자 조합 필수!">
		<input type="button" value="중복확인" onclick="checkId()"><br>
		<div id="checkIdResult"></div>
	</form>
</body>
</html>