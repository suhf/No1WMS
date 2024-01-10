<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 카테고리 수정페이지</title>
</head>
<body>
<div class="mt-5 mb-5 text-center">
    <h1>제품 카테고리 수정페이지</h1>
</div>
<hr>
<div style="text-align: center">
    <form>
<%--        <div class="ulTag">--%>
<%--            <div class="row">--%>
<%--                <div class="col-12" style="text-align: center;">--%>
<%--                    <div class="input-group mb-3 w-40 col-centered">--%>
<%--                        <span class="input-group-text" id="basic-addon1">대분류</span> <input--%>
<%--                            type="text" class="form-control" placeholder="대분류" id="cls_nm_1"--%>
<%--                            aria-label="대분류" value="${dto.cls_nm_1 }">--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3 w-40 col-centered">--%>
<%--                        <span class="input-group-text" id="basic-addon2">중분류</span> <input--%>
<%--                            type="text" class="form-control" placeholder="중분류" id="cls_nm_2"--%>
<%--                            aria-label="중분류" value="${dto.cls_nm_2 }">--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3 w-40 col-centered">--%>
<%--                        <span class="input-group-text" id="basic-addon3">소분류</span> <input--%>
<%--                            type="text" class="form-control" placeholder="소분류" id="cls_nm_3"--%>
<%--                            aria-label="소분류" value="${dto.cls_nm_3 }">--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3 w-40 col-centered">--%>
<%--                        <span class="input-group-text" id="basic-addon4">세분류</span> <input--%>
<%--                            type="text" class="form-control" placeholder="세분류" id="cls_nm_4"--%>
<%--                            aria-label="세분류" value="${dto.cls_nm_4 }">--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3 w-40 col-centered">--%>
<%--                        <span class="input-group-text" id="basic-addon5">KAN 코드</span> <input--%>
<%--                            type="text" class="form-control" placeholder="KAN 코드"--%>
<%--                            aria-label="KAN 코드" value="${dto.kan_code }" id="kan_code" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="row">--%>
<%--            <div class="col-12 ">--%>
<%--                <div class="w-40 col-centered" style="text-align: right">--%>
<%--                    <button type="button" class="btn btn-primary" id="updateBtn">수정 완료</button>--%>
<%--                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // $(document).ready(function() {
    //     $("#updateBtn").on("click", function() {
    //
    //         var clsnm1 = $("#cls_nm_1").val();
    //         var clsnm2 = $("#cls_nm_2").val();
    //         var clsnm3 = $("#cls_nm_3").val();
    //         var clsnm4 = $("#cls_nm_4").val();
    //         var kan_code = $("#kan_code").val();
    //         if(!clsnm1){
    //             alert("대분류를 입력해야 합니다.");
    //             $("#cls_nm_1").focus();
    //             return false;
    //         }
    //         if(!clsnm2){
    //             alert("중분류를 입력해야 합니다.");
    //             $("#cls_nm_2").focus();
    //             return false;
    //         }
    //         if(!clsnm3){
    //             alert("소분류를 입력해야 합니다.");
    //             $("#cls_nm_3").focus();
    //             return false;
    //         }
    //         if(!clsnm4){
    //             alert("세분류를 입력해야 합니다.");
    //             $("#cls_nm_4").focus();
    //             return false;
    //         }
    //
    //         $.ajax({
    //             url: "/category/update_process",
    //             type: "put",
    //             data: {
    //                 "cls_nm_1": clsnm1,
    //                 "cls_nm_2": clsnm2,
    //                 "cls_nm_3": clsnm3,
    //                 "cls_nm_4": clsnm4,
    //                 "kan_code": kan_code,
    //                 "activation": true
    //             },
    //             datatype:"json"
    //         }).done(function(data) {
    //             if (data == true) {
    //                 alert("카테고리를 수정하였습니다.");
    //
    //                 var form = document.createElement("form");
    //                 form.action = "/category/read";
    //                 form.method = "POST";
    //                 document.body.appendChild(form);
    //
    //                 var input = document.createElement("input");
    //                 input.type = "hidden";
    //                 input.name = "kan_code";
    //                 input.value = kan_code;
    //                 form.appendChild(input);
    //
    //                 form.submit();
    //             } else {
    //                 alert("카테고리 수정에 실패하였습니다.");
    //             }
    //         }).fail(function() {
    //             alert("오류가 발생했습니다.");
    //         }).always(function() {
    //             //
    //         });
    //
    //     });//updateBtn
    //
    //     $("#cancelBtn").on("click", function(){
    //         var kan_code = $("#kan_code").val();
    //
    //         var form = document.createElement("form");
    //         form.action = "/category/read";
    //         form.method = "POST";
    //         document.body.appendChild(form);
    //
    //         var input = document.createElement("input");
    //         input.type = "hidden";
    //         input.name = "kan_code";
    //         input.value = kan_code;
    //         form.appendChild(input);
    //
    //         form.submit();
    //
    //     })


    });//ready
</script>
</html>
