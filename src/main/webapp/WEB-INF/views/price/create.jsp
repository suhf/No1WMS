<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 가격 생성</title>

<style>
.col-centered{
      margin: 0 auto;
      float: none;
    }
.col-margin-left-32{
	margin-left: 32%;
}
</style>

</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1>제품 가격 생성</h1>
	</div>
	<hr>
	<div style="text-align: center">
		<form id="createForm">
			<div class="ulTag">
				<div class="row">
	                <div class="col-12" style="text-align: center;">
		                <div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">제품명</span>
		                	<input type="text" name="productDto.name" id="productDto.name" class="form-control" 
		                	placeholder="제품명을 검색하세요" aria-label="제품명" value="${dto.productDto.name }" 
		                	aria-describedby="basic-addon1">
		                	<button class="btn btn-outline-secondary rounded-end" id="searchProductName" 
  							style="background-color:#FF5E5E;" type="button" >검색</button>
  							<input type='hidden' id='searchProductName' value='0'>
		                	
	                	</div>
	                	<!-- 설명만 있는 입력 -->
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon2">중분류</span>
		                	<input type="text" name="cls_nm_2" id="cls_nm_2" class="form-control" 
		                	placeholder="중분류를 입력하세요" aria-label="중분류" value="${dto.cls_nm_2 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon3">소분류</span>
		                	<input type="text" name="cls_nm_3" id="cls_nm_3" class="form-control" 
		                	placeholder="소분류를 입력하세요" aria-label="소분류" value="${dto.cls_nm_3 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon4">세분류</span>
		                	<input type="text" name="cls_nm_4" id="cls_nm_4" class="form-control" 
		                	placeholder="세분류를 입력하세요" aria-label="세분류" value="${dto.cls_nm_4 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3 w-40 col-centered">
	                		<span class="input-group-text" id="basic-addon5">KAN 분류코드</span>
  							<input type="number" min="1" name="kan_code" id="kan_code" class="form-control" 
  							placeholder="KAN 분류코드를 입력하세요" aria-label="KAN 분류코드" value="${dto.kan_code }" 
  							aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary rounded-end" id="checkKan" 
  							style="background-color:#FF5E5E;" type="button" >중복확인</button>
  							<input type='hidden' id='kan_chack' value='0'>
						</div>
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

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		
		
		</script>



</body>
</html>