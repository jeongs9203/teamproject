<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./js/store.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>

	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />


	<c:if test="${not empty articleList}">
		<c:forEach var="review" items="${articleList }">
			<div class="card mb-3" style="max-width: 100%;">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="${review.getRe_img() }"
							style="width: 150px; height: 180px;"
							class="img-fluid rounded-start" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">${review.getRe_score() }</h5>
							<p class="card-text">
								<small class="text-muted">${review.getRe_mem_id() }</small>
							</p>
							<p class="card-text">${review.getRe_title() }</p>
							<p class="card-text">
								<small class="text-muted">${review.getRe_comment() }</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>