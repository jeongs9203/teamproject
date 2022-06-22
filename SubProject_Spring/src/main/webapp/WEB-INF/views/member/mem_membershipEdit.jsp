<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #000;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="mypage.me">마이페이지</a>
      </li>
      <li><a href="memInfoEdit.me">회원정보변경</a></li>
      <li><a href="inquiry.me">주문조회</a></li>
      <li><a href="basket.me">장바구니</a></li>
      <li class="sidebar-brand">
        <a href="#">멤버쉽</a>
      </li>
      <li><a href="#">멤버쉽조회</a></li>
      <li><a href="#">멤버쉽수정</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <form action="">
      	<table class="table">
			<tr><td>아이디</td><td>${memberDTO.mem_id }</td></tr>
			<tr><td>이름</td><td>${memberDTO.mem_name }</td></tr>
			<tr><td>생년월일</td><td></td></tr>
			<tr><td>성별</td><td></td></tr>
			<tr><td>email</td><td></td></tr>
			<tr><td>전화번호</td><td></td></tr>
			<tr><td>주소</td><td></td></tr>
			<tr><td>멤버쉽등급</td><td></td></tr>
      	</table>
      </form>
<!--       	<button type="submit" class="btn btn-secondary">수정하기</button> -->
    </div>
  </div>
  <!-- /본문 -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>