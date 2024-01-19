<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    function onSelect(tag){
        const $tag = $(tag);
        const tid = $tag.data('tid');
        const name = $tag.data('tname');
        const company_name = $tag.data('tcompany_name');
        const cls_nm_4 = $tag.data('tcls_nm_4');
        const vendor_name = $tag.data('tvendor_name');
        

        $("#productName").val(name);
        $("#product_id").val(tid);
        $("#company_name").val(company_name);
        $("#cls_Nm_4").val(cls_nm_4);
        $("#vendor_name").val(vendor_name);
        hideSearchModal();
    }//onSelect
    
    function pagingFunction(clickedId){
    	var title = "제품 검색";
		var val = "product";
    	var searchn = $("#searchn1").val();
		var search = $("#search1").val();
		$("#searchModalLabel").text(title);
		const data = { name : val,
        		searchn : searchn,
        		search : search,
        		p : parseInt(clickedId)
        		};
		$.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/price/show_modal',           // 요청할 서버url
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
   		var title = "제품 검색";
		var val = "product";
   		var searchn = $("#searchn").val();
   		var search = $("#search").val();
   		
   		$("#searchModalLabel").text(title);
   		
	        const data = { name : val,
	        		searchn : searchn,
	        		search : search,
	        		p : 1
	        		};
	        $.ajax({
	            type : 'post',           // 타입 (get, post, put 등등)
	            url : '/price/show_modal',           // 요청할 서버url
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
						<option selected="selected" value="0">제품명</option>
						<option value="1">회사명</option>
						<option value="2">분류</option>
						<option value="3">담당자명</option>
					</select>
					</div>
					<input type="text" id="search" name="search" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
					<th>담당자</th>
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
						<td>${dto.accountDto.name }</td>
						<td><button data-tid="${dto.id}" data-tname="${dto.name}" data-tcompany_name="${dto.company_name }" data-tcls_nm_4="${dto.categoryDto.cls_nm_4 }" data-tvendor_name="${dto.vendorDto.name }"class="btn btn-primary" onclick="onSelect(this)">선택</button></td>
					</tr>
				</c:forEach>
                </tbody>
            </table>
        </div>
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