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
		<h1>입고 관리</h1>
	</div>
	<hr>
	<div class="body">
		<div class="container-fluid">
			<div class="col-12">
				<form>
					<div class="input-group mb-3 w-30 col-centered">
						<div class="w-25">
						<select class="form-select" name="searchn" id="searchn">
							<option selected="selected" value="0">제품명</option>
							<option value="1">입고날짜</option>
							<option value="2">담당자</option>
							<option value="3">입고예정그룹번호</option>
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
								<th>제품명</th>
								<th>가격</th>
								<th>수량</th>
								<th>입고예정그룹번호</th>
								<th>입고날짜</th>
								<th>담당자</th>
							</tr>
						</thead>
							<tbody>
								<c:forEach items="${list }" var="dto" varStatus="status">
									<tr class="detailTr" data-id="${dto.id }" >
										<td>${status.count }</td>
										<td>${dto.productDto.name }</td>
										<td>${dto.latest_price }</td>
										<td>${dto.quantity }</td>
										<td>${dto.planInDto.viewGroupNumber }</td>
										<td><fmt:formatDate value="${dto.in_date}" pattern="yyyy-MM-dd" type="date"/></td>
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
			form.action = "/in/create";
			form.method = "POST";
			document.body.appendChild(form);
			form.submit();
		});//createButton
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	});//ready
	
	</script>
</body>
</html>