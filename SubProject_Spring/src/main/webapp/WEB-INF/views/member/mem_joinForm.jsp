<%@page import="com.springProject.subProject.mail.GenerateAuthenticationCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%GenerateAuthenticationCode genCode = new GenerateAuthenticationCode();
String mem_auth_code = genCode.getAuthenticationCode(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Creative - Start Bootstrap Theme</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/resources/assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/joinFunc.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="page-section" id="contact">
		<div class="container px-4 my-5 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-8 col-xl-6 text-center">
					<h2 class="mt-0">Join</h2>
					<hr class="divider" />
					<p class="text-muted mb-5">Ready to start your next project
						with us? Send us a messages and we will get back to you as soon as
						possible!</p>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
				<div class="col-lg-6">
					<!-- 					<form action="mem_join.me" method="post"> -->
					<!-- 						<div class="form-floating mb-3"> -->
					<!-- 							<input class="form-control" name="mem_id" id="mem_id" type="text" -->
					<!-- 								required="required" /> -->
					<!-- 							<label for="Id">아이디(필수)</label> -->
					<!-- 							<input type="button" value="아이디 중복 확인" class="dup" id="btn" onclick="checkDuplicateId()"> -->
					<!-- 						</div> -->
					<!-- 						<div class="form-floating mb-3"> -->
					<!-- 							<input class="form-control" name="mem_password" id="mem_password" -->
					<!-- 								type="text" required="required" />  -->
					<!-- 							<label for="Password">비밀번호(필수)</label> -->
					<!-- 						</div> -->
					<!-- 						<div class="form-floating mb-3"> -->
					<!-- 							<input class="form-control" name="mem_password2" id="mem_password2" -->
					<!-- 								type="text" required="required" onkeyup="checkRetypePass(this.value)"/>  -->
					<!-- 							<label for="Password">비밀번호 재확인(필수)</label> -->
					<!-- 						</div> -->
					<!-- 						<span id="checkRetypePassResult" class="checkRetypePassResult"></span> -->
					<!-- 						<div class="d-grid"> -->
					<!-- 							<button class="btn btn-primary btn-xl" type="submit">Join</button> -->
					<!-- 						</div> -->
					<!-- 					</form> -->
					<form action="mem_join.me" name="fr" class="form-floating" method="post">
						<input type="hidden" name="mem_auth_code" value="<%=mem_auth_code%>">
						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_id" id="id" class="form-control" required="required" readonly> 
									<label for="id">아이디(필수)</label>
								</div>
							</div>
							<div class="col-md">
								<div class="d-grid mb-3">
									<input type="button" class="btn btn-outline-primary btn-xxl" value="아이디 중복 확인" id="btn" onclick="checkDuplicateId()">
								</div>
							</div>
						</div>
						
						<div class="form-floating mb-3">
							<input type="password" name="mem_password" class="form-control"
								id="floatingInput" required="required"
								onkeyup="checkPass(this.value)">
							<!-- 			<label for="email_input">필수정보입니다!</label> -->
							<label for="floatingInput">비밀번호(필수)</label>
							<!-- 정규표현식 -->
							<span id="passResult" class="passResult"></span>
						</div>

						<div class="form-floating mb-3">
							<input type="password" name="mem_password2" class="form-control"
								id="floatingInput" autocomplete="off" required="required"
								onkeyup="checkRetypePass(this.value)">
							<!-- 			<label for="email_input">필수정보입니다!</label> -->
							<label for="floatingInput">비밀번호 재확인(필수)</label>
							<!-- 정규표현식 -->
						</div>
						<span id="checkRetypePassResult" class="checkRetypePassResult"></span>

						<div class="form-floating mb-3">
							<input type="text" name="mem_name" id="floatingInput"
								class="form-control" autocomplete="off" required="required">
							<label for="floatingInput">이름(필수)</label>
						</div>

						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_year" id="floatingInput"
										class="form-control" autocomplete="off"> <label
										for="floatingInput">생년월일</label>
								</div>
							</div>
							<div class="col-md">
								<div class="form-floating mb-3">
									<select onselect="" class="form-select" id="floatingSelect"
										name="mem_month" aria-label="Floating label select example">
										<option value=""></option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select> <label for="floatingSelect">월</label>
								</div>
							</div>
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_day" class="form-control"
										id="floatingInput" autocomplete="off"> <label
										for="floatingInput">일</label>
								</div>
							</div>
						</div>

						<div class="form-floating mb-3">
							<select name="mem_gender" class="form-select" id="floatingSelect"
								aria-label="Floating label select example">
								<option value="">선택안함</option>
								<option value="남">남</option>
								<option value="여">여</option>
							</select> <label for="floatingSelect">성별</label>
						</div>



						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_mailAdd" id="floatingInput"
										class="form-control"> <label for="floatingInput">이메일</label>
								</div>
							</div>
							@
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="domain" id="floatingInput"
										class="form-control"> <label for="floatingInput"></label>
								</div>
							</div>
							<div class="col-md">
								<div class="form-floating mb-3">
									<select class="form-select" id="sDomain"
										onchange="selectDomain(this.value)"
										aria-label="Floating label select example">
										<option value=""></option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
									</select> <label for="floatingSelect">선택하세요</label>
								</div>
							</div>
						</div>
					<div class="d-grid mb-3">
<!-- 						<div class="form-floating"> -->
							<input type="button" value="메일 인증" class="btn btn-outline-primary btn-xxl" id="mail_btn">
<!-- 						</div> -->
					</div>



						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating mb-3">
									<select onselect="" class="form-select" id="floatingSelect"
										name="mem_phoneF" aria-label="Floating label select example">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
									</select> <label for="floatingSelect">휴대전화</label>
								</div>
							</div>
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_phoneM" id="floatingInput"
										class="form-control" autocomplete="off">
									<!-- 										<label for="floatingInput">생년월일</label> -->
								</div>
							</div>
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_phoneL" class="form-control"
										id="floatingInput" autocomplete="off">
									<!-- 										<label for="floatingInput">일</label> -->
								</div>
							</div>
						</div>


						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="mem_postcode" id="postcode" class="form-control"> 
									<label for="postcode">우편번호</label>
								</div>
							</div>
							<div class="col-md">
								<div class="d-grid mb-3">
									<input type="button" class="btn btn-outline-primary btn-xxl" value="주소검색" id="postcode_se"
										onclick="postCodeSearch()">
								</div>
							</div>
						</div>
						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="address" id="address" class="form-control">
								</div>
							</div>
							<div class="col-md">
								<div class="form-floating mb-3">
									<input type="text" name="add_detail" id="add_detail" class="form-control"> 
									<label for="add_detail">상세주소
										입력</label>
								</div>
							</div>
						</div>



						<!-- 						<div class="phone"> -->
						<!-- 									<select id="selectPhoneCode" name="mem_phoneF"> -->
						<!-- 										<option value="010">010</option> -->
						<!-- 										<option value="011">011</option> -->
						<!-- 										<option value="016">016</option> -->
						<!-- 									</select>- <input type="text" name="mem_phoneM" id="phone1" -->
						<!-- 										autocomplete="off">- <input type="text" -->
						<!-- 										name="mem_phoneL" id="phone2" autocomplete="off"> -->
						<!-- 												<label for="id">전화번호</label>						 -->
						<!-- 								</div> -->

						<!-- 								<div class="int-area"> -->
						<!-- 									<input type="text" name="mem_postcode" id="postcode" -->
						<!-- 										autocomplete="off"> <input type="button" value="주소검색" -->
						<!-- 										id="postcode_se" onclick="postCodeSearch()"> <input -->
						<!-- 										type="text" id="address" name="address"><input -->
						<!-- 										type="text" id="add_detail" name="add_detail" -->
						<!-- 										placeholder="상세주소 입력"> -->
						<!-- 												<label for="id">주소</label>					 -->
						<!-- 								</div> -->

						<div class="d-grid">
							<button class="btn btn-primary btn-xl" type="submit">Join</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>