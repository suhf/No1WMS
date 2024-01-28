<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="mt-5 mb-5 text-center">
        <div class="row">
            <h1>입고 수정</h1>
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
                            <input type="text" class="form-control" name="productName" placeholder="제품명을 검색하세요"
                                aria-label="제품명" id="productName" value="${dto.productDto.name}" readonly>
                            <input type='hidden' id="product_id" value="${dto.product_id}">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span id='company_name_span' class="input-group-text">회사명</span>
                            <input readonly id="company_name" type="text" class="form-control"
                                value="${pDto.company_name}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span id='cls_Nm_4_span' class="input-group-text">분류</span>
                            <input readonly id="cls_Nm_4" type="text" class="form-control"
                                value="${pDto.categoryDto.cls_nm_4}" readonly>
                        </div>

						<div class="input-group mb-3 w-40 col-centered">
                            <span id='cls_Nm_4_span' class="input-group-text">거래처</span>
                            <input readonly id="vendor_name" type="text" class="form-control"
                                value="${pDto.vendorDto.name}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon2">수량</span>
                            <input type="number" name="quantity" id="quantity" class="form-control"
                                value="${dto.quantity}">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon3">창고명</span>
                            <input type="text" name="warehouse_name" id="warehouse_name" class="form-control"
                                placeholder="창고를 검색하세요" aria-label="창고명" value="${dto.warehouseDto.name}"
                                aria-describedby="basic-addon1" readonly>
                            <input type='hidden' id="warehouse_id" value="${dto.warehouse_id}">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span id='address_span' class="input-group-text">주소</span>
                            <input readonly id="Address_name" type="text" class="form-control"
                                value="${wDto.address}">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span id='capacity_span' class="input-group-text">용적</span>
                            <input readonly id="Capacity_name" type="text" class="form-control"
                                value="${wDto.capacity}">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span id='remainingCapacity_span' class="input-group-text">잔여 용량</span>
                            <input readonly id="remainingcapacity" type="text" placeholder=""
                                value="${wDto.currentCapacity}" class="form-control">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon4">입고날짜</span>
                            
                            <fmt:formatDate value="${dto.in_date}" pattern="yyyy-MM-dd HH:mm:ss" type="date" var="formattedDate" />
		                	<input type="datetime-local" id="in_date" name="in_date" class="form-control" 
		                	placeholder="날짜을 입력하세요" aria-label="입고날짜" value="${formattedDate}" 
		                	aria-describedby="basic-addon1">

                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon5">메모</span>
                            <input type="text" name="note" id="note" class="form-control"
                                placeholder="메모를 입력하세요" aria-label="메모" value="${dto.note}"
                                aria-describedby="basic-addon1">
                        </div>

                        <c:set var="userData" value="${sessionScope.userData}" />
                        <input type='hidden' id="manager_id" value="${userData.id}">
                        <input type='hidden' id="id" value="${dto.id}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 ">
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
	$(document).ready(function(){
		$("#cancelBtn").on("click", function(){
			var id = $("#id").val();
			
			var form = document.createElement("form");
			form.action = "/in/read";
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
        	var product_id = $("#product_id").val();
			var quantity = $("#quantity").val();
			var warehouse_id = $("#warehouse_id").val();
			var in_date = $("#in_date").val();
			var manager_id = $("#manager_id").val();
			var note = $("#note").val();
			var id = $("#id").val();
			var quantityAdjustment = parseInt($("#quantityAdjustment").val(), 10);
            var remainingcapacity = parseInt($("#remainingcapacity").val(), 10);
			
			
    		if(!product_id){
	   			alert("제품을 선택해야합니다.");
	   			return false;
	   		}
			
			if(!quantity){
	   			alert("수량을 입력해야 합니다.");
	   			$("#quantity").focus();
	   			return false;
	   		}
			if(!warehouse_id){
	   			alert("창고을 선택해야합니다.");
	   			return false;
	   		}
			if (quantityAdjustment > remainingcapacity) {
                alert("적재 할 재고량이 재고량 한도를 넘을 수 없습니다.");
                $("#quantityAdjustment").focus();
                return false;
            }
			
			if(!in_date){
				in_date = new Date();
				in_date = in_date.toISOString();
			}
			if(!note){
				note = "";
			}
			
			const data = {
					product_id : product_id,
					quantity : quantity,
					in_date : in_date,
					manager_id : manager_id,
					warehouse_id : warehouse_id,
					note : note,
					id : id
			}
			console.log(data);
    		$.ajax({
            	url: "/in/update_process",
            	type: "put",
            	data: data,
            		datatype:"json"
            }).done(function(data) {
                if (data == true) {
                	alert("입고 정보를 수정했습니다.");
                	
                	var form = document.createElement("form");
    				form.action = "/in/read";
    				form.method = "POST";
    				document.body.appendChild(form);
    				
    				var input = document.createElement("input");
    				input.type = "hidden";
    				input.name = "id";
    				input.value = id;
    				form.appendChild(input);
    				
    				form.submit();
                	
                	
                	
                	
                } else {
                	alert("입고 수정에 실패하였습니다.");
                	console.log(data);
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
				//		
            });
          });//submitBtn
        
	});//ready
	function showSearchModal_product(title, val){
	       $("#searchModalLabel").text(title);
	       const data = { name : val};
	       $.ajax({
	           type : 'post',           // 타입 (get, post, put 등등)
	           url : '/in/show_modal_product',           // 요청할 서버url
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
	   }//showSearchModal_products
	
	function showSearchModal_warehouse(title, val){
	     $("#searchModalLabel").text(title);
	     const data = { name : val};
	     $.ajax({
	         type : 'post',           // 타입 (get, post, put 등등)
	         url : '/in/show_modal_warehouse',           // 요청할 서버url
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
 	}//showSearchModal_warehouse
	</script>
</body>
</html>