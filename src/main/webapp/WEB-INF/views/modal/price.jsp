<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
    function onSearch(){
        //
        //
    }

    function onSelect(tag){
        const $tag = $(tag);
        const tid = $tag.data('tid');
        const name = $tag.data('tname');
        
        <!-- 수정해야할 부분 -->
        $("#productName").val(name);
        $("#product_id").val(tid);
        hideSearchModal();
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div id="div_auth_search" class="text-end">
	            <div class="input-group mb-3 w-50 col-centered">
							<div class="w-30">
	                <select class="form-select" name="searchn" id="searchn">
						<option selected="selected" value="0">제품명</option>
						<option value="1">가격</option>
						<option value="2">등록날짜</option>
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
					<th>번호</th>
					<th>제품명</th>
					<th>가격</th>
					<th>등록날짜</th>
					<th>담당자</th>
					<th>선택</th>
				</tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="dto">
					<tr class="detailTr" data-product_id="${dto.id}" >
						<td>${status.count }</td>
						<td>${dto.productDto.name }</td>
						<td>${dto.price }</td>
						<td><fmt:formatDate value="${dto.registration_date }"
								dateStyle="short" /></td>
						<td>${dto.accountDto.name }</td>
						<!-- 수정해야할 부분 -->
						<td><button data-tid="${dto.id}" data-tname="${dto.name}" class="btn btn-primary" onclick="onSelect(this)">선택</button></td>
					</tr>
				</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>