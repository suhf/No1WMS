<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 카테고리</title>
<style type="text/css">
.header-white {
	text-align: center;
	color: white;
}
.w-5{
    width : 5%!important;
}
</style>
</head>
<body>


	<div class="header-white">
		<h1><b>제품 카테고리 관리</b></h1>
	</div>
	<hr>
	<div class="body">
		<div class="search12">
			<form action="categorySearch">
				<div class="input-group mb-3 w-30">
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
					<button class="btn btn-outline-secondary" style="background-color:aqua;" type="button" id="button-addon2 searchBtn">검색</button>
				</div>
			</form>
		</div>
			
		</div>
		<div class="table12">
			<table>
				<tr>
					<th>KAN코드</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>세분류</th>
				</tr>

				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.kan_code }</td>
						<td>${dto.cls_nm_1 }</td>
						<td>${dto.cls_nm_2 }</td>
						<td>${dto.cls_nm_3 }</td>
						<td>${dto.cls_nm_4 }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<div class="uploadExcel">
			<img alt="엑셀다운로드 이미지" src="엑셀다운로드 이미지">
			<button id="uploadExcel" value="업로드">업로드</button>
		</div>
		<div class="paging12">
			<!-- 페이징 -->
		</div>
		<div class="createButton">
			<button id="createButton" value="생성">생성</button>
		</div>


	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<script>
		$("#createButton").click(function(){
			$(location).attr("href", "/category/create")
		})
	</script>
</body>
</html>