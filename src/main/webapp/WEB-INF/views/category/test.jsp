<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test상세페이지</title>
<style type="text/css">
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
	test success
	<br>
	<hr>
	<c:forEach items="${dto }" var="item">
${item.kan_code} : ${item.cls_nm_1} > ${item.cls_nm_2} > ${item.cls_nm_3} > ${item.cls_nm_4}<br>
활성화 : ${item.activation}<br>
		<hr>
	</c:forEach>
	코드테스트 버튼 :
	<div class="input-group mb-3 w-40 col-centered">
		<input type="text" name="kan_code" id="kan_code" class="form-control"
			placeholder="KAN 분류코드" aria-label="KAN 분류코드"
			aria-describedby="button-addon2">
		<button class="btn btn-outline-secondary" id="checkKan"
			style="background-color: #FF5E5E;" type="button" id="button-addon2">중복확인</button>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
    $(document).ready(function() {
        $("#checkKan").on("click", function() {
            // 중복 클릭 방지를 위해 버튼을 비활성화
            $("#checkKan").prop("disabled", true);

            let kanCode = $("#kan_code").val();

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
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
                // Ajax 요청 완료 후 버튼 다시 활성화
                $("#checkKan").prop("disabled", false);
            });
        });
    });
</script>
	



</body>
</html>