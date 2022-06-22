<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Creative - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body id="page-top">
 <nav class="navbar navbar-expand-lg navbar-light navbar-fixed-top py-3" id="subNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="./"><span class="h3">Start Bootstrap</span></a>&nbsp;&nbsp;&nbsp;
                <a class="navbar-brand" href="subscribePage.sub"><span class="h5">구독</span></a>
                <a class="navbar-brand" href="storeMain.st"><span class="h5">스토어</span></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                
                <div class="collapse navbar-collapse" id="navbarResponsive">
                 <form action="search" method="post" class="d-flex">
			      <input class="form-control me-2" type="search" name="keyword" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-secondary" type="submit">Search</button>
			    </form>
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <c:choose>
            				<c:when test="${empty userId }">
		                        <li class="nav-item"><a class="nav-link" href="login_form.me">Login</a></li>
		                        <li class="nav-item"><a class="nav-link" href="join_before.me">Join (3000w)</a></li>
                        		<li class="nav-item"><a class="nav-link" href="login_form.me">My shop</a></li>
                        	</c:when>
                        	<c:when test="${userId eq 'almeal'}">
            					<li class="nav-item "><a class="nav-link" href="adminpage.me">관리자</a></li>                
			            		<li class="nav-item "><a class="nav-link" href="logout.me">Logout</a></li>
            				</c:when>
                        	<c:otherwise>
                        		<li class="nav-item"><a class="nav-link">${userId}님</a></li>
                        		<li class="nav-item"><a class="nav-link" href="logout.me">Logout</a></li>
                        		<li class="nav-item"><a class="nav-link" href="mypage.me">My shop</a></li>
                        	</c:otherwise>
                        </c:choose>
                        <li class="nav-item"><a class="nav-link" href="CustomerCenter.cu">Community</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>