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
				<form action="list">
					<div class="input-group mb-3 w-30 col-centered">
						<div class="w-25">
						<select class="form-select" name="searchn">
							<option selected="selected" value="4">세분류</option>
							<option value="1">대분류</option>
							<option value="2">중분류</option>
							<option value="3">소분류</option>
							<option value="0">KAN코드</option>
						</select>
						</div>
						<input type="text" name="search" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
						<button class="btn btn-info" type="submit" id="button-addon2 searchBtn">검색</button>
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
		                                <a class="page-link" href="list?p=${begin - 1 }"><</a>
		                            </li>
		                        </c:if>
		                        <c:forEach begin="${begin }" end="${end }" var="i">
		                            <li class="page-item <c:if test="${p == i}"> active </c:if>">
		                                <a class="page-link " href="list?p=${i }">${i }</a>
		                            </li>
		                        </c:forEach>
		                        <c:if test="${end < totalPages }">
		                            <li class="page-item">
		                                <a class="page-link" href="list?p=${end + 1 }">></a>
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
	
	
	
	
</script>	



</body>
</html>