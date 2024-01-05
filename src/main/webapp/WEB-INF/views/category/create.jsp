<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 생성</title>
<style>


.header-white {
	text-align: center;
	color: white;
}
.body{
	text-align: center;
}
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
	<div class="header-white">
		<h1><b>제품 카테고리 생성</b></h1>
	</div>
	<hr>
	<div class="body">
		<form id="createForm">
			<div class="ulTag">
				<div class="row">
	                <div class="col-12" style="text-align: center;">
		                <div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">대분류</span>
		                	<input type="text" name="cls_nm_1" id="cls_nm_1" class="form-control" 
		                	placeholder="대분류를 입력하세요" aria-label="대분류" value="${dto.cls_nm_1 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<!-- 설명만 있는 입력 -->
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">중분류</span>
		                	<input type="text" name="cls_nm_2" id="cls_nm_2" class="form-control" 
		                	placeholder="중분류를 입력하세요" aria-label="중분류" value="${dto.cls_nm_2 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">소분류</span>
		                	<input type="text" name="cls_nm_3" id="cls_nm_3" class="form-control" 
		                	placeholder="소분류를 입력하세요" aria-label="소분류" value="${dto.cls_nm_3 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3 w-40 col-centered">
		                	<span class="input-group-text" id="basic-addon1">세분류</span>
		                	<input type="text" name="cls_nm_4" id="cls_nm_4" class="form-control" 
		                	placeholder="세분류를 입력하세요" aria-label="세분류" value="${dto.cls_nm_4 }" 
		                	aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3 w-40 col-centered">
  							<input type="number" name="kan_code" id="kan_code" class="form-control" 
  							placeholder="KAN 분류코드" aria-label="KAN 분류코드" value="${dto.kan_code }" 
  							aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary" id="checkKan" 
  							style="background-color:#FF5E5E;" type="button" 
  							id="button-addon2">중복확인</button>
						</div>
                	</div>
            	</div>
			</div>
			<div class="col-margin-left-32">
				<button class="btn btn-success" id="submit">생성</button>
				<button class="btn btn-secondary" id="cancel">취소</button>
			</div>
		</form>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
    $(document).ready(function() {
        $("#checkKan").on("click", function() {
            // 중복 클릭 방지를 위해 버튼을 비활성화
            $("#checkKan").prop("disabled", true);

            var kanCode = $("#kan_code").val();

            if (!kanCode) {
                alert("KAN 분류코드를 입력하세요.");
                $("#kan_code").focus();
                // 버튼 다시 활성화
                $("#checkKan").prop("disabled", false);
                return false;
            }

            $.ajax({
            	url: "/category/checkKancode",
            	type: "post",
                data: {"kan_code": kanCode},
            	datatype:"text"
            }).done(function(data) {
                if (data == "") {
                    $("#checkKan").css("background-color", "#4CAF50"); // 파란색 배경으로 변경
                    $("#checkKan").text("사용가능"); // 버튼 텍스트 변경
                    $("#checkKan").append("<input type='hidden' id='kan_chack' value='1'>");
                } else {
                    $("#checkKan").css("background-color", "#FF5E5E"); // 원래의 빨간색 배경으로 변경
                    $("#checkKan").text("사용불가"); // 버튼 텍스트 변경
                    $("#kan_chack").val('0');
                    //여기 
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
                // Ajax 요청 완료 후 버튼 다시 활성화
                $("#checkKan").prop("disabled", false);
            });
        });//kan중복체크 기능
        
        
        
        $("#submit").on("click", function(){
        	var clsnm1 = $("#cls_nm_1").val();
        	var clsnm2 = $("#cls_nm_2").val();
        	var clsnm3 = $("#cls_nm_3").val();
        	var clsnm4 = $("#cls_nm_4").val();
        	var kanCode = $("#kan_code").val();
    		if(!clsnm1){
    			alert("대분류를 입력해야 합니다.");
    			return false;
    		}
    		if(!clsnm2){
    			alert("중분류를 입력해야 합니다.");
    			return false;
    		}
    		if(!clsnm3){
    			alert("소분류를 입력해야 합니다.");
    			return false;
    		}
    		if(!clsnm4){
    			alert("세분류를 입력해야 합니다.");
    			return false;
    		}
    		if( $("#kan_chack").val() != 1){
    			alert("KAN코드를 입력후 중복체크를 해야합니다.");
    			return false;
    		}
    		
    		$.ajax({
            	url: "/category/create_process",
            	type: "post",
            	data: {
            		   "cls_nm_1": clsnm1,
            		   "cls_nm_2": clsnm2,
            		   "cls_nm_3": clsnm3,
            		   "cls_nm_4": clsnm4,
            		   "kan_code": kanCode,
            		   "activation": true
            		},
            		datatype:"json"
            }).done(function(data) {
                if (data == true) {
                	alert("카테고리가 생성되었습니다.");
                	$(location).attr("href", "/category/list")
                } else {
                	alert("카테고리 생성에 실패하였습니다.");
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
                // Ajax 요청 완료 후 버튼 다시 활성화
				
            });
    		
    	})
        
        
        
        
        
        
        
    });
</script>

	</div>
</body>
</html>