<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 생성</title>
<style>

input {
	display: inline-block;
}

#checkKan {
	margin-left: 10px; /* .checkKan 버튼과 옆의 input 사이 간격 조절 */
}
.header {
	text-align: center;
	color: white;
}
.body{
	text-align: center;
}

</style>
</head>
<body>
	<div class="header">
		<h1><b>제품 카테고리 생성</b></h1>
	</div>
	<hr>
	<div class="body">
		<form id="createForm">
			<div class="ulTag">
				<div class="row">
	                <div class="col-12">
		                <div class="input-group mb-3">
		                	<span class="input-group-text" id="basic-addon1">대분류</span>
		                	<input type="text" name="cls_nm_1" class="form-control" placeholder="대분류를 입력하세요" aria-label="대분류" aria-describedby="basic-addon1">
	                	</div>
	                	<!-- 설명만 있는 입력 -->
	                	<div class="input-group mb-3">
		                	<span class="input-group-text" id="basic-addon1">중분류</span>
		                	<input type="text" name="cls_nm_2" class="form-control" placeholder="중분류를 입력하세요" aria-label="중분류" aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3">
		                	<span class="input-group-text" id="basic-addon1">소분류</span>
		                	<input type="text" name="cls_nm_3" class="form-control" placeholder="소분류를 입력하세요" aria-label="소분류" aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3">
		                	<span class="input-group-text" id="basic-addon1">중분류</span>
		                	<input type="text" name="cls_nm_4" class="form-control" placeholder="세분류를 입력하세요" aria-label="세분류" aria-describedby="basic-addon1">
	                	</div>
	                	<div class="input-group mb-3">
  							<input type="text" name="kan_code" class="form-control" placeholder="KAN 분류코드" aria-label="KAN 분류코드" aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary" style="background-color:#FF5E5E;" type="button" id="button-addon2">중복확인</button>
						</div>
                	</div>
            	</div>
					대분류
					<input type="text" name="cls_nm_1">
					
					중분류
					<input type="text" name="cls_nm_2">
					
					소분류
					<input type="text" name="cls_nm_3">
					
					세분류
					<input type="text" name="cls_nm_4">
					
					KAN 분류코드
					<input type="text" name="kan_code" id="kan_code">
					<input type="button" id="checkKan" value="중복확인">
					<span id="chackDiv"></span>
				
			</div>
			<div class="Btn">
				<button id="commit">생성</button>
				<button id="cancel">취소</button>
			</div>
		</form>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
    $(document).ready(function() {
        $("#checkKan").on("click", function() {
            // 중복 클릭 방지를 위해 버튼을 비활성화
            $("#checkKan").prop("disabled", true);

            // 이전 결과 및 메시지 초기화
            $("#chackDiv").html("");

            var kanCode = $("#kan_code").val();

            if (!kanCode) {
                $("#chackDiv").html("KAN 분류코드를 입력하세요.");
                // 버튼 다시 활성화
                $("#checkKan").prop("disabled", false);
                return false;
            }

            $.ajax({
            	type: "post",
                url: "/category/chackKancode",
                data: { kan_code: kanCode },
                dataType: text
            }).done(function(data) {
                if (data == 0) {
                    $("#chackDiv").html("사용가능합니다");
                    $("#chackDiv").append("<input type='hidden' id='kan_chack' value='1'>");
                } else {
                    $("#chackDiv").html("이미 사용중인 KAN 분류코드입니다.");
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
                // Ajax 요청 완료 후 버튼 다시 활성화
                $("#checkKan").prop("disabled", false);
            });
        });

        // 포커스를 잃었을 때 KAN 분류코드 입력 안내 메시지를 초기화
        $("#kan_code").on("blur", function() {
            $("#chackDiv").html("");
        });
    });
</script>

	</div>
</body>
</html>