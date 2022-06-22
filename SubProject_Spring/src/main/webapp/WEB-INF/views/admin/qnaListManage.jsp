<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Q&A 게시판</title>
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
  			width: 800px;  
  			text-align: left;  
  		}  
		
    </style>
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="../inc/sidebar_adminpage.jsp"></jsp:include>
			<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
				<!-- JSTL 의 c:set 태그를 사용하여 PageInfo 객체의 값들을 변수에 저장 -->
				<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
				<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
				<c:set var="startPage" value="${pageInfo.getStartPage() }" />
				<c:set var="endPage" value="${pageInfo.getEndPage() }" />
				<c:set var="listCount" value="${pageInfo.getListCount() }" />
		
				<!-- 게시판 리스트 -->
				<section id="listForm">
					<table class="table table-hover text-center" style="margin-top: 5em; margin-left: 20em;">
						<thead class="table-light">
							<tr>
								<th scope="col" width="80">글번호</th>
					            <th scope="col">제목</th>
					            <th scope="col" width="100">작성자</th>
					            <th scope="col" width="150">작성일</th>
							</tr>
						</thead>
						<tbody>
						<!-- JSTL 의 c:forEach 태그를 사용하여 qnaList 에서 QnaVO 객체를 꺼내서 내용 출력 -->
						<!-- 단, 게시물 목록이 하나라도 존재할 경우에만 출력 c:if 태그 사용 -->
						<c:if test="${not empty qnaList and pageInfo.getListCount() > 0}">
							<c:forEach var="qna" items="${qnaList }">
								<tr class="text-center">
									<td scope="row" style="text-align: center; vertical-align: middle;">${qna.getQna_num() }</td>
									<td id="subject" scope="row" style="text-align: center; vertical-align: middle;">
										<a href="./customerCenter_detail.cu?qna_num=${qna.getQna_num() }&page=${pageNum}" style="text-decoration: none;">
											${qna.getQna_title() }
										</a>
									</td>
									<td scope="row" style="text-align: center; vertical-align: middle;">${qna.getQna_mem_id() }</td>
									<td scope="row" style="text-align: center; vertical-align: middle;">${qna.getQna_date() }</td>
								<!-- 세션 아이디가 관리자 일때 삭제 -->
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
					<section id="buttonArea">
						<button type="button" onclick="location.href='./customerCenter_write.cu'" class="btn btn-outline-primary">글쓰기</button>
					</section>
					<section id="pageList">
						<nav aria-label="Page navigation example" style="margin-left: 30em;">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<c:choose>
										<c:when test="${pageNum > 1}">
											<a class="page-link" href="admin_customer.ad?pageNum=${pageNum - 1}">Previous</a>
										</c:when>
										<c:otherwise>
											<a class="page-link" aria-disabled="true">Previous</a>
										</c:otherwise>
									</c:choose>
								</li>
					            	<c:forEach var="i" begin="${startPage }" end="${endPage }">
					            		<c:choose>
					            			<c:when test="${pageNum eq i}">
					            				<li class="page-item"><a class="page-link" aria-disabled="true">${i }</a></li>
					            			</c:when>
					            			<c:otherwise>
					            				<li class="page-item"><a class="page-link" href="admin_customer.ad?pageNum=${i }">${i }</a></li>
					            			</c:otherwise>
					            		</c:choose>
					            	</c:forEach>
					            
					            <li class="page-item">
					            	<c:choose>
					            		<c:when test="${pageNum < maxPage}">
					            			<a class="page-link" href="admin_customer.ad?pageNum=${pageNum + 1}">Next</a>
					            		</c:when>
					            		<c:otherwise>
					            			<a class="page-link" aria-disabled="true">Next</a>
					            		</c:otherwise>
					            	</c:choose>
					            </li>
							</ul>
						</nav>
					</section>
				</section>	
			</main>	
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>