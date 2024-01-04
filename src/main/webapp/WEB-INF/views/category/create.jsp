<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 생성</title>
<style>
.ulTag {
	padding: 0;
}

li {
	display: inline-block;
	width: 130px;
	margin-right: 10px;
}

input {
	display: inline-block;
}

#checkKan {
	margin-left: 10px; /* .checkKan 버튼과 옆의 input 사이 간격 조절 */
}
</style>
</head>
<body>
	<div class="header">
		<h1>제품 카테고리 생성</h1>
	</div>
	<hr>
	<div class="body">
		<form id="createForm">
			<div class="ulTag">
				<ul>
					<li>대분류</li>
					<input type="text" name="cls_nm_1">
					<br>
					<li>중분류</li>
					<input type="text" name="cls_nm_2">
					<br>
					<li>소분류</li>
					<input type="text" name="cls_nm_3">
					<br>
					<li>세분류</li>
					<input type="text" name="cls_nm_4">
					<br>
					<li>KAN 분류코드</li>
					<input type="text" name="kan_code">
					<button id="checkKan">중복확인</button>
					<span id="chackDiv"></span>
				</ul>
			</div>
			<div class="Btn">
				<button id="commit">생성</button>
				<button id="cancel">취소</button>
			</div>
		</form>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$("#checkKan").click(function() {
				
			})
		</script>
	</div>
</body>
</html>