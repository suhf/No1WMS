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
					<input type="text" name="kan_code" id="kan_code">
					<input type="button" id="checkKan" value="중복확인">
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