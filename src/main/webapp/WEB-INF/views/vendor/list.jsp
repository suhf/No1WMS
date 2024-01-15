<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>
</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1>거래처 관리</h1>
	</div>
	<hr>
	<div class="body">
		<div class="container-fluid">
			<div class="col-12">
				<form>
					<div class="input-group mb-3 w-30 col-centered">
						<div class="w-25">
						<select class="form-select" name="searchn" id="searchn">
							<option value="0">업체명</option>
							<option value="1">대표번호</option>
							<option value="2">거래처 담당자</option>
							<option value="3">거래처 담당자 전화번호</option>
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
								<th>번호</th>
								<th>업체명</th>
								<th>대표번호</th>
								<th>거래처 담당자</th>
								<th>거래처 담당자 전화번호</th>

							</tr>
						</thead>
							<tbody>
								<c:forEach items="${vlist }" var="dto">
									<tr class="detailTr col-5" data-id="${dto.id}" >
										<td class="col-1">${start} <c:set var="start" value="${start +1 }"/></td>
										<td class="col-1">${dto.name }</td>
										<td class="col-1">${dto.president_telephone }</td>
										<td class="col-1">${dto.vendor_manager }</td>
										<td class="col-1">${dto.vendor_manager_telephone }</td>
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
					<img width="50" height="50" src="https://img.icons8.com/color/48/ms-excel.png" alt="ms-excel"/>
					<button type="button" class="btn btn-success" id="uploadExcel">업로드</button>
					<button type="button" class="btn btn-success" id="download">다운로드</button>
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
			form.action = "/vendor/create";
			form.method = "POST";
			document.body.appendChild(form);
			form.submit();
		});
	
		 $("body").on("click", ".detailTr", function(){
		    var id = $(this).data("id");
			
			var form = document.createElement("form");
			form.action = "/vendor/read";
			form.method = "POST";
			document.body.appendChild(form);
			
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "id";
			input.value = id;
			form.appendChild(input);
			
			form.submit();

		});
		 
		//검색기능
		$("#searchBtn").on("click",function(){
			
			var searchn = $("#searchn").val();
			var search = $("#search").val();
			
			var form = document.createElement("form");
			form.action = "/vendor/list";
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
		form.action = "/vendor/list";
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