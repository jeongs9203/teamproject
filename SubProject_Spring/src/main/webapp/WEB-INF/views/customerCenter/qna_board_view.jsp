<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Q&A 게시판</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="6" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="4">${qna.getQna_title() }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${qna.getQna_mem_id() }</td>
						<td>작성일자</td>
						<td colspan="2">${qna.getQna_date() }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="4" style="min-height: 200px; text-align: left;">${qna.getQna_content() }</td>
					</tr>
				</tbody>
			</table>
			<section id="buttonArea">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='customerCenter_list.cu?page=${param.page}'">목록</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='customerCenter_reply.cu?qna_num=${param.qna_num}&page=${param.page}'">답글</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='customerCenter_modify.cu?qna_num=${param.qna_num}&page=${param.page}'">수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='customerCenter_delete.cu?qna_num=${param.qna_num}&page=${param.page}'">삭제</button>
			</section>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>