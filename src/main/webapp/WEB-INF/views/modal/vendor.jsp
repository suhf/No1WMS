<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    function onSelect(tag){
        const $tag = $(tag);
        const tid = $tag.data('tid');
        const name = $tag.data('tname');

        $("#vendor").val(name);
        $("#vendor_id").val(tid);
        hideSearchModal();
    }//onSelect
    
    function pagingFunction(clickedId){
    	var title = "거래처 검색";
		var val = "vendor";
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
            url : '/product/show_modal2',           // 요청할 서버url
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
   		var title = "거래처 검색";
		var val = "vendor";
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
	            url : '/product/show_modal2',           // 요청할 서버url
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
						<option selected="selected" value="0" <c:if test="${searchn == 0}">selected="selected"</c:if>>업체명</option>
						<option value="1" <c:if test="${searchn == 1}">selected="selected"</c:if>>업체명</option>
						<option value="2" <c:if test="${searchn == 2}">selected="selected"</c:if>>거래처 담당자</option>
						<option value="3" <c:if test="${searchn == 3}">selected="selected"</c:if>>거래처 담당자 전화번호</option>
					</select>
					</div>
					<input type="text" id="search" name="search" value="${search}" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
					<th>번호</th>
					<th>업체명</th>
					<th>대표번호</th>
					<th>거래처 담당자</th>
					<th>거래처 담당자 전화번호</th>
					<th>선택</th>
				</tr>
                </thead>
                <tbody>
                <c:forEach items="${vlist }" var="dto">
					<tr class="detailTr" data-product_id="${dto.id}" >
						<td>${start} <c:set var="start" value="${start +1 }"/></td>
						<td>${dto.name }</td>
						<td>${dto.president_telephone }</td>
						<td>${dto.vendor_manager }</td>
						<td>${dto.vendor_manager_telephone }</td>
						<td><button data-tid="${dto.id}" data-tname="${dto.name}" class="btn btn-primary" onclick="onSelect(this)">선택</button></td>
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