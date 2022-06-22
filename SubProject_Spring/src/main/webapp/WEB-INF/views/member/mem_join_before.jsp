<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Creative - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="resources/resources/assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section class="page-section" id="contact">
            <div class="container px-4 my-5 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">Join</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">멤버쉽혜택은 [회사명] 일반 회원가입시만 발급 됩니다.</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                        <form action="join_form.me" method="get">
                  <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="d-grid mb-3">
                            	<button class="btn btn-primary btn-xl" type="submit">회원가입</button>
                            </div>
                   		<div class="text-center mb-5 mb-lg-2">
                       		 <div>
		                        <a href="login_form.me">로그인 하러가기</a>&nbsp;&nbsp;&nbsp;
						</div>
                    </div>
                </div>
                        </form>
				<div class="row gx-4 gx-lg-5 justify-content-center">
                   	<div class="text-center mb-1 mt-5">
							<p class="text-muted">---------&nbsp;&nbsp;&nbsp;SNS계정으로 회원가입하기&nbsp;&nbsp;&nbsp;---------</p>
                    </div>
                     <div class="d-grid mb-3">
                     	<button class="btn btn-warning btn-xl" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=25b9b94777a0d2b56646129bea603613&redirect_uri=http://localhost:8080/subProject/auth/kakao/callback&response_type=code'">카카오로 3초만에 시작하기</button>
                     </div>   
                     <div class="d-grid mb-3">
                     	               	<button class="btn btn-success btn-xl" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=u8qV72rCYp7ctZ8OEMD_&state=STATE_STRING&redirect_uri=http://localhost:8080/subProject/auth/naver/callback'">네이버로 로그인하기</button>
                     </div>       
                          
                          </div>

                    </div>
                </div>
<!--                 <div class="row gx-4 gx-lg-5 justify-content-center"> -->
<!--                     <div class="col-lg-4 text-center mb-5 mb-lg-0"> -->
<!--                         <div> -->
<!--                         <a href="">Sign Up?</a>&nbsp;&nbsp;&nbsp; -->
<!-- 						<a href="userSearchId.me">Forgot Id?</a>&nbsp;&nbsp;&nbsp; -->
<!-- 						<a href="userSearchPass.me">Forgot Password?</a></div> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
        </section>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
