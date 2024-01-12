<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.modal-body {
    overflow-y: auto; /* 세로 스크롤이 생기면서 테이블이 잘리는 것을 방지 */
}
</style>
</head>
<body>
<div class="modal fade" id="searchKanModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" >
		<div class="modal-content" id="search_modal_content">

			<div class="modal-header">
			  <h1 class="modal-title fs-5" id="searchModalLabel">KAN 분류코드 검색</h1>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="search_modal_body">
				<form>
					<div class="input-group mb-3 w-30 col-centered">
						<div class="w-25">
						<select class="form-select" name="searchn" id="searchn">
							<option selected="selected" value="4">세분류</option>
							<option value="1">대분류</option>
							<option value="2">중분류</option>
							<option value="3">소분류</option>
							<option value="0">KAN코드</option>
						</select>
						</div>
						<input type="text" id="search" name="search" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
						<button class="btn btn-info" type="button" id="searchBtn">검색</button>
						
						<!-- 페이징작업용 -->
						<input type="hidden" id="searchn1" value="${searchn}">
						<input type="hidden" id="search1" value="${search}">
						<!-- 페이징작업용 -->
						
					</div>
				</form>
			</div>	
			<div class="container-fluid modal-body">
				<div class="row row-table modal-body">
					<div class="col-12 modal-body">	
						<table class="table modal-body">
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
			<div class="container-fluid">
				<div class="row row-buttons">
					<div class="col-3 text-start">
					</div>
					<div class="col-6 d-flex justify-content-center">
						<nav>
							<ul class="pagination">
							
	                        <c:if test="${begin > pageNum }">
	                            <li class="page-item">
	                                <a href="javascript:void(0);" class="page-link" onclick="pagingFunction(this.id)" id="${begin - 1 }">&lt;</a>
	                            </li>
	                        </c:if>
	                        <c:forEach begin="${begin }" end="${end }" var="i">
	                            <li class="page-item <c:if test="${p == i}"> active </c:if>">
	                                <a href="javascript:void(0);" class="page-link " onclick="pagingFunction(this.id); return false;" id="${i }">${i }</a>
	                            </li>
	                        </c:forEach>
	                        <c:if test="${end < totalPages }">
	                            <li class="page-item">
	                                <a href="javascript:void(0);" class="page-link" onclick="pagingFunction(this.id)" id="${end + 1 }">&gt;</a>
	                            </li>
	                        </c:if>
                    	</ul>
						</nav>
					</div>
				</div><!-- row row-buttons -->
			</div>
			<div class="modal-footer">
				<button id="modal_yes_button" type="button" class="modal_yes btn btn-primary">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script>
$(document).ready(function(){
	//검색기능
		$("#searchBtn").on("click",function(){
			
			var searchn = $("#searchn").val();
			var search = $("#search").val();
			var existingModal = $("#searchKanModal");
			
			if (existingModal.length === 0) {
			$.ajax({
				 url:"/category/categorysearch",
				 type:"get",
				 data: {
          		   "searchn": searchn,
          		   "search": search,
          		   "p": 1,
          		},
				 datatype:"html"
			 }).done(function(data){
				 $("body").append(data);
				 $("#searchKanModal").modal("show"); 
			 }).fail(function() {
	             alert("오류가 발생했습니다.");
	         }).always(function() {
	        	 //alert("항상뜨는 창입니다.");		
	         }); } else {
	             // 이미 생성된 모달이 있을 경우 기존 모달을 열기
	             existingModal.modal("show");
	         }
			/*
			var input1 = document.createElement("input");
			input1.type = "hidden";
			input1.name = "searchn";
			input1.value = searchn;
			form.appendChild(input1);
			
			var input2 = document.createElement("input");
			input2.type = "hidden";
			input2.name = "search";
			input2.value = search;
			form.appendChild(input2);
			
			var input3 = document.createElement("input");
			input3.type = "hidden";
			input3.name = "p";
			input3.value = 1;
			form.appendChild(input3);
			
			document.body.appendChild(form);
			form.submit();
			*/
		});
		
		
		 
	});//ready
	function pagingFunction(clickedId){
		var searchn1 = $("#searchn1").val();
		var search1 = $("#search1").val();
		
		var form = document.createElement("form");
		form.action = "/category/categorysearch";
		form.method = "get";
		
		var input1 = document.createElement("input");
		input1.type = "hidden";
		input1.name = "searchn";
		input1.value = searchn1;
		form.appendChild(input1);
		
		var input2 = document.createElement("input");
		input2.type = "hidden";
		input2.name = "search";
		input2.value = search1;
		form.appendChild(input2);
		
		var input3 = document.createElement("input");
		input3.type = "hidden";
		input3.name = "p";
		input3.value = clickedId;
		form.appendChild(input3);
		
		document.body.appendChild(form);
		form.submit();
	}

	
	
	
</script>	

</body>
</html>