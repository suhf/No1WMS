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
                    <div class="col-12">
                        <form action="warehouseSearch">
                            <div class="input-group mb-3 w-30 col-centered">
                                <div class="w-25">
                                    <select class="form-select">
                                        <option selected="selected" value="0">창고명</option>
                                        <option value="1">용량</option>
                                        <option value="2">적재량</option>
                                    </select>
                                </div>
                                <input type="text" name="warehouseSearch" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
                                <button class="btn btn-info" type="button" id="button-addon2 searchBtn">검색</button>
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
                                        <tr class="detailTr" data-w_id="${dto.id}" >
                                            <td>${start} <c:set var="start" value="${start +1 }"/></td>
                                            <td><a href="read/${dto.id }">
                                                    ${dto.name }</a></td>
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
                        <div class="col-6 d-flex justify-content-center">
                            <div>
                                <c:if test="${begin > pageNum }">
                                    <a href="list.jsp?p=${begin - 1 }">이전</a>
                                </c:if>
                                <c:forEach begin="${begin }" end="${end }" var="i">
                                    <a href="list.jsp?p=${i }">${i }</a>
                                </c:forEach>
                                <c:if test="${end < totalPages }">
                                    <a href="list.jsp?p=${end + 1 }">다음</a>
                                </c:if>
                            </div>
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
    $("#createButton").on("click", function() {
        window.location.href = "/warehouse/create";
    });
</script>
</html>
