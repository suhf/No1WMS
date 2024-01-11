<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>창고 정보 수정페이지</title>
    <style>
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
<div class="mt-5 mb-5 text-center">
    <h1>창고 정보 수정페이지</h1>
</div>
<hr>
<div style="text-align: center">
    <form id="createForm">

        <div class="ulTag">
            <div class="row">
                <div class="col-12" style="text-align: center;">


                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon1">창고명</span>
                        <input type="text" name="name" id="name" class="form-control"
                               placeholder="창고명을 입력하세요" aria-label="창고명" value="${dto.name }"
                               aria-describedby="basic-addon1">
                    </div>
                    <!-- 설명만 있는 입력 -->
                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon2">용적</span>
                        <input type="text" name="capacity" id="capacity" class="form-control"
                               placeholder="용적을 입력하세요" aria-label="용적" value="${dto.capacity }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon3">주소</span>
                        <input type="text" name="address" id="address" class="form-control"
                               placeholder="주소를 입력하세요" aria-label="주소" value="${dto.address }"
                               aria-describedby="basic-addon1">
                    </div>



                        <input type="hidden" name="name" id="id" class="form-control"
                               placeholder="창고명을 입력하세요" aria-label="창고명" value="${dto.id }"
                               aria-describedby="basic-addon1">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 ">
                <div class="w-40 col-centered" style="text-align: right">
                    <button type="button" class="btn btn-primary" id="updateBtn">수정 완료</button>
                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $("#updateBtn").on("click", function() {

            var name = $("#name").val();
            var capacity = $("#capacity").val();
            var address = $("#address").val();
            var id = $("#id").val();

            if(!name){
                alert("창고명을 입력해야 합니다.");
                $("#name").focus();
                return false;
            }
            if(!capacity){
                alert("용적크기를 입력해야 합니다.");
                $("#capacity").focus();
                return false;
            }
            if(!address){
                alert("주소를 입력해야 합니다.");
                $("#address").focus();
                return false;
            }


            $.ajax({
                url: "/warehouse/update_process",
                type: "put",
                data: {
                    "name": name,
                    "capacity": capacity,
                    "address": address,
                    "id": id

                },
                datatype:"json"
            }).done(function(data) {
                if (data == true) {
                    alert("창고를 수정하였습니다.");

                    var form = document.createElement("form");
                    form.action = "/warehouse/read";
                    form.method = "POST";
                    document.body.appendChild(form);

                    var input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "id";
                    input.value = id;
                    form.appendChild(input);

                    form.submit();
                } else {
                    alert("카테고리 수정에 실패하였습니다.");
                }
            }).fail(function() {
                alert("오류가 발생했습니다.");
            }).always(function() {
                //
            });

        });//updateBtn

        $("#cancelBtn").on("click", function(){
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/warehouse/read";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        })
    });//ready
</script>
</body>
</html>
