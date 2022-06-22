<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/joinFunc.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div id="page-wrapper">
<jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <form action="memInfoEdit.me" name="fr" id="fr" method="post">
      	<table class="table" >
			<tr><td>아이디</td><td>${memberVO.mem_id }</td></tr>
			<tr><td>이름</td><td>${memberVO.mem_name }</td></tr>
			<tr><td>생년월일</td><td>${memberVO.mem_birth }</td></tr>
			<tr><td>성별</td><td>${memberVO.mem_gender }</td></tr>
			<tr><td>email</td><td><input type="text" name="mem_mailAdd" id="email">@<input type="text" name="domain" id="domain">
					<select onchange="selectDomain(this.value)" name="sDomain" id="sDomain">
						<option value="">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
<!-- 						<option value="msn.com">msn.com</option> -->
<!-- 						<option value="outlook.com">outlook.com</option> -->
					</select>
			</td>
			</tr>
			<tr><td>전화번호</td><td><input type="text" name="mem_phoneNum" id="phone"onblur="checkPhone(this.value)"></td></tr>
			<tr><td rowspan="2">주소</td><td><input type="text" name="mem_postcode" id="postcode"><input type="button" value="주소검색" onclick="postCodeSearch()"></td></tr>
			<tr><td><input type="text" name="address" id="address"><input type="text" name="add_detail" id="add_detail" placeholder="상세주소 입력"></td></tr>
			<tr><td>멤버쉽등급</td><td>${memberVO.mem_grade }</td></tr>
      	</table>
      	<button type="submit" class="btn btn-secondary">수정하기</button>
      	<input type="button" class="btn btn-danger" value="탈퇴하기" onclick="memberDelete()">
      </form>
    </div>
  </div>
  <!-- /본문 -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>