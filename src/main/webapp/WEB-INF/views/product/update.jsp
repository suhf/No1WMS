<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="mt-5 mb-5 text-center">
        <div class="row">
            <h1>제품 수정</h1>
        </div>
    </div>
    <hr>

    <div style="text-align: center">
        <form>
            <div class="ulTag">
                <div class="row">
                    <div class="col-12" style="text-align: center;">
                    
                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon1">제품명</span>
                            <input type="text" class="form-control" name="newProductName" placeholder="제품명을 입력하세요" 
                            aria-label="제품명" id="name" value="${dto.name }">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon2">회사명</span>
                            <input type="text" class="form-control" name="newCompanyName" placeholder="회사명을 입력하세요(선택)" 
                            aria-label="회사명" id="company_name"  value="${dto.company_name }">
                        </div>
                        
						<div class="input-group mb-3 w-40 col-centered">
	                		<span class="input-group-text" id="basic-addon3">분류</span>
  							<input type="text" name="cls_nm_4" id="cls_nm_4" class="form-control" 
  							placeholder="분류를 검색하세요" aria-label="분류" value="${dto.categoryDto.cls_nm_4 }"
  							aria-describedby="button-addon2" readonly>
  							<button class="btn btn-outline-secondary rounded-end" id="searchKan" 
  							style="background-color:#FF5E5E;" type="button" onclick="showSearchModal('분류 검색','category')" >검색</button>
  							<input type='hidden' id="kan_code" value="${dto.kan_code }">
  							
						</div>
						
                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon4">거래처</span>
                            <input type="text" class="form-control" name="newVendor" placeholder="거래처를 입력해도 바뀌는 건 없습니다." 
                            aria-label="거래처" id="vendor"  value="${dto.vendorDto.name }">
                            
                            <button class="btn btn-outline-secondary rounded-end" id="searchVendor" 
  							style="background-color:#FF5E5E;" type="button" >검색</button>
  							<input type='hidden' id='searchVendorChack' value='0'>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon5">등록날짜</span>
                            <input type="text" class="form-control" name="newRegistrationDate"  
                            aria-label="등록날짜" readonly id="registration_date"  value="${dto.registration_date } (자동)">
                        </div>

						<input type='hidden' id="id" value="${dto.id }">
                        <!-- 추후 수정 -->
	                	<input type='hidden' id="manager_id" value="83bdda69-ae95-11ee-935d-0242ac110006">
	                	<input type='hidden' id="vendor_id" value="${dto.vendor_id }">
	                	
	                	
	                	<!-- 추후 수정 -->
                        
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="w-40 col-centered" style="text-align: right">
                        <button type="button" class="btn btn-primary" id="submitBtn">수정 완료</button>
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
				var id = $("#id").val();
				
				var form = document.createElement("form");
				form.action = "/product/read";
				form.method = "POST";
				document.body.appendChild(form);
				
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "id";
				input.value = id;
				form.appendChild(input);
				
				form.submit();
	        	
	        })//cancelBtn
        	
	        $("#submitBtn").on("click", function(){
	        	var name = $("#name").val();
	        	var company_name = $("#company_name").val();
	        	var kan_code = $("#kan_code").val();
	        	var vendor_id = $("#vendor_id").val();
	        	var manager_id = $("#manager_id").val();
	        	var id = $("#id").val();
	        	
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
	    		if(!vendor_id){
	    			alert("거래처를 입력해야 합니다.");
	    			//$("#vendor").focus();
	    			return false;
	    		}

	    		$.ajax({
	            	url: "/product/update_process",
	            	type: "put",
	            	data: {
	            			"id":id,
	            		   "name": name,
	            		   "company_name": company_name,
	            		   "kan_code": kan_code,
	            		   "vendor_id": vendor_id, 
	            		   "manager_id": manager_id,
	            		   "activation": true
	            		},
	            		datatype:"json"
	            }).done(function(data) {
	                if (data == true) {
	                	alert("제품을 수정했습니다.");
	                	//$(location).attr("href", "/product/list");

	    				var form = document.createElement("form");
	    				form.action = "/product/read";
	    				form.method = "POST";
	    				document.body.appendChild(form);
	    				
	    				var input = document.createElement("input");
	    				input.type = "hidden";
	    				input.name = "id";
	    				input.value = id;
	    				form.appendChild(input);
	    				
	    				form.submit();
	    				
	                } else {
	                	alert("제품 수정에 실패하였습니다.");
	                }
	            }).fail(function() {
	                alert("오류가 발생했습니다.");
	            }).always(function() {
					//		
	            });
	    		
	    		
	          });//submitBtn
	        
		
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
	
	
	</script>
    
</body>
</html>