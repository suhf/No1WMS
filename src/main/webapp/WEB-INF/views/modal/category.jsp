<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    function onSearch(){
        //
        //
    }

    function onSelectAuth(tag){
        const $tag = $(tag);
        const tid = $tag.data('tid');
        const name = $tag.data('tname');

        $("#cls_nm_4").val(name);
        $("#kan_code").val(tid);
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
						<option selected="selected" value="4">세분류</option>
						<option value="1">대분류</option>
						<option value="2">중분류</option>
						<option value="3">소분류</option>
						<option value="0">KAN코드</option>
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
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>세분류</th>
					<th>KAN코드</th>
					<th>선택</th>
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
						<td><button data-tid="${dto.kan_code}" data-tname="${dto.cls_nm_4}" class="btn btn-primary" onclick="onSelectAuth(this)">선택</button></td>
					</tr>
				</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>