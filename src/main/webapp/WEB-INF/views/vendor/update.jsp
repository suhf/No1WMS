<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>창고 정보 수정페이지</title>
    <style>
        .body {
            text-align: center;
        }

        .col-centered {
            margin: 0 auto;
            float: none;
        }

        .col-margin-left-32 {
            margin-left: 32%;
        }


    </style>
</head>
<body>
<div class="mt-5 mb-5 text-center">
    <h1>창고 정보 수정페이지</h1>
</div>
<hr>
<div class="container" style="text-align: center">
    <form id="createForm">

        <div class="ulTag">
            <div class="row">
                <div class="col-12" style="text-align: center;">

                    <input type="hidden" id="id" value="${dto.id }">
                    <input type='hidden' id="managerId" value="15b68e54-b0f0-11ee-935d-0242ac110006"/>
                    <input type='hidden' id="activation" value="1">


                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon1">업체명</span>
                        <input type="text" name="name" id="name" class="form-control"
                               placeholder="업체명을 입력하세요" aria-label="업체명" value="${dto.name }"
                               aria-describedby="basic-addon1">
                    </div>
                    <!-- 설명만 있는 입력 -->
                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon2">대표자명</span>
                        <input type="text" name="presidentName" id="presidentName" class="form-control"
                               placeholder="대표자명을 입력하세요" aria-label="대표자명" value="${dto.presidentName }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon3">주소</span>
                        <input type="text" name="address" id="address" class="form-control"
                               placeholder="주소를 입력하세요" aria-label="주소" value="${dto.address }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon4">사업자등록번호</span>
                        <input type="text" name="registrationNumber" id="registrationNumber" class="form-control"
                               placeholder="사업자등록번호를 입력하세요" aria-label="사업자등록번호" value="${dto.registrationNumber }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon5">email</span>
                        <input type="text" name="email" id="email" class="form-control"
                               placeholder="Email주소를 입력하세요" aria-label="email" value="${dto.email }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon6">대표번호</span>
                        <input type="text" name="presidentTelephone" id="presidentTelephone" class="form-control"
                               placeholder="대표번호를 입력하세요" aria-label="대표번호" value="${dto.presidentTelephone }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon7">거래처 담당자 이름</span>
                        <input type="text" name="vendorManager" id="vendorManager" class="form-control"
                               placeholder="거래처 담당자 이름을 입력하세요" aria-label="거래처 담당자 이름" value="${dto.vendorManager }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon8">거래처 담당자 연락 번호</span>
                        <input type="text" name="vendorManagerTelephone" id="vendorManagerTelephone" class="form-control"
                               placeholder="거래처 담당자 연락 번호를 입력하세요" aria-label="거래처 담당자 연락 번호" value="${dto.vendorManagerTelephone }"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon9">주요품목</span>
                        <input type="text" name="mainProduct" id="mainProduct" class="form-control"
                               placeholder="주요품목을 입력하세요" aria-label="주요품목" value="${dto.mainProduct }"
                               aria-describedby="basic-addon1">
                    </div>


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
    $(document).ready(function () {
        $("#updateBtn").on("click", function () {
            var id = $("#id").val();

            var managerId = $("#managerId").val();

            var name = $("#name").val();
            var presidentName = $("#presidentName").val();
            var address = $("#address").val();
            var registrationNumber = $("#registrationNumber").val();
            var email = $("#email").val();
            var presidentTelephone = $("#presidentTelephone").val();
            var vendorManager = $("#vendorManager").val();
            var vendorManagerTelephone = $("#vendorManagerTelephone").val();
            var mainProduct = $("#mainProduct").val();
            var activation = $("#activation").val();

            if (!name) {
                alert("업체명을 입력해야 합니다.");
                $("#name").focus();
                return false;
            }
            if (!presidentName) {
                alert("대표자명을 입력해야 합니다.");
                $("#presidentName").focus();
                return false;
            }

            if (!address) {
                alert("주소를 입력해야 합니다.");
                $("#address").focus();
                return false;
            }

            if (!registrationNumber) {
                alert("사업자등록번호를 입력해야 합니다.");
                $("#registrationNumber").focus();
                return false;
            }

            if (!email) {
                alert("Email을 입력해야 합니다.");
                $("#email").focus();
                return false;
            }

            if (!presidentTelephone) {
                alert("대표번호를 입력해야 합니다.");
                $("#presidentTelephone").focus();
                return false;
            }

            if (!vendorManager) {
                alert("거래처 담당자 이름을 입력해야 합니다.");
                $("#vendorManager").focus();
                return false;
            }

            if (!vendorManagerTelephone) {
                alert("거래처 담당자 연락 번호를 입력해야 합니다.");
                $("#vendorManagerTelephone").focus();
                return false;
            }

            if (!mainProduct) {
                alert("주요품목을 입력해야 합니다.");
                $("#mainProduct").focus();
                return false;
            }


            $.ajax({
                url: "/vendor/update_process",
                type: "put",
                data: {
                    "id": id,
                    "managerId": managerId,

                    "name": name,
                    "presidentName": presidentName,
                    "address": address,
                    "registrationNumber": registrationNumber,
                    "email": email,
                    "presidentTelephone": presidentTelephone,
                    "vendorManager": vendorManager,
                    "vendorManagerTelephone": vendorManagerTelephone,
                    "mainProduct": mainProduct,
                    "activation" : activation

                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("거래처를 수정하였습니다.");

                    var form = document.createElement("form");
                    form.action = "/vendor/read";
                    form.method = "POST";
                    document.body.appendChild(form);

                    var input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "id";
                    input.value = id;
                    form.appendChild(input);

                    form.submit();

                } else {
                    alert("거래처 수정에 실패하였습니다.");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        });//updateBtn

        $("#cancelBtn").on("click", function () {
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/vendor/read";
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
