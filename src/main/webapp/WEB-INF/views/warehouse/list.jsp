<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>창고 리스트</title>
</head>
<body>
<div class="container-fluid">
    <div class="body">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>창고 리스트</h1>
            </div>
            <div>
                <hr>
            </div>
            <div class="row">
                <div class="container-fluid">
                    <div class="col-12" id="search">
                        <form action="list">
                            <div class="input-group mb-3 w-30 col-centered">
                                <div class="w-25">
                                    <select class="form-select" name="searchn">
                                        <option value="0">창고명</option>
                                        <option value="1">용량</option>
                                        <option value="2">적재량</option>
                                    </select>
                                </div>
                                <input type="text" name="search" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
                                    <th>창고명</th>
                                    <th>용량</th>
                                    <th>적재량</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${wlist }" var="dto">
                                        <tr class="detailTr" data-id="${dto.id}" >
                                            <td>${start} <c:set var="start" value="${start +1 }"/></td>
                                            <td>${dto.name }</td>
                                            <td>${dto.capacity }</td>
                                            <td>${dto.current_capacity }</td>
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
                                        <a class="page-link" href="list?p=${begin - 1 }"><</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${begin }" end="${end }" var="i">
                                    <li class="page-item <c:if test="${p == i}"> active </c:if>">
                                        <a class="page-link " href="list?p=${i }">${i }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${end < totalPages }">
                                    <li class="page-item">
                                        <a class="page-link" href="list?p=${end + 1 }">></a>
                                    </li>
                                </c:if>
                            </ul>
                            </nev>
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
</body>

<script>
    $(document).ready(function(){
        $("#createButton").on("click", function() {
            window.location.href = "/warehouse/create";
        });




        $("body").on("click", ".detailTr", function(){
            var id = $(this).data("id");

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
        });
    });//ready
</script>
</html>
