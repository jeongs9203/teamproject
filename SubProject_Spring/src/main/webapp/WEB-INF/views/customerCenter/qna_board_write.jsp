<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A 게시판</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<main role="main" class="container" style="margin-top: 5em;">
		<form name="QNAWriteForm" method="POST" action="customerCenter_write.cu">
			<div class="pt-1" style="float: left; margin-right:10px; margin-bottom: 5px;">
			<input type="text" name="qna_mem_id" placeholder="아이디"
				style="border-radius: 5px; width: 100%; padding: 5px;">
			</div>
			<div class="pt-1" style="float: left;">
				<input type="password" name="qna_pass" placeholder="비밀번호"
				style="border-radius: 5px; width: 100%; padding: 5px;">
			</div>
			<div class="pt-1">
			<input type="text" name="qna_title" placeholder="제목을 입력하세요"
				style="border-radius: 5px; width: 100%; padding: 5px;">
			</div>
			<div class="pt-1">
				<textarea id="summernote" name="qna_content"></textarea>
			</div>
			<script>
				$('#summernote').summernote({
					placeholder : '내용을 입력해주세요',
					tabsize : 2,
					height : 300
				});
			</script>
			<div class="pt-1 text-right">
				<button class="btn btn btn-success" type="submit"
					style="width: 10%; padding: 5px;">제출</button>
			</div>
		</form>
	</main>
</body>
</html>