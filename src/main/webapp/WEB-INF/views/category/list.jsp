<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 카테고리</title>
<style type="text/css">
.header {
	text-align: center;
}

.body {
	width: 80%;
	margin: 20px auto;
}

.searchDropdown {
	text-align: center;
	display: inline-block;
	margin-right: 10px;
}

select {
	padding: 8px;
}
.search{
	position: relative;
	left: 70%;
}

.searchInput {
	display: inline-block;
	padding: 8px;
}

.searchButton {
	display: inline-block;
}


table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>
<body>


	<div class="header">
		<h1>제품 카테고리 관리</h1>
	</div>
	<hr>
	<div class="body">
		<div class="search">
			<form action="categorysearch">
				<div class="searchDropdown" id="searchDropdown">
					<select>
						<option value="0"></option>
						<option value="1"></option>
						<option value="2"></option>
					</select>
				</div>
				<div class="searchInput">
					<input type="text" name="searchInput" id="searchInput"
						placeholder="검색어를 입력하세요" />
				</div>
				<div class="searchButton">
					<button id="searchButton">검색</button>
				</div>
		</div>
		</form>
		<div class="table">
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
		<div class="paging">
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