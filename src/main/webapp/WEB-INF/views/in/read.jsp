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
            <h1>입고 상세페이지</h1>
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
                            <span class="input-group-text" id="basic-addon1">제품명</span>
                            <input type="text" class="form-control" placeholder="제품명" aria-label="제품명" value="${dto.productDto.name}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon2">회사명</span>
                            <input type="text" class="form-control" placeholder="회사명" aria-label="회사명" value="${pDto.company_name}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon3">분류</span>
                            <input type="text" class="form-control" placeholder="분류" aria-label="분류" value="${pDto.categoryDto.cls_nm_4}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon4">거래처</span>
                            <input type="text" class="form-control" placeholder="거래처" aria-label="거래처" value="${pDto.vendorDto.name}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon5">수량</span>
                            <input type="number" class="form-control" placeholder="수량을 입력하세요" aria-label="수량" value="${dto.quantity}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon6">창고명</span>
                            <input type="text" class="form-control" placeholder="창고명" aria-label="창고명" value="${dto.warehouseDto.name}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon7">입고날짜</span>
                            <fmt:formatDate value="${dto.in_date}" pattern="yyyy-MM-dd HH:mm:ss" type="date" var="formattedInDate" />
                            <input type="datetime-local" id="in_date" name="in_date" class="form-control" placeholder="날짜을 입력하세요" aria-label="입고날짜" value="${formattedInDate}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon8">메모</span>
                            <input type="text" class="form-control" placeholder="메모가 없습니다." aria-label="메모" value="${dto.note}" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon9">담당자</span>
                            <input type="text" class="form-control" placeholder="담당자" aria-label="담당자" value="${dto.accountDto.name}" readonly>
                        </div>

                        <input type='hidden' id="id" value="${dto.id}">
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
				$(location).attr("href", "/in/list");
			})//checkBtn click
			$("#modifyBtn").on("click", function() {
				var id = $("#id").val();
				
				var form = document.createElement("form");
				form.action = "/in/update";
				form.method = "POST";
				document.body.appendChild(form);
				
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "id";
				input.value = id;
				form.appendChild(input);
				
				form.submit();
				
				
			})//modifyBtn click
			
			
			
		});//ready
		
		function deleteInFunction(){
			var id = $("#id").val();
			$.ajax({
            	url: "/in/delete",
            	type: "delete",
            	data: {
            		   "id": id
            		},
            	datatype:"json"
            }).done(function(data) {
                if (data == true) {
                	alert("삭제되었습니다.");
    				$(location).attr("href", "/in/list");
                } else {
                	alert("정상적으로 삭제되지 않았습니다.");
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
				//		
            });
			
		}//deleteInFunction
		
		
		function goDelete(){
	        yesNoModalTextDefine("입고 삭제", "해당 입고를 삭제하시겠습니까?");
	        $("#yesNoModalLabel").text(yesNoModal.title);
	        $("#yesNoModalBodyTextDiv").text(yesNoModal.body);
	        yesNoModal.yesFunction = deleteInFunction;
	        yesNoModalBootStrap.show();
	    }
		
		
		
		
		
		
	</script>
</body>
</html>