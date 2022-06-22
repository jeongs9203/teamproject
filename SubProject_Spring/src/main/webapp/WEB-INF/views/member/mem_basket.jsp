<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".qtyup").click(function() {
		var n = $('.qtyup').index(this);
	    var num = $(".qty:eq("+n+")").val();
	    num = $(".qty:eq("+n+")").val(num*1+1); 
	});
	
	$(".qtydown").click(function() {
		var n = $('.qtydown').index(this);
	    var num = $(".qty:eq("+n+")").val();
	    num = $(".qty:eq("+n+")").val(num*1-1);
	});
})
$(function() {
	$(".qtyupdate").click(function() {
		var n = $('.qtyupdate').index(this);
	    var num = $(".qty:eq("+n+")").val();
	    var order_num = $(".bk_order_num:eq("+n+")").val();
		var mem_id = $(".bk_mem_id").val();
		var pd_code = $(".bk_pd_code:eq("+n+")").val();
	 	var isupdate = confirm("수량을 변경하시겠습니까?");
// 		alert(pd_code);
	 	if(isupdate) {
	 		location.href="basketUpdate.me?bk_qty=" + num + "&bk_mem_id=" + mem_id + "&bk_order_num=" + order_num + "&bk_pd_code=" + pd_code;
	 	}else {
			
	 	}
	});
})

$(function() {
	$(".deleteBakset").click(function() {
		var n = $('.deleteBakset').index(this);
	    var order_num = $(".order_num:eq("+n+")").val();
		var mem_id = $(".bk_mem_id").val();
		var pd_code = $(".bk_pd_code:eq("+n+")").val();
	 	var isdelete = confirm("삭제하시겠습니까?");
	 	if(isdelete) {
	 		location.href="basketDelete.me?bk_mem_id=" + mem_id +"&bk_pd_code="+ pd_code +"&bk_order_num=" + order_num;
	 	}
	})
})

$(document).ready(function() {
	$(function() {
		$("#checkAll").click(function() {
			if($(".checkAll").prop("checked")) {
				$(".checkJudge").prop("checked",true);
			}else {
				$(".checkJudge").prop("checked",false);
			}
		})
	});
});

$(function() {
	$(".btnPay").click(function() {
// 		var ch = $(".chekcJudge");
// 		if(ch.legth == 0) {
// 			return;
// 		}
// 		var count = 0;
// 		$.each(ch,function(i,check){
// 			if($(check).prop("checked")){
// 				count++;
// 				$("#qty"+(i+1)).prop("disabled",false);
// 			}else {
// 				$("#qty"+(i+1)).prop("disabled",true);
// 			}
// 		});
		
// 		if(count == 0) {
// 			alert("상품을 선택하세요");
// 			$("#qty").prop("disabled",false);	
// 			return;
// 		}
		$("#frPay").submit();
	})
});
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div id="page-wrapper">
<jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>  
  <!-- 본문 -->
<div id="page-content-wrapper">
    <div class="container">
      <h1 class="display-5">장바구니</h1>
    </div>
    <div class="container">
	    <form action="PaymentStore.pm" method="post" name="frPay" id="frPay">
			<table class="table table-striped" id="fr">  
				<thead>
					<tr class="text-center">
						<th scope="col">상품</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">주문금액</th>
						<th scope="col">비고</th>
						<th>
	  						<label class="form-check-label" for="flexCheckDefault">선택</label>
							<input class="form-check-input checkAll" type="checkbox" id="checkAll" name="checkAll">
						</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty basketlist }">
						<tr><td colspan="5" class="text-center">장바구니가 비어있습니다</td></tr>
					</c:when>
					<c:otherwise>
							<c:set var="sum" value="0"/>
						<tbody>
						<!-- 장바구니 목록  -->
							<c:forEach items="${basketlist }" var="basketlist" varStatus="st">
						    <tr class="text-center">
						      <td>${basketlist.pd_name }</td>
						      <td><fmt:formatNumber pattern="###,###,###" value="${basketlist.pd_price }"/>원</td>
						      <td>
							      <input type="text" name="bk_qty" style="width: 30px;" class="qty text-center" value="${basketlist.bk_qty }" readonly>
							      <button type="button" class="qtyup btn btn-text-center btn-outline-dark" >▲</button>
							      <button type="button" class="qtydown btn btn-outline-dark text-center" >▼</button>
						      </td>
						      <td><fmt:formatNumber pattern="###,###,###" value="${basketlist.totalprice }"/>원</td>
						      <td>
						      	<input type="hidden" class="bk_mem_id" name="bk_mem_id" value="${basketlist.bk_mem_id} ">
						      	<input type="hidden" class="bk_pd_code" name="bk_pd_code" value="${basketlist.bk_pd_code} ">
						      	<input type="hidden" class="bk_order_num" name="bk_order_num" value="${basketlist.bk_order_num} ">
						      	<input type="hidden" class="pd_name" name="pd_name" value="${basketlist.pd_name }">
						      	<input type="hidden" class="pd_price" name="pd_price" value="${basketlist.pd_price }">
						      	<input type="hidden" class="totalprice" name="totalprice" value="${basketlist.totalprice }">
						      	<button type="button" class="qtyupdate btn btn-success btn-sm" onclick="updateQty()">수량변경</button>
						      	<button type="button" class="deleteBakset btn btn-danger btn-sm" onclick="deleteBakset()">삭제하기</button></td>
						      <td>
						      	<input class="form-check-input checkJudge" type="checkbox" id="checkJudge" name="checkJudge">
						      </td>
						    </tr>
						    <tr>
							  <c:set var="sum" value="${sum + basketlist.totalprice}"/> 
						    </tr>
							</c:forEach>
						<!-- /장바구니 목록  -->   
						    <tr>
						      <td scope="row"></td>
						      <td></td>
						      <td></td>
						      <td>총 결제금액</td>
						      <td colspan="2"><fmt:formatNumber pattern="###,###,###" value="${sum }"/>원</td>
						    </tr>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>   	
	    </form>
    </div>
    <div class="container text-center">
    	<button type="button" class="btn btnPay btn-outline-success btn-lg col-6">주문하기</button>
    </div>
</div>
  <!-- /본문 -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>