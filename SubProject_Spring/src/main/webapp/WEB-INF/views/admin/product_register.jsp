<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap 5 Simple Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <style>
        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 100;
            padding: 90px 0 0;
            box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
            z-index: 99;
        }

        @media (max-width: 767.98px) {
            .sidebar {
                top: 11.5rem;
                padding: 0;
            }
        }
            
        .navbar {
            box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
        }

        @media (min-width: 767.98px) {
            .navbar {
                top: 0;
                position: sticky;
                z-index: 999;
            }
        }

        .sidebar .nav-link {
            color: #333;
        }

        .sidebar .nav-link.active {
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="../inc/sidebar_adminpage.jsp"></jsp:include>
            <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
                <div class="container-fluid px-4">
               		<h1 class="mt-4">상품등록</h1>
                </div>
               	<div>
					<form action="admin_register.ad" name="ProductRegisterForm" method="post" >
					    <table class="table">
					    	<tr>
					            <td>상품코드</td>
					            <td><input type="text" name="pd_code" id="pd_code" required="required"></td>
					        </tr>
					        <tr>
					            <td>상품명</td>
					            <td><input type="text" name="pd_name" id="pd_name" required="required"></td>
					        </tr>
					        <tr>
					            <td>가격</td>
					            <td><input type="text" name="pd_price" id="pd_price"></td>
					        </tr>
					        <tr>
					            <td>상품설명</td>
					            <td><textarea rows="10" cols="120" name="pd_detail" id="pd_detail"></textarea></td>
					        </tr>
					        <tr>
					            <td>상품이미지</td>
					            <td><input type="file" name="pd_img" id="pd_img"></td>
					        </tr>
					        <tr>
					            <td colspan="2" align="center">
					                <button type="submit" class="btn btn-outline-success btn-sm">등록완료</button>
					                <button type="reset" class="btn btn-outline-success btn-sm" >다시쓰기</button>
					                <button type="button" class="btn btn-outline-success btn-sm" onclick="history.back()">취소</button>
					            </td>
					        </tr>
					    </table>
					</form>                    
           		</div>
        	</main>
        </div>
    </div>
    <script>
        new Chartist.Line('#traffic-chart', {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat','Sun'],
            series: [
                [23000, 25000, 19000, 34000, 56000, 64000,80000]
            ]
            }, {
            low: 0,
            showArea: true
        });        
    </script>
</body>
</html>