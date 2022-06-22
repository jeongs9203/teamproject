<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
html, body {
	height: 100%;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/joinFunc.js"></script>
<script src="resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<div class="container h-100">
	<div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-8 text-center center-block">
			<div class="card">
          		<form class="form-card" action="Payment.pm" method="post">
          		   <h3>구독상품 선택</h3>
          		   <div class="row justify-content-between text-left">
          		   		<div class="form-group col-sm-6 flex-column d-flex">
          		   			<label class="form-control-label px-3">상품선택</label>
          		   			<select name="order_pd_code" id="order_pd_code">
          		   				<option value="st">스탠다드</option>
          		   				<option value="pre">프리미엄</option>
          		   			</select>
          		   		</div>	
          		   		<div class="form-group col-sm-6 flex-column d-flex">	
          		   			<label class="form-control-label px-3">수량선택</label>
          		   			<select name="order_qty" id="order_qty">
          		   				<option value="1">1</option>
          		   				<option value="2">2</option>
          		   				<option value="3">3</option>
          		   				<option value="4">4</option>
          		   				<option value="5">5</option>
          		   				<option value="6">6</option>
          		   				<option value="7">7</option>
          		   				<option value="8">8</option>
          		   				<option value="9">9</option>
          		   			</select>
          		   		</div>
          		   </div>
	               <h3>배송정보 입력</h3>
                   <div class="row justify-content-between text-left">
                       <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">우편번호<span class="text-danger"> *</span></label> <input type="text" id="postcode" name="order_postcode" readonly> </div>
                       <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3"><span class="text-danger"> &nbsp;</span></label><input type="button" value="주소 검색" onclick="postCodeSearch()"></div>
                   </div>
                   <div class="row justify-content-between text-left">
                       <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">주소<span class="text-danger"> *</span></label> <input type="text" id="address" name="address" readonly> </div>
                       <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">상세주소<span class="text-danger"> *</span></label> <input type="text" id="address_detail" name="address_detail" placeholder="상세주소 입력" > </div>
                   </div>
                   <div class="row justify-content-between text-left">
                       <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">전화번호 <span class="text-danger"> *</span></label> <input type="text" id="phoneNum" name="order_phoneNum" placeholder="연락받을 전화번호 입력" onblur="checkPhone(this.value)"> </div>
                   </div>
                   <div class="row justify-content-between text-left">
                       <div class="form-group col-12 flex-column d-flex"> <label class="form-control-label px-3">배송시 요청사항<span class="text-danger"> *</span></label>
                           <select name="oredr_comment">
                               <option value="직접 수령 부재시 문 앞">직접 수령 부재시 문 앞</option>
                               <option value="문 앞">문 앞</option>
                               <option value="경비실">경비실</option>
                               <option value="택배함">택배함</option>
                           </select> 
                       </div>
                   </div>
			       <button type="submit" class="btn btn-outline-success btn-lg col-6">구독하기</button>
               </form>
        	</div>    
      	</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>	

</body>
</html>