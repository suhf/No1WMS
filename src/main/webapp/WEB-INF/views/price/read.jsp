<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 가격 상세페이지</title>
</head>
<body>
<div class="mt-5 mb-5 text-center">
	
		<div class="row">
		<h1>제품 상세페이지</h1>
			<div class="col-10" style="text-align: right;">
				<button type="button" class="btn btn-danger" onclick="goDelete()">삭제</button>
			</div>
		</div>
	</div>
	<hr>

	<div style="text-align: center">
		<form>
			<div class="ulTag">
				<div class="row">
					<div class="col-12" style="text-align: center;">
						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon1">제품명</span> <input
								type="text" class="form-control" placeholder="제품명"
								aria-label="제품명" value="${dto.productDto.name }" readonly>
						</div>

						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon2">가격</span> <input
								type="text" class="form-control" placeholder="가격"
								aria-label="가격" value="${dto.price }" readonly>
						</div>

						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon3">등록날짜</span> <input
								type="text" class="form-control" placeholder="등록날짜"
								aria-label="등록날짜" value="${dto.registration_date }" readonly>
						</div>
						
						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon4">담당자</span> <input
								type="text" class="form-control" placeholder="담당자"
								aria-label="담당자" value="${dto.accountDto.name }" readonly>
						</div>
						<input type='hidden' id="id" value="${dto.id }">
						
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12 ">
					<div class="w-40 col-centered" style="text-align: right">
						<button type="button" class="btn btn-primary" id="checkBtn">확인</button>
						<button type="button" class="btn btn-warning" id="modifyBtn">수정</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#checkBtn").on("click", function() {
			$(location).attr("href", "/price/list");
			
		})//checkBtn click
	
		$("#modifyBtn").on("click", function() {
			var id = $("#id").val();
			
			var form = document.createElement("form");
			form.action = "/price/update";
			form.method = "POST";
			document.body.appendChild(form);
			
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "id";
			input.value = id;
			form.appendChild(input);
			
			form.submit();
			
			
		})//modifyBtn click
		
		yesNoModal.yesFunction = deletePriceFunction;
		
		
		
	
	});//ready
	
	function deletePriceFunction(){
		var id = $("#id").val();
		$.ajax({
        	url: "/price/delete",
        	type: "delete",
        	data: {
        		   "id": id
        		},
        	datatype:"json"
        }).done(function(data) {
            if (data == true) {
            	alert("삭제되었습니다.");
				$(location).attr("href", "/price/list");
            } else {
            	alert("정상적으로 삭제되지 않았습니다..");
            }
        }).fail(function() {
            alert("오류가 발생했습니다.");
        }).always(function() {
			//		
        });
	}//deletePriceFunction
	
	function goDelete(){
        yesNoModalTextDefine("제품가격 삭제", "해당 제품가격을 삭제하시겠습니까?");
        $("#yesNoModalLabel").text(yesNoModal.title);
        $("#yesNoModalBodyTextDiv").text(yesNoModal.body);
        yesNoModal.yesFunction = deletePriceFunction;
        yesNoModalBootStrap.show();


    }
	
	</script>
</body>
</html>