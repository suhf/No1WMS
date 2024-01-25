<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>패스워드 초기화 요청</title>
</head>
<body>
<div class="mt-5 mb-5 text-center">
    <h1>패스워드 초기화 요청</h1>
</div>
<hr>
<div class="body">
    <div class="container-fluid">
        <div class="col-12">
            <form>
                <div class="input-group mb-3 w-30 col-centered">
                    <div class="w-25">
                        <select class="form-select" name="searchn" id="searchn">
                            <option value="0">사원명</option>
                            <option value="1">사번</option>
                        </select>
                    </div>
                    <input type="text" id="search" name="search" class="form-control"
                           aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
                    <button class="btn btn-info" type="button" id="searchBtn">검색</button>

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
                        <th>사원명</th>
                        <th>email</th>
                        <th>요청사유</th>
                        <th></th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${rlist }" var="dto">
                        <tr class="detailTr col-5" data-id="${dto.id}">
                            <td class="col-1">${start} <c:set var="start" value="${start +1 }"/></td>
                            <td class="col-1">${dto.name }</td>
                            <td class="col-1">${dto.email }</td>
                            <td class="col-1">${dto.note }</td>
                            <td class="col-1">
                                <button type="button" class="resetpassword btn btn-primary" data-accountid='${dto.account_id}' data-resetpassword="${dto.id}">확인
                                </button>
                                <button type="button"  class="resetpasswordDelete btn btn-warning" data-id="${dto.id}">취소
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row row-buttons">

            <div class="col-12 d-flex justify-content-center">
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

            <input type="hidden" value="${p}" id="p"/>

        </div><!-- row row-buttons -->
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    $(document).ready(function () {
        $(".resetpassword").on("click", function(event){
            var id = $(event.currentTarget).data("resetpassword");
            const accountId = $(event.currentTarget).data("accountid");
            $.ajax({
                url: "/resetpassword/update",
                type: "put",
                data: {
                    "id": id,
                    "accountId" :    accountId
                },
                datatype:"json"
            }).done(function (data) {
                if (data == true) {
                    alert("비밀번호를 초기화했습니다.");
                    var form = document.createElement("form");
                    form.action = "/resetpassword/list";
                    form.method = "get";

                    // var input1 = document.createElement("input");
                    // input1.type = "hidden";
                    // input1.name = "id";
                    // input1.value = id;
                    // form.appendChild(input1);

                    form.submit();
                    window.location.href = "/resetpassword/list";
                } else {
                    alert("비밀번호를 초기화를 실패했습니다..");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });
        });

        $(".resetpasswordDelete").on("click", function(event){
            var id = $(event.currentTarget).data("id");
            $.ajax({
                url: "/resetpassword/delete",
                type: "delete",
                data: {
                    "id": id,
                },
                datatype:"json"
            }).done(function (data) {
                if (data == true) {
                    var form = document.createElement("form");
                    form.action = "/resetpassword/list";
                    form.method = "get";

                    // var input1 = document.createElement("input");
                    // input1.type = "hidden";
                    // input1.name = "id";
                    // input1.value = id;
                    // form.appendChild(input1);

                    form.submit();
                    window.location.href = "/resetpassword/list";
                } else {
                    alert("거절을 실패했습니다..");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });
        });

        //검색기능
        $("#searchBtn").on("click", function () {

            var searchn = $("#searchn").val();
            var search = $("#search").val();

            var form = document.createElement("form");
            form.action = "/resetpassword/list";
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
        form.action = "/resetpassword/list";
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