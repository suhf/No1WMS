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
						<select class="form-select">
							<option selected="selected" value="name">제품명</option>
							<option value="cls_nm_1">회사명</option>
							<option value="cls_nm_2">등록날짜</option>
							<option value="cls_nm_3">담당자명</option>
							<option value="kan_code">KAN코드</option>
						</select>
						</div>
						<input type="text" name="productSearch" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
						<button class="btn btn-info" type="button" id="button-addon2 searchBtn">검색</button>
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
								<th>제품명</th>
								<th>회사명</th>
								<th>분류</th>
								<th>거래처</th>
								<th>등록날짜</th>
								<th>담당자</th>
							</tr>
						</thead>
							<tbody>
								<c:forEach items="${list }" var="dto">
									<tr class="detailTr" data-product_id="${dto.id}" >
										<td>${dto.name }</td>
										<td>${dto.company_name }</td>
										<td>${dto.categoryDto.cls_nm_4 }</td>
										<td>${dto.vendorDto.name }</td>
										<td><fmt:formatDate value="${dto.registration_date }"
												dateStyle="short" /></td>
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
							<li class="page-item">
								<a class="page-link" href="#">&lt;</a>
							</li>
							<li class="page-item active">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">2</a>
							</li>								
							<li class="page-item">
								<a class="page-link" href="#">3</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">4</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">5</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">6</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">&gt;</a>
							</li>
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
			
			
		});
		
		
		
		
		
		
	});//ready
	
	
	
	</script>
</body>
</html>