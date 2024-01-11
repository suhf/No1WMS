<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 카테고리</title>
</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1>제품 카테고리 관리</h1>
	</div>
	<hr>
	<div class="body">
		<div class="container-fluid">
			<div class="col-12">
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
		<div class="container-fluid">
			<div class="row row-buttons">
				<div class="col-3 text-start">
					<!-- <img alt="엑셀이미지" src="엑셀이미지"> -->
					<button type="button" class="btn btn-success" id="uploadExcel">업로드</button>
				</div>
				<div class="col-6 d-flex justify-content-center">
					<nav>
						<ul class="pagination">
							
	                        <c:if test="${begin > pageNum }">
	                            <li class="page-item">
	                                <a href="javascript:void(0);" class="page-link" onclick="pageingFunction(this.id)" id="${begin - 1 }">&lt;</a>
	                            </li>
	                        </c:if>
	                        <c:forEach begin="${begin }" end="${end }" var="i">
	                            <li class="page-item <c:if test="${p == i}"> active </c:if>">
	                                <a href="javascript:void(0);" class="page-link " onclick="pageingFunction(this.id); return false;" id="${i }">${i }</a>
	                            </li>
	                        </c:forEach>
	                        <c:if test="${end < totalPages }">
	                            <li class="page-item">
	                                <a href="javascript:void(0);" class="page-link" onclick="pageingFunction(this.id)" id="${end + 1 }">&gt;</a>
	                            </li>
	                        </c:if>
                    	</ul>
					</nav>
				</div>
				<div class="col-3 text-end">
					<button type="button" class="btn btn-primary" id="createButton">생성</button>
				</div>	
			</div><!-- row row-buttons -->
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<script>
	
	
	$(document).ready(function(){
		//POST방식으로 create폼화면 출력
		$("#createButton").on("click",function(){
			var form = document.createElement("form");
			form.action = "/category/create";
			form.method = "POST";
			document.body.appendChild(form);
			form.submit();
		});
	
		 $("body").on("click", ".detailTr", function(){
		    var kan_code = $(this).data("kan_code");
			
			var form = document.createElement("form");
			form.action = "/category/read";
			form.method = "POST";
			document.body.appendChild(form);
			
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "kan_code";
			input.value = kan_code;
			form.appendChild(input);
			
			form.submit();

		});
		 
		//검색기능
		$("#searchBtn").on("click",function(){
			
			var searchn = $("#searchn").val();
			var search = $("#search").val();
			
			var form = document.createElement("form");
			form.action = "/category/list";
			form.method = "get";
			
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

		});
		
		
		 
	});//ready
	function pageingFunction(clickedId){
		var searchn1 = $("#searchn1").val();
		var search1 = $("#search1").val();
		
		var form = document.createElement("form");
		form.action = "/category/list";
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