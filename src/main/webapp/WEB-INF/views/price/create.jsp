<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 가격 생성</title>

<style>
.col-centered{
      margin: 0 auto;
      float: none;
    }
.col-margin-left-32{
	margin-left: 32%;
}
</style>

</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1>제품 가격 생성</h1>
	</div>
	<hr>
	<div style="text-align: center">
		<form id="createForm">
			<div class="ulTag">
				<div class="row">
	                <div class="col-12" style="text-align: center;">
	                
		                <div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">제품명</span>
		                	<input type="text" name="productName" id="productName" class="form-control" 
		                	placeholder="제품명을 검색하세요" aria-label="제품명" value="${dto.productDto.name }" 
		                	aria-describedby="basic-addon1" readonly>
		                	<button class="btn btn-outline-secondary rounded-end" id="searchProductName" 
  							style="background-color:#FF5E5E;" type="button" onclick="showSearchModal('제품 검색','product')" >검색</button>
  							<input type='hidden' id="product_id" value="">
		                	
	                	</div>
	                	
	                	<div class="input-group mb-3 w-40 col-centered">
	                        <span id='company_name_span' class="input-group-text">회사명</span>
	                        <input readonly id="company_name" type="text" class="form-control" placeholder="">
	                    </div>
	
	                    <div class="input-group mb-3 w-40 col-centered">
	                        <span id='cls_Nm_4_span' class="input-group-text">분류</span>
	                        <input readonly id="cls_Nm_4" type="text" class="form-control" placeholder="">
	                    </div>
	
	                    <div class="input-group mb-3 w-40 col-centered">
	                        <span id='vendor_name_span' class="input-group-text">거래처</span>
	                        <input readonly id="vendor_name" type="text" placeholder="" value="" class="form-control">
	                    </div>
	                    
	                	
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon2">가격</span>
		                	<input type="number" name="price" id="price" class="form-control" 
		                	placeholder="가격을 입력하세요" aria-label="가격" value="${dto.price }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	
	                	<c:set var="userData" value="${sessionScope.userData}" />
	                	<input type='hidden' id="manager_id" value="${userData.id }">
                	</div>
            	</div>
			</div>
			<div class="row">
				<div class="col-12 ">
					<div class="w-40 col-centered" style="text-align: right">
						<button type="button" class="btn btn-success" id="submitBtn">생성</button>
						<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#cancelBtn").on("click", function(){
       	$(location).attr("href", "/product/list");
       	
       })
       
       $("#submitBtn").on("click", function(){
       	
       	var price = $("#price").val();
       	var manager_id = $("#manager_id").val();
       	var product_id = $("#product_id").val();
       	
   		if(!price){
   			alert("가격을 입력해야 합니다.");
   			$("#price").focus();
   			return false;
   		}
   		if(!product_id){
   			alert("제품을 선택해야합니다.");
   			return false;
   		}
   		
   		
   		$.ajax({
           	url: "/price/create_process",
           	type: "post",
           	data: {
           		   "price": price,
           		   "manager_id": manager_id,
           		   "product_id": product_id,
           		   "activation": true
           		},
           		datatype:"json"
           }).done(function(data) {
               if (data == true) {
               	alert("제품 가격을 추가했습니다.");
               	$(location).attr("href", "/price/list");
               } else {
               	alert("제품 가격 추가에 실패하였습니다.");
               }
           }).fail(function() {
               alert("오류가 발생했습니다.");
           }).always(function() {
			//		
           });
         });
       
       
});//ready

function showSearchModal(title, val){
       $("#searchModalLabel").text(title);
       const data = { name : val};
       $.ajax({
           type : 'post',           // 타입 (get, post, put 등등)
           url : '/price/show_modal',           // 요청할 서버url
           dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
           data : data,
           success : function(result) { // 결과 성공 콜백함수
               $("#search_modal_body").html(result);
               searchModalBootStrap.show();
           },
           error : function(request, status, error) {
               alert(error)
           }
       });
   }


</script>
</body>
</html>