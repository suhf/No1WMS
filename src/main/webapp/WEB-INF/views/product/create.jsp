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
  							<input type="text" name="cls_nm_4" id="cls_nm_4" class="form-control" 
  							placeholder="분류를 검색하세요" aria-label="분류" 
  							aria-describedby="button-addon2" readonly>
  							<button class="btn btn-outline-secondary rounded-end" id="searchKan" 
  							style="background-color:#FF5E5E;" type="button" onclick="showSearchModal('분류 검색','category')" >검색</button>
  							<input type='hidden' id="kan_code" value="">
  							
						</div>
						
						<div class="input-group mb-3 w-40 col-centered">
	                		<span class="input-group-text" id="basic-addon4">거래처</span>
  							<input type="text" name="vendor" id="vendor" class="form-control" 
  							placeholder="거래처를 입력하세요" aria-label="거래처"
  							aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary rounded-end" id="searchVendor" 
  							style="background-color:#FF5E5E;" type="button" onclick="showSearchModal2('거래처 검색','vendor')">검색</button>
  							<input type='hidden' id='searchVendorChack' value='0'>
						</div>
						
	                	<!-- 추후 수정 -->
	                	<input type='hidden' id="manager_id" value="83bdda69-ae95-11ee-935d-0242ac110006">
	                	<input type='hidden' id="vendor_id" value="52f16bb8-aeb9-11ee-935d-0242ac110006">
	                	
	                	
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


<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			
	        $("#submitBtn").on("click", function(){
	        	var name = $("#name").val();
	        	var company_name = $("#company_name").val();
	        	var kan_code = $("#kan_code").val();
	        	var vendor = $("#vendor_id").val();// 수정해야함.
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
	    			alert("분류를 검색해야 합니다.");
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
		 
		 function showSearchModal(title, val){
		        $("#searchModalLabel").text(title);
		        const data = { name : val};
		        $.ajax({
		            type : 'post',           // 타입 (get, post, put 등등)
		            url : '/product/show_modal',           // 요청할 서버url
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
		 
		 function showSearchModal2(title, val){
		        $("#searchModalLabel").text(title);
		        const data = { name : val};
		        $.ajax({
		            type : 'post',           // 타입 (get, post, put 등등)
		            url : '/category/show_modal',           // 요청할 서버url
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