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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>
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
        
        #buttonArea {
			margin: auto;
			width: 1024px;
			text-align: center;
		}
    </style>
</head>
<body>
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="../inc/sidebar_adminpage.jsp"></jsp:include>
            <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
            	<section id="modifyForm">
					<h1 id="modisubject">상품 수정</h1>
					<form action="admin_modify.ad" name="ProductForm" method="post">
						<input type="hidden" name="page" value="${param.page }">
						<table class="table">
							<tr>
								<td>상품코드</td>
								<td><input type="text" name="pd_code" value="${param.pd_code }" readonly="readonly"></td>
							</tr>
							
							<tr>
								<td>상품명</td>
								<td><input type="text" name="pd_name" value="${product.pd_name }"></td>
							</tr>
							<tr>
								<td>상품가격</td>
								<td><input type="text" name="pd_price" value="${product.pd_price }"></td>
							</tr>
							<tr>
								<td>상품내용</td>
								<td><textarea  rows="10" cols="120" id="pd_detail" name="pd_detail">${product.pd_detail }</textarea></td>
							</tr>
							<tr>
					            <td colspan="2" align="center">
					                <button type="submit" class="btn btn-outline-success btn-sm">수정완료</button>
					                <button type="button" class="btn btn-outline-success btn-sm" onclick="history.back()">취소</button>
					            </td>
					        </tr>
						</table>
					</form>
				</section>
        	</main>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
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