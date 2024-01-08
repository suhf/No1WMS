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
				<form action="categorySearch">
					<div class="input-group mb-3 w-30 col-centered">
						<div class="w-25">
						<select class="form-select">
							<option selected="selected" value="cls_nm_4">세분류</option>
							<option value="cls_nm_1">대분류</option>
							<option value="cls_nm_2">중분류</option>
							<option value="cls_nm_3">세분류</option>
							<option value="kan_code">KAN코드</option>
						</select>
						</div>
						<input type="text" name="categorySearch" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
					<img alt="엑셀이미지" src="엑셀이미지">
					<button type="button" class="btn btn-success" id="uploadExcel">업로드</button>
				</div>
				<div class="col-6 d-flex justify-content-center">
					<nav>
						<ul class="pagination">
							<li class="page-item">
								<a class="page-link" href="#">&lt;</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item active">
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
	
	});//ready
	</script>
</body>
</html>