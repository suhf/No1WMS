<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>출고 리스트</title>
    <style>
        .detailTr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="body">
    <div class="container-fluid">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>출고 관리 리스트</h1>
            </div>
            <div>
                <hr>
            </div>
            <div class="row">
                <div class="container-fluid">
                    <div class="col-12">
                        <form>
                            <div class="input-group mb-3 w-30 col-centered">
                                <div class="w-25">
                                    <select class="form-select" name="searchn" id="searchn">
                                        <option value="0" ${searchn == 0 ? 'selected' : ''}>제품명</option>
                                        <option value="1" ${searchn == 1 ? 'selected' : ''}>창고명</option>
                                    </select>
                                </div>
                                <input type="text" name="search" id="search" class="form-control"
                                       aria-label="Text input with dropdown button" value="${search}" placeholder="검색어를 입력하세요">
                                <input class="btn btn-info" type="submit" id="searchBtn" value="검색"/>

                                <!-- 페이징작업용 -->
                                <input type="hidden" id="searchn1" value="${searchn}">
                                <input type="hidden" id="search1" value="${search}">
                                <!-- 페이징작업용 -->
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
                                    <th>수량</th>
                                    <th>창고명</th>
                                    <th>출고 예정 날짜</th>
                                    <th>출고 날짜</th>
                                    <th>비고</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${olist }" var="dto">
                                    <tr class="detailTr col-7" data-id="${dto.id}">
                                        <td class="col-1">${start} <c:set var="start" value="${start +1 }"/></td>
                                        <td class="col-1">${dto.productName }</td>
                                        <td class="col-1">${dto.quantity }</td>
                                        <td class="col-1">${dto.warehouseName }</td>
                                        <td class="col-1">${dto.expected_delivery_date }</td>
                                        <td class="col-1">${dto.delivery_date }</td>
                                        <td class="col-1">${dto.note }</td>
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
                            <nav>
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
                            </nav>
                        </div>
                        <div class="col-3 text-end">
                            <button type="button" class="btn btn-primary" id="createButton">생성</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>


    $(document).ready(function () {
        $("#createButton").on("click",function(){
            var form = document.createElement("form");
            form.action = "/out/create";
            form.method = "POST";
            document.body.appendChild(form);
            form.submit();
        });


        $("body").on("click", ".detailTr", function () {
            var id = $(this).data("id");

            var form = document.createElement("form");
            form.action = "/out/read";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();
        });

        //검색기능
        $("#searchBtn").on("click", function () {

            var searchn = $("#searchn").val();
            var search = $("#search").val();

            var form = document.createElement("form");
            form.action = "/out/list";
            form.method = "get";

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

            document.body.appendChild(form);
            form.submit();

        });

    });//ready

    function pageingFunction(clickedId) {
        var searchn1 = $("#searchn1").val();
        var search1 = $("#search1").val();

        var form = document.createElement("form");
        form.action = "/out/list";
        form.method = "get";

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

        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>
</html>