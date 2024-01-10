<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가</title>
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
		<h1>제품 추가</h1>
	</div>
	<hr>
	<div style="text-align: center">
		<form id="createForm">
			<div class="ulTag">
				<div class="row">
	                <div class="col-12" style="text-align: center;">
		                <div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">제품명</span>
		                	<input type="text" name="name" id="name" class="form-control" 
		                	placeholder="제품명을 입력하세요" aria-label="제품명" value="${dto.name }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	       
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon2">회사명</span>
		                	<input type="text" name="company_name" id="company_name" class="form-control" 
		                	placeholder="회사명을 입력하세요(선택)" aria-label="회사명" value="${dto.company_name }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	
	                	<div class="input-group mb-3 w-40 col-centered">
	                		<span class="input-group-text" id="basic-addon3">분류</span>
  							<input type="number" min="1" name="cls_nm_4" id="cls_nm_4" class="form-control" 
  							placeholder="KAN 분류코드를 입력하세요(모달이 만들어지면 분류로 바꿀예정)" aria-label="분류" 
  							aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary rounded-end" id="searchKan" 
  							style="background-color:#FF5E5E;" type="button" >검색</button>
  							<input type='hidden' id='searchKanChack' value='0'>
						</div>
						
						<div class="input-group mb-3 w-40 col-centered">
	                		<span class="input-group-text" id="basic-addon4">거래처</span>
  							<input type="text" name="vendor" id="vendor" class="form-control" 
  							placeholder="거래처를 입력하세요" aria-label="거래처"
  							aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary rounded-end" id="searchVendor" 
  							style="background-color:#FF5E5E;" type="button" >검색</button>
  							<input type='hidden' id='searchVendorChack' value='0'>
						</div>
						
	                	<!-- 추후 수정 -->
	                	<input type='hidden' id="manager_id" value="83bdda69-ae95-11ee-935d-0242ac110006">
	                	<input type='hidden' id="vendor_id" value="">
	                	<input type='hidden' id="kan_code" value="">
	                	
	                	<!-- 추후 수정 -->
	                	
                	</div>
            	</div>
			</div>
			<div class="row">
				<div class="col-12 ">
					<div class="w-40 col-centered" style="text-align: right">
						<button type="button" class="btn btn-success" id="submitBtn">추가</button>
						<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
						
					</div>
				</div>
			</div>
		</form>



<!-- 모달화면  -->
<div class="modal fade" id="searchKanModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" >
		<div class="modal-content" id="search_modal_content">
			
			<div class="modal-header">
			  <h1 class="modal-title fs-5" id="searchModalLabel">KAN 분류코드 검색</h1>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="search_modal_body">
				<form action="categorySearch">
					<div class="input-group mb-3 w-50 col-centered">
						<div class="w-25">
						<select class="form-select">
							<option selected="selected" value="cls_nm_4">세분류</option>
							<option value="cls_nm_1">대분류</option>
							<option value="cls_nm_2">중분류</option>
							<option value="cls_nm_3">세분류</option>
							<option value="kan_code">KAN코드</option>
						</select>
						</div>
						<input type="text" name="categorySearch" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
						<button class="btn btn-info" type="button" id="button-addon2 searchBtn">검색</button>
					</div>
				</form>
			</div>	
				<div class="container-fluid">
					<div class="row row-table">
						<div class="col-12">	
							<table class="table">
								<thead class="table-dark">
									<tr>
										<th>대분류</th>
										<th>중분류</th>
										<th>소분류</th>
										<th>세분류</th>
										<th>KAN코드</th>
									</tr>
								</thead>
									<tbody>
										<c:forEach items="${list }" var="dto">
											<tr class="detailTr" data-kan_code="${dto.kan_code}" >
												<td>${dto.cls_nm_1 }</td>
												<td>${dto.cls_nm_2 }</td>
												<td>${dto.cls_nm_3 }</td>
												<td>${dto.cls_nm_4 }</td>
												<td>${dto.kan_code }</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
						
						</div>
					</div>
				</div>
			
			<div class="modal-footer">
				<button id="modal_yes_button" type="button" class="modal_yes btn btn-primary">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			
			const searchKanModalBootStrap = new bootstrap.Modal("#searchKanModal");
			$("#searchKan").on("click", function(){
	            searchKanModalBootStrap.show();
	          });//searchKan
		
			$("#searchVendor").on("click", function(){
	            searchModalBootStrap.show();
	          });//searcVendor
			
	        $("#submitBtn").on("click", function(){
	        	var name = $("#name").val();
	        	var company_name = $("#company_name").val();
	        	var kan_code = $("#cls_nm_4").val();// 수정해야함.
	        	var vendor = $("#vendor").val();
	        	var manager_id = $("#manager_id").val();
	    		if(!name){
	    			alert("제품명을 입력해야 합니다.");
	    			$("#name").focus();
	    			return false;
	    		}
	    		if(!company_name){
	    			company_name = "미지정";
	    		}
	    		if(!kan_code){
	    			alert("KAN 분류코드를 입력해야 합니다.");
	    			$("#kan_code").focus();
	    			return false;
	    		}
	    		if(!vendor){
	    			alert("거래처를 입력해야 합니다.");
	    			$("#vendor").focus();
	    			return false;
	    		}
	    		
	    		
	    		$.ajax({
	            	url: "/product/create_process",
	            	type: "post",
	            	data: {
	            		   "name": name,
	            		   "company_name": company_name,
	            		   "kan_code": kan_code,
	            		   "vendor_id": vendor, // 추후 수정해야함. 
	            		   "manager_id": manager_id,
	            		   "activation": true
	            		},
	            		datatype:"json"
	            }).done(function(data) {
	                if (data == true) {
	                	alert("제품을 추가했습니다.");
	                	$(location).attr("href", "/product/list");
	                	
	                	
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
	                	alert("제품 추가에 실패하였습니다.");
	                }
	            }).fail(function() {
	                alert("오류가 발생했습니다.");
	            }).always(function() {
					//		
	            });
	          });
	        
	        $("#cancelBtn").on("click", function(){
	        	$(location).attr("href", "/product/list");
	        	
	        })
	          
	          
	          
	          
	          
	          
		 });//ready
		function searchKanCode(){
			 
		}
		 
		function searchVendor(){
			 
		}
		 
		 
		</script>			
</body>
</html>