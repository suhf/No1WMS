<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1>제품 관리</h1>
	</div>
	<hr>
	<div class="body">
		<div class="container-fluid">
			<div class="col-12">
				<form action="productSearch">
					<div class="input-group mb-3 w-30 col-centered">
						<div class="w-25">
						<select class="form-select" name="searchn" id="searchn">
							<option selected="selected" value="0" <c:if test="${searchn == 0}">selected="selected"</c:if>>제품명</option>
							<option value="1" <c:if test="${searchn == 1}">selected="selected"</c:if>>회사명</option>
							<option value="2" <c:if test="${searchn == 2}">selected="selected"</c:if>>분류</option>
							<option value="3" <c:if test="${searchn == 3}">selected="selected"</c:if>>담당자명</option>
						</select>
						</div>
						<input type="text" id="search" name="search" value="${search}" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
								<th>번호</th>
								<th>제품명</th>
								<th>회사명</th>
								<th>분류</th>
								<th>거래처</th>
								<th>등록날짜</th>
								<th>담당자</th>
							</tr>
						</thead>
							<tbody>
								<c:forEach items="${list }" var="dto" varStatus="status">
									<tr class="detailTr" data-product_id="${dto.id}" >
										<td>${status.count }</td>
										<td>${dto.name }</td>
										<td>${dto.company_name }</td>
										<td>${dto.categoryDto.cls_nm_4 }</td>
										<td>${dto.vendorDto.name }</td>
										<td><fmt:formatDate value="${dto.registration_date}" pattern="yyyy-MM-dd" type="date"/></td>
										<td>${dto.accountDto.name }</td>
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
				<div class="col-3 text-end">
					<button type="button" class="btn btn-primary" id="createButton">추가</button>
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
			form.action = "/product/create";
			form.method = "POST";
			document.body.appendChild(form);
			form.submit();
		});//createButton
		
		$("body").on("click", ".detailTr", function(){
		    var product_id = $(this).data("product_id");
			
		   	//console.log(product_id);
		   	
		   	var form = document.createElement("form");
			form.action = "/product/read";
			form.method = "POST";
			document.body.appendChild(form);
			
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "id";
			input.value = product_id;
			form.appendChild(input);
			
			form.submit();
	
		});//body detailTr
		
		$("#searchBtn").on("click",function(){
			
			var searchn = $("#searchn").val();
			var search = $("#search").val();
			
			var form = document.createElement("form");
			form.action = "/product/list";
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
	
	function pagingFunction(clickedId){
		var searchn1 = $("#searchn1").val();
		var search1 = $("#search1").val();
		
		var form = document.createElement("form");
		form.action = "/product/list";
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