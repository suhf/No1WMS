<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>창고 상세페이지</title>
    <style type="text/css">
        .header {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="mt-5 mb-5 text-center">

    <div class="row">
        <h1>창고 상세페이지</h1>
        <div class="col-10" style="text-align: right;">
            <button type="button" class="btn btn-danger" id="yes_no_modal_show">삭제</button>
        </div>
    </div>
</div>
<hr>
<div style="text-align: center">
    <div class="container">
        <div class="row">
            <div class="input-group mb-3 w-40 col-4">
                <span class="input-group-text" id="basic-addon1">창고명</span>
                <input type="text" class="form-control" aria-label="창고명" value="${One.name }" readonly>
            </div>

            <div class="input-group mb-3 w-40 col-4">
                <span class="input-group-text" id="basic-addon2">용적</span>
                <input type="text" class="form-control" aria-label="용적" value="${One.capacity }" readonly>
            </div>

            <div class="input-group mb-3 w-40 col-4">
                <span class="input-group-text" id="basic-addon3">적재량</span>
                <input type="text" class="form-control" aria-label="적재량" value="${One.currentCapacity }" readonly>
            </div>

        </div>
    </div>
    <div>
        <hr>
    </div>
    <div id="productSearch">
        <div class="container-fluid">
            <div class="col-12">

                <div class="input-group mb-3 w-30 col-centered">
                    <div class="w-25">
                        <select class="form-select" id="searchn">
                            <option value="0" ${searchn == 0 ? 'selected' : ''}>제품명</option>
                            <option value="1" ${searchn == 1 ? 'selected' : ''}>재고수</option>
                        </select>
                    </div>
                    <input type=hidden id="id" value="${One.id}">
                    <input type="text" name="search" class="form-control" id="search"
                           aria-label="Text input with dropdown button" value="${search}" placeholder="검색어를 입력하세요">
                    <button class="btn btn-info" type="button" id="searchBtn">검색</button>


                    <!-- 페이징작업용 -->
                    <input type="hidden" id="searchn1" value="${searchn}">
                    <input type="hidden" id="search1" value="${search}">
                    <!-- 페이징작업용 -->

                </div>

            </div>
        </div>
        <div class="container-fluid">

            <div class="row row-table">
                <div id="searchResults" class="col-12">
                    <table class="table">
                        <thead class="table-dark">
                        <tr>
                            <th>번호</th>
                            <th>제품명</th>
                            <th>재고수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${wlist }" var="dto">
                            <tr class="detailTr">
                                <td>${start} <c:set var="start" value="${start +1 }"/></td>
                                <td>${dto.name }</td>
                                <td>${dto.quantity }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row row-buttons">
                <div class="col-3">

                </div>
                <div class="col-6 d-flex justify-content-center">
                    <nev>
                        <ul class="pagination">

                            <c:if test="${begin > pageNum }">
                                <li class="page-item">
                                    <a href="javascript:void(0);" class="page-link"
                                       onclick="pageingFunction(this.id)" id="${begin - 1 }">&lt;</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${begin }" end="${end }" var="i">
                                <li class="page-item <c:if test="${p == i}"> active </c:if>">
                                    <a href="javascript:void(0);" class="page-link "
                                       onclick="pageingFunction(this.id); return false;" id="${i }">${i }</a>
                                </li>
                            </c:forEach>
                            <c:if test="${end < totalPages }">
                                <li class="page-item">
                                    <a href="javascript:void(0);" class="page-link"
                                       onclick="pageingFunction(this.id)" id="${end + 1 }">&gt;</a>
                                </li>
                            </c:if>

                        </ul>
                    </nev>
                </div>

            </div>
        </div>
    </div>
    <div class="align: center">
        <div class="w-40 col-centered" style="text-align: right">
            <button type="button" class="btn btn-primary" id="checkBtn">확인</button>
            <button type="button" class="btn btn-warning" id="modifyBtn">
                수정
            </button>
        </div>
    </div>
</div>
<div class="modal fade" id="yes_no_modal_delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="yesNoModalLabel">삭제 하시겠습니까?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="modal_yes_button_warehouse_delete" type="button" class="modal_yes btn btn-primary">삭제
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#checkBtn").on("click", function () {
            $(location).attr("href", "/warehouse/list");
        })//checkBtn click

        $("#modifyBtn").on("click", function () {
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/warehouse/update";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        })//modifyBtn click


        yesNoModal.yesFunction = deleteWarehouseFunction;


        function deleteWarehouseFunction() {
            var id = $("#id").val();
            $.ajax({
                url: "/warehouse/delete",
                type: "put",
                data: {
                    "id": id
                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("삭제되었습니다.");
                    $(location).attr("href", "/warehouse/list");
                } else {
                    alert("정상적으로 삭제되지 않았습니다..");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        }//deleteCategoryFunction

        const yesNoModalBootStrap = new bootstrap.Modal("#yes_no_modal_delete");
        $("#yes_no_modal_show").on("click", function () {
            yesNoModalBootStrap.show();
        });

        $("#modal_yes_button_warehouse_delete").on("click", function () {
            yesNoModal.yesFunction();
            yesNoModalBootStrap.hide();
        });


        // 검색 버튼 클릭 시 Ajax로 검색 결과를 갱신
        // $("#searchBtn").click(function () {
        //     var search = $("#search").val();
        //     var searchn = $("#searchn").val();
        //     var id = $("#id").val();
        //     var p = $("#p").val();
        //
        //     $.ajax({
        //         url: "warehouse/read.jsp",
        //         method: "POST",
        //         data: {
        //             search: search,
        //             searchn: searchn,
        //             id: id,
        //             p: p
        //
        //         },
        //         success: function (result) {
        //             // 검색 결과를 받아와서 결과를 보여주는 영역 업데이트
        //             $("#searchResults").html(result);
        //         },
        //         error: function () {
        //             alert("검색 중 오류가 발생했습니다.");
        //         }
        //     });
        //
        //검색기능
        $("#searchBtn").on("click", function () {

            var searchn = $("#searchn").val();
            var search = $("#search").val();
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/warehouse/read";
            form.method = "post";

            var input1 = document.createElement("input");
            input1.type = "hidden";
            input1.name = "searchn";
            input1.value = searchn;
            form.appendChild(input1);

            var input2 = document.createElement("input");
            input2.type = "hidden";
            input2.name = "search";
            input2.value = search;
            form.appendChild(input2);

            var input3 = document.createElement("input");
            input3.type = "hidden";
            input3.name = "p";
            input3.value = 1;
            form.appendChild(input3);

            var input4 = document.createElement("input");
            input4.type = "hidden";
            input4.name = "id";
            input4.value = id;
            form.appendChild(input4);

            document.body.appendChild(form);
            form.submit();


        });
    });


    function pageingFunction(clickedId) {
        var searchn1 = $("#searchn1").val();
        var search1 = $("#search1").val();
        var id = $("#id").val();

        var form = document.createElement("form");
        form.action = "/warehouse/read";
        form.method = "post";

        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "searchn";
        input1.value = searchn1;
        form.appendChild(input1);

        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "search";
        input2.value = search1;
        form.appendChild(input2);

        var input3 = document.createElement("input");
        input3.type = "hidden";
        input3.name = "p";
        input3.value = clickedId;
        form.appendChild(input3);

        var input4 = document.createElement("input");
        input4.type = "hidden";
        input4.name = "id";
        input4.value = id;
        form.appendChild(input4);

        document.body.appendChild(form);
        form.submit();
    }


</script>
</body>
</html>
