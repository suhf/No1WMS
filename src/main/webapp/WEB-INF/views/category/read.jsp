<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 카테고리 상세페이지</title>
</head>
<body>
	<div class="mt-5 mb-5 text-center">
	
		<div class="row">
		<h1>제품 카테고리 상세페이지</h1>
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
							<span class="input-group-text" id="basic-addon1">대분류</span> <input
								type="text" class="form-control" placeholder="대분류"
								aria-label="대분류" value="${dto.cls_nm_1 }" readonly>
						</div>

						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon2">중분류</span> <input
								type="text" class="form-control" placeholder="중분류"
								aria-label="중분류" value="${dto.cls_nm_2 }" readonly>
						</div>

						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon3">소분류</span> <input
								type="text" class="form-control" placeholder="소분류"
								aria-label="소분류" value="${dto.cls_nm_3 }" readonly>
						</div>

						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon4">세분류</span> <input
								type="text" class="form-control" placeholder="세분류"
								aria-label="세분류" value="${dto.cls_nm_4 }" readonly>
						</div>

						<div class="input-group mb-3 w-40 col-centered">
							<span class="input-group-text" id="basic-addon5">KAN 코드</span> <input
								type="text" class="form-control" placeholder="KAN 코드"
								aria-label="KAN 코드" value="${dto.kan_code }" id="kan_code" readonly>
						</div>
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
				$(location).attr("href", "/category/list");
			})//checkBtn click
			
			
			$("#modifyBtn").on("click", function() {
				var kan_code = $("#kan_code").val();
				
				var form = document.createElement("form");
				form.action = "/category/update";
				form.method = "POST";
				document.body.appendChild(form);
				
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "kan_code";
				input.value = kan_code;
				form.appendChild(input);
				
				form.submit();
				
			})//modifyBtn click
		});//ready
		
		
		
		
		function deleteCategoryFunction(){
			var kan_code = $("#kan_code").val();
			$.ajax({
            	url: "/category/delete",
            	type: "delete",
            	data: {
            		   "kan_code": kan_code
            		},
            	datatype:"json"
            }).done(function(data) {
                if (data == true) {
                	alert("삭제되었습니다.");
    				$(location).attr("href", "/category/list");
                } else {
                	alert("정상적으로 삭제되지 않았습니다.");
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
				//		
            });
			
		}//deleteCategoryFunction
		
		
		function goDelete(){
	        yesNoModalTextDefine("카테고리 삭제", "해당 카테고리를 삭제하시겠습니까?");
	        $("#yesNoModalLabel").text(yesNoModal.title);
	        $("#yesNoModalBodyTextDiv").text(yesNoModal.body);
	        yesNoModal.yesFunction = deleteCategoryFunction;
	        yesNoModalBootStrap.show();
	    }
		
		
        
        
	</script>
</body>
</html>