<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <div class="mt-5 mb-5 text-center">
        <div class="row">
            <h1>제품 가격 수정페이지</h1>
        </div>
    </div>
    <hr>

    <div style="text-align: center">
        <form>
            <div class="ulTag">
                <div class="row">
                    <div class="col-12" style="text-align: center;">
                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon1">제품명</span>
                            <input type="text" class="form-control" placeholder="제품명" id="name"
                                aria-label="제품명" value="${dto.productDto.name }" readonly>
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon2">가격</span>
                            <input type="text" class="form-control" placeholder="가격" id="price"
                                aria-label="가격" value="${dto.price }">
                        </div>

                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon3">등록날짜</span>
                            <input type="text" class="form-control" placeholder="등록날짜"
                                aria-label="등록날짜" value="${dto.registration_date }" readonly>
                        </div>
						<c:set var="userData" value="${sessionScope.userData}" />
                        <div class="input-group mb-3 w-40 col-centered">
                            <span class="input-group-text" id="basic-addon4">담당자</span>
                            <input type="text" class="form-control" placeholder="담당자"
                                aria-label="담당자" value="${userData.name }" readonly>
                        </div>

                        <input type='hidden' id="id" value="${dto.id }">
	                	<input type='hidden' id="manager_id" value="${userData.id }">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 ">
                    <div class="w-40 col-centered" style="text-align: right">
                        <button type="button" class="btn btn-primary" id="submitBtn">수정 완료</button>
                        <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#submitBtn").on("click", function() {
                var id = $("#id").val();
                var price = $("#price").val();
                var manager_id = $("#manager_id").val();
				
                if (!price || isNaN(price)) {
                    alert("올바른 가격을 입력하세요.");
                    $("#price").focus();
                    return;
                }

                $.ajax({
                    url: "/price/update_process",
                    type: "put",
                    data: {
                        "id": id,
                        "price": price,
                        "manager_id": manager_id
                    },
                    datatype: "json"
                }).done(function(data) {
                    if (data == true) {
                        alert("제품 가격을 수정했습니다.");

                        var form = document.createElement("form");
                        form.action = "/price/read";
                        form.method = "POST";
                        document.body.appendChild(form);

                        var input = document.createElement("input");
                        input.type = "hidden";
                        input.name = "id";
                        input.value = id;
                        form.appendChild(input);

                        form.submit();
                    } else {
                        alert("제품 가격 수정에 실패하였습니다.");
                    }
                }).fail(function() {
                    alert("오류가 발생했습니다.");
                }).always(function() {
                    //
                });
            });//submitBtn

            $("#cancelBtn").on("click", function() {
                var id = $("#id").val();

                var form = document.createElement("form");
                form.action = "/price/read";
                form.method = "POST";
                document.body.appendChild(form);

                var input = document.createElement("input");
                input.type = "hidden";
                input.name = "id";
                input.value = id;
                form.appendChild(input);

                form.submit();
            });//cancelBtn
        });
    </script>
</body>
</html>