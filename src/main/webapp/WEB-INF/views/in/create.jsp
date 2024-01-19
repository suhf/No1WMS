<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 입고 추가</title>
<style>
.col-centered{
      margin: 0 auto;
      float: none;
    }
</style>
</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1>입고 추가</h1>
	</div>
	<hr>
	<div style="text-align: center">
		<form id="createForm">
			<div class="ulTag">
				<div class="row">
	                <div class="col-12" style="text-align: center;">
	                
		                <div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">제품명</span>
		                	<input type="text" name="productName" id="productName" class="form-control" 
		                	placeholder="제품명을 검색하세요" aria-label="제품명" value="${dto.productDto.name }" 
		                	aria-describedby="basic-addon1" readonly>
		                	<button class="btn btn-outline-secondary rounded-end" id="searchProductName" 
  							style="background-color:#FF5E5E;" type="button" onclick="showSearchModal('제품 검색','product')" >검색</button>
  							<input type='hidden' id="product_id" value="">
		                	
	                	</div>
	                	<!-- 설명만 있는 입력 -->
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon2">가격</span>
		                	<input type="number" name="price" id="price" class="form-control" 
		                	placeholder="가격을 입력하세요" aria-label="가격" value="${dto.price }" 
		                	aria-describedby="basic-addon1" disable><!-- 여기서부터 작업 -->
	                	</div>
	                	
	                	<c:set var="userData" value="${sessionScope.userData}" />
	                	<input type='hidden' id="manager_id" value="${userData.id }">
                	</div>
            	</div>
			</div>
			<div class="row">
				<div class="col-12 ">
					<div class="w-40 col-centered" style="text-align: right">
						<button type="button" class="btn btn-success" id="submitBtn">생성</button>
						<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


</script>








</body>
</html>