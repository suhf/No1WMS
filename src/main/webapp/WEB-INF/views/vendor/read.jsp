<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거래처 상세페이지</title>
    <style type="text/css">
        .header {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="mt-5 mb-5 text-center">

    <div class="row">
        <h1>거래처 상세페이지</h1>
        <div class="col-10" style="text-align: right">
            <button type="button" class="btn btn-danger" id="yes_no_modal_show">삭제</button>
        </div>
    </div>
</div>
<hr>
<div class="container" style="text-align: center">
    <form id="createForm">
        <div class="ulTag">
            <div class="row">
                <div class="col-12">

                    <input type="hidden" class="form-control" aria-label="id" id="id" value="${One.id }" readonly>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon1">업체명</span>
                        <input type="text" class="form-control" aria-label="창고명" value="${One.name }" readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon2">대표자명</span>
                        <input type="text" class="form-control" aria-label="용적" value="${One.president_name }" readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon3">주소</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.address }" readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon4">사업자등록번호</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.registration_number }"
                               readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon5">email</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.email }" readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon6">대표번호</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.president_telephone }"
                               readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon7">거래처 담당자 이름</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.vendor_manager }" readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon8">거래처 담당자 연락 번호</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.vendor_manager_telephone }"
                               readonly>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon9">주요품목</span>
                        <input type="text" class="form-control" aria-label="적재량" value="${One.main_product }" readonly>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>
</div>
<div>
    <hr>
</div>
<div class="col-10" style="text-align: right">
    <button type="button" class="btn btn-primary" id="checkBtn">확인</button>
    <button type="button" class="btn btn-warning" id="modifyBtn">
        수정
    </button>
</div>
<div class="modal fade" id="yes_no_modal_vendor_delete" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="yesNoModalLabel">삭제 하시겠습니까?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="modal_yes_button_vendor_delete" type="button" class="modal_yes btn btn-primary">삭제</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#checkBtn").on("click", function () {
            $(location).attr("href", "/vendor/list");
        })//checkBtn click

        $("#modifyBtn").on("click", function () {
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/vendor/update";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        })//modifyBtn click


        yesNoModal.yesFunction = deleteVendorFunction;


        function deleteVendorFunction() {
            var id = $("#id").val();
            $.ajax({
                url: "/vendor/delete",
                type: "delete",
                data: {
                    "id": id
                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("삭제되었습니다.");
                    $(location).attr("href", "/vendor/list");
                } else {
                    alert("정상적으로 삭제되지 않았습니다..");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        }//deleteCategoryFunction

        const yesNoModalBootStrap = new bootstrap.Modal("#yes_no_modal_vendor_delete");

        $("#yes_no_modal_show").on("click", function () {
            yesNoModalBootStrap.show();
        });

        $("#modal_yes_button_vendor_delete").on("click", function () {
            yesNoModal.yesFunction();
            yesNoModalBootStrap.hide();
        });

    });//ready


</script>
</body>
</html>
