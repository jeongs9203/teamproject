<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function cartChoice(target) {
	if(target == "cart") {
		window.opener.choice("cart", true);
		
	} else {
		window.opener.choice("list", true);
	}
	
	window.close();

}
</script>
<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./js/store.js"></script>
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>장바구니에 상품이 정상적으로 담겼습니다.</h1>
	<input type="button" value="장바구니 이동" onclick="cartChoice('cart')">
	<input type="button" value="쇼핑 계속하기" onclick="cartChoice('list')">
</body>
</html>