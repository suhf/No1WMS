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
            <button type="button" class="btn btn-danger" id="yes_no_modal_show_button">삭제</button>
        </div>
    </div>
</div>
<hr>
<div style="text-align: center">
    <form>
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
        <div class="container-fluid">
            <div class="col-12" id="search">
                <form action="list">
                    <div class="input-group mb-3 w-30 col-centered">
                        <div class="w-25">
                            <select class="form-select" name="searchn">
                                <option value="0">제품명</option>
                                <option value="1">재고수</option>
                            </select>
                        </div>
                        <input type="text" name="search" class="form-control"
                               aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
                        <input class="btn btn-info" type="submit" id="button-addon2 searchBtn" value="검색"/>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">

            <div class="row row-table">
                <div class="col-12">
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
                            <tr class="detailTr" data-id="${dto.id}">
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
                                    <a class="page-link" href="read?p=${begin - 1 }"><</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${begin }" end="${end }" var="i">
                                <li class="page-item <c:if test="${p == i}"> active </c:if>">
                                    <a class="page-link " href="read?p=${i }">${i }</a>
                                </li>
                            </c:forEach>
                            <c:if test="${end < totalPages }">
                                <li class="page-item">
                                    <a class="page-link" href="read?p=${end + 1 }">></a>
                                </li>
                            </c:if>
                        </ul>
                    </nev>
                </div>
                <div class="col-3 ">
                    <div class="w-40 col-centered" style="text-align: right">
                        <button type="button" class="btn btn-primary" id="checkBtn">확인</button>
                        <button type="button" class="btn btn-warning" id="modifyBtn">수정</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        $("#checkBtn").on("click", function() {
            $(location).attr("href", "/warehouse/list");
        })//checkBtn click


        $("#modifyBtn").on("click", function() {
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/warehouse/update";
            form.method = "GET";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        })//modifyBtn click

    });//ready


    $(function () {
            $("a[id]").click(function () {
                let no = $(this).attr("id");// 글번호
                $.ajax({
                        url: "/deleteWarehouse/delete",
                        data: "id=" + id,
                        method: "delete"
                    }
                ).done(function () {
                    alert("삭제되었습니다.");
                    location.href = "/warehouse/list";
                })
                return false;//하이퍼링크 이동 X
            })//click
        })

</script>
</body>
</html>
