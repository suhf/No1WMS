<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	function goDown(target){
		const $target = $(target);
		const name= $target.data("name");
		const catname = $target.data("catname");
		const vendor = $target.data("vendor");
		const id = $target.data("id");

		$("#input_category").val(catname);
		$("#input_vendor").val(vendor);
		$("#input_id").val(id);
		$("#input_name").val(name);


	}

function goTable(){
	const data= {};
	if(!$("#input_name").val()){
		alert("제품명을 입력하세요");
		return false;
	}
		
	if(!$("#input_num").val()){
		alert("수량을 입력하세요");
		return false;
	}
	
	if(!$("#input_date").val()){
		alert("등록날짜을 입력하세요");
		return false;
	}
	
	data.name = $("#input_name").val();
	data.category = $("#input_category").val();
	data.id = $("#input_id").val();
	data.vendor = $("#input_vendor").val();
	data.date = $("#input_date").val();
	data.num = $("#input_num").val();



	addToTable(data);



	hideSearchModal();

}
function pagingFunction(clickedId){
	var title = "입고 예정 추가";
	var searchn = $("#searchn1").val();
	var search = $("#search1").val();
	$("#searchModalLabel").text(title);
	const data = { 
    		searchn : searchn,
    		search : search,
    		p : parseInt(clickedId)
    		};
	$.ajax({
        type : 'post',           // 타입 (get, post, put 등등)
        url : '/plan_in/planin_add',           // 요청할 서버url
        dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
        data : data,
        success : function(result) { // 결과 성공 콜백함수
            $("#search_modal_body").html(result);
            searchModalBootStrap.show();
        },
        error : function(request, status, error) {
            alert(error)
        }
    });
	
	
}//pagingFunction
	$(document).ready(function() {
  	 $("#searchBtn").on("click", function(){
  		var title = "입고 예정 추가";
  		var searchn = $("#searchn").val();
  		var search = $("#search").val();
  		
  		$("#searchModalLabel").text(title);
  		
	        const data = { 
	        		searchn : searchn,
	        		search : search,
	        		p : 1
	        		};
	        $.ajax({
	            type : 'post',           // 타입 (get, post, put 등등)
	            url : '/plan_in/planin_add',           // 요청할 서버url
	            dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
	            data : data,
	            success : function(result) { // 결과 성공 콜백함수
	                $("#search_modal_body").html(result);
	                searchModalBootStrap.show();
	            },
	            error : function(request, status, error) {
	                alert(error)
	            }
	        });
  	})//searchBtn
	});//ready	
</script>

<div class="container">
	<div class="row">
		<div class="col-12">
            <div id="div_auth_search" class="text-end">
	            <div class="input-group mb-3 w-50 col-centered">
							<div class="w-30">
	                <select class="form-select" name="searchn" id="searchn">
						<option selected="selected" value="0" <c:if test="${searchn == 0}">selected="selected"</c:if> >제품명</option>
						<option value="1" <c:if test="${searchn == 1}">selected="selected"</c:if>>회사명</option>
						<option value="2" <c:if test="${searchn == 2}">selected="selected"</c:if>>분류</option>
						<option value="3" <c:if test="${searchn == 3}">selected="selected"</c:if>>담당자명</option>
					</select>
					</div>
					<input type="text" id="search" name="search"  value="${search}" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
					<button class="btn btn-info" type="button" id="searchBtn">검색</button>
					<!-- 페이징작업용 -->
					<input type="hidden" id="searchn1" value="${searchn}">
					<input type="hidden" id="search1" value="${search}">
					<!-- 페이징작업용 -->
				</div>
            </div>
        </div>
		<div class="col-12">
			<table class="table">
						<thead class="table-dark">
							<tr>
								<th>제품명</th>
								<th>회사명</th>
								<th>분류</th>
								<th>거래처</th>
								<th>등록날짜</th>
								<th>선택</th>
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
										<td><button type="button" class="btn btn-warning" data-id = "${dto.id}" 
										data-name = "${dto.name}" data-catname = "${dto.categoryDto.cls_nm_4 }"
										data-vendor = "${dto.vendorDto.name}" onclick= "goDown(this)"
										>확인</button></td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
		</div>
	</div>
	<div class="col-12 d-flex justify-content-center">
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
    <div class="row">
        <div class="col-12">
  			<hr>
			<div style="text-align: center">
				<form>
					<div class="ulTag">
						<div class="row">
							<div class="col-12" style="text-align: center;">
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon1">제품카테고리</span>
									 <input
										id='input_category' type="text" class="form-control" placeholder="제품카테고리"
										aria-label="제품카테고리" value="" readonly>
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon2">제품명</span> 
									<input
										id='input_name' type="text" class="form-control" placeholder="제품명"
										aria-label="제품명" value="" readonly>
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon3">수량</span> 
									<input
										id='input_num' type="number" min="0" class="form-control" placeholder="수량"
										aria-label="수량" value="">
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon4">공급업체</span> 
									<input
										id='input_vendor'	type="text" class="form-control" placeholder="공급업체" 
										aria-label="공급업체" value="" readonly>
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon5">날짜</span> 
									<input
										id='input_date' type="date" class="form-control" placeholder="날짜"
										aria-label="날짜" value="">
								</div>
								<input hidden id="input_id">
								
							</div>
						</div>
					</div>
		
					<div class="row">
						<div class="col-12 ">
							<div class="w-40 col-centered" style="text-align: right">
								<button type="button" class="btn btn-primary" id="updateBtn" onclick='goTable()'>추가</button>
							</div>
						</div>
					</div>
				</form>
				</div>
				</div>
				</div>
			</div>
<form id="form" action='/plan_in/read' method="post">
    <input name="groupNumber" id="groupId" hidden>
    <input name="productId" id="productId" hidden>
</form>
