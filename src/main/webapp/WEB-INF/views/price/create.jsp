<%@ page contentType="text/html; charset=UTF-8"%>
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
	                	<!-- 설명만 있는 입력 -->
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon2">가격</span>
		                	<input type="number" name="price" id="price" class="form-control" 
		                	placeholder="가격을 입력하세요" aria-label="가격" value="${dto.price }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	
	                	<!-- 추후 수정 -->
	                	<input type='hidden' id="manager_id" value="83bdda69-ae95-11ee-935d-0242ac110006">
	                	
	                	
	                	<!-- 추후 수정 -->
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#cancelBtn").on("click", function(){
       	$(location).attr("href", "/product/list");
       	
       })
       
       $("#submitBtn").on("click", function(){
       	
       	var price = $("#price").val();
       	var manager_id = $("#manager_id").val();// 수정해야함.
       	var product_id = $("#product_id").val();// 수정해야함.
       	
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
           		   "manager_id": manager_id, // 추후 수정해야함.
           		   "product_id": product_id, // 추후 수정해야함. 
           		   "activation": true
           		},
           		datatype:"json"
           }).done(function(data) {
               if (data == true) {
               	alert("제품 가격을 추가했습니다.");
               	$(location).attr("href", "/price/list");
               	
               	
               	//생각해서 바꿔야함. 
               	// 조건 : DB에서 생성되는 uuid를 어떻게 자바스크립트에서 가져올것인지 궁리.
				/*
   				var form = document.createElement("form");
   				form.action = "/product/read";
   				form.method = "POST";
   				document.body.appendChild(form);
   				
   				var input = document.createElement("input");
   				input.type = "hidden";
   				input.name = "id";
   				input.value = data.id;
   				form.appendChild(input);
   				
   				form.submit();
   				*/
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