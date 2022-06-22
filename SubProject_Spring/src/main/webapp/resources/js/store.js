// 셀렉트 박스를 이용한 상품목록 변경
$(function() {
	$("#selectBox").on("change", function() {
		 var result = $("#selectBox").val();
		$.ajax({
			type: "GET", 
			url: "./storeMain.st",
			data: {
				select: result,
			},
			dataType: "text",
			success: function(msg) {
				$("#resultArea").html(msg);
			}
		});
	});
});

// a 태그를 이용한 리뷰 정렬
$(function() {
	$("#select li a").on("click", function() {
		//		 var result = $("li").val();
		var result = $(this).text();
		var pd_code = $(".pd_code").val();

		$.ajax({
			type: "GET",
			url: "./productDetail.st",
			data: {
				pd_code: pd_code,
				choice: result,
			},
			dataType: "text",
			success: function(msg) {
				$(".resultArea1").html($(msg).find(".resultArea1"));
			}
		});
	});
});

// 상품 수량 및 상품 총 가격
function add () {
    var sell_price = document.fr.sell_price;
    var hm = document.fr.bk_qty;
    var sum = document.fr.sum;
    var stock = document.fr.stock;
    
    if(parseInt(hm.value) >= parseInt(stock.value)) {
    	alert("재고가 부족하여 더 추가 하실 수 없습니다!");
   	} else {
		hm.value ++ ;
	}
	
    sum.value = parseInt(hm.value) * sell_price.value;
}
   
function del () {
	var sell_price = document.fr.sell_price;
    var hm = document.fr.bk_qty;
    var sum = document.fr.sum;
    if (hm.value > 1) {
       hm.value -- ;
       sum.value = parseInt(hm.value) * sell_price.value;
    }
}
   
function change() {
	var hm = document.fr.bk_qty;
    var sum = document.fr.sum;

    if (hm.value < 0) {
       hm.value = 0;
    }
    
    sum.value = parseInt(hm.value) * sell_price;
}

// 재고가 부족한 상품을 구매할 시  
function stock() {
	alert("재고가 부족하여 구매할 수 없습니다.");
}  

// 장바구니 클릭 시 팝업창을 이용한 이동
function choice(name , moveChoice) {
	var mem_id = document.fr.mem_id;
//	var mem_id = admin;
	var fr = document.fr;
	
	if(mem_id.value == "") {
		alert("로그인 후 이용가능합니다!");
		location.href = "./login_form.me"
	} else {
		if(moveChoice) {
			document.getElementById("choiceCheck").value = name;
			fr.submit();
		}
	}
}

// 팝업창에서 버튼 클릭 시 부모창에 줄 값
function cartChoice(target) {
	if(target == "cart") {
		window.choice("cart", true);
		
	} else if(target == "list"){
		window.choice("list", true);
		
	} else {
		window.choice("close", true);
		
	}
	
	window.close();
}

// 장바구니 담기 후 ESC 클릭 이벤트 발생 시 값 넣기
//$("#close").on("keyup", function() {
//	if (keyCode == 27 || which == 27 ) {
//		window.choice("close", true);
//    }	
//});
	    
		
// 상세 정보
$(document).ready(function(){
	$("#review").click(function() {
		
		var scrollPosition = $(".reviews").offset().top;
		$("html").animate({scrollTop: scrollPosition}, 500); 
	});
	
	$("#qna").click(function() {
	
		var scrollPosition = $(".qnas").offset().top;
		$("html").animate({scrollTop: scrollPosition}, 500); 
	});
	
	$("#about").click(function() {
		
		var scrollPosition = $(".about_product").offset().top;
		$("html").animate({scrollTop: scrollPosition}, 500); 
	});
});		
		
		
