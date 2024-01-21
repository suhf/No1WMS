<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="base.js"></script>
    <link rel="stylesheet" href="base.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>재고 관리</title>
</head>
<body>
<div class="mt-5 mb-5 text-center">
    <h1>재고 관리</h1>
</div>
<hr>
<div class="body">

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button"
                    role="tab" aria-controls="home" aria-selected="true">재고
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button"
                    role="tab" aria-controls="profile" aria-selected="false">부족한 재고
            </button>
        </li>
    </ul>



    <!-- 탭 1 재고 -->
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="container-fluid">
                <div class="col-12">
                    <form>
                        <div class="input-group mb-3 w-30 col-centered">
                            <div class="w-25">
                                <select class="form-select" name="searchn1" id="searchn1">
                                    <option value="0" ${searchn == 0 ? 'selected' : ''}>제품명</option>
                                    <option value="1" ${searchn == 1 ? 'selected' : ''}>카테고리</option>
                                    <option value="2" ${searchn == 2 ? 'selected' : ''}>재고수</option>
                                    <option value="3" ${searchn == 3 ? 'selected' : ''}>창고명</option>
                                </select>
                            </div>
                            <input type="text" id="search1" name="search" class="form-control"
                                   aria-label="Text input with dropdown button" value="${search}" placeholder="검색어를 입력하세요">
                            <button class="btn btn-info" type="button" id="searchBtn">검색</button>

                            <!-- 페이징작업용 -->
                            <input type="hidden" id="searchn11" value="${searchn1}">
                            <input type="hidden" id="search11" value="${search1}">
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
                                <th>카테고리</th>
                                <th>재고수</th>
                                <th>창고</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${slist1 }" var="dto">
                                <tr class="detailTr col-5" data-id="${dto.id}">
                                    <td class="col-1">${start1} <c:set var="start1" value="${start1 +1 }"/></td>
                                    <td class="col-1">${dto.productName }</td>
                                    <td class="col-1">${dto.cls_nm_4 }</td>
                                    <td class="col-1">${dto.quantity}</td>
                                    <td class="col-1">${dto.warehouseName}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row row-buttons">
                    <div class="col-3 text-start">
                        <img width="50" height="50" src="https://img.icons8.com/color/48/ms-excel.png" alt="ms-excel"/>
                        <button type="button" class="btn btn-success" id="downlodeExcelList">리스트 다운로드</button>
                    </div>
                    <div class="col-6 d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">


                                <c:if test="${begin1 > pageNum1 }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link"
                                           onclick="pageingFunction1(this.id)" id="${begin1 - 1 }">&lt;</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${begin1 }" end="${end1 }" var="i">
                                    <li class="page-item <c:if test="${p1 == i}"> active </c:if>">
                                        <a href="javascript:void(0);" class="page-link "
                                           onclick="pageingFunction1(this.id); return false;" id="${i }">${i }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${end1 < totalPages1 }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link"
                                           onclick="pageingFunction1(this.id)" id="${end1 + 1 }">&gt;</a>
                                    </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>

                    <input type="hidden" id="p1" value="${p1}"/>

                    <div class="col-3 text-end">
                        <button type="button" class="btn btn-primary" id="createButton">생성</button>
                    </div>
                </div><!-- row row-buttons -->
            </div>
        </div>


        <!--탭내용 2-->
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="container-fluid">
                <div class="col-12">
                    <form>
                        <div class="input-group mb-3 w-30 col-centered">
                            <div class="w-25">
                                <select class="form-select" name="searchn" id="searchn2">
                                    <option value="0" ${searchn == 0 ? 'selected' : ''}>제품명</option>
                                    <option value="1" ${searchn == 1 ? 'selected' : ''}>카테고리</option>
                                    <option value="2" ${searchn == 2 ? 'selected' : ''}>재고수</option>
                                    <option value="3" ${searchn == 3 ? 'selected' : ''}>창고명</option>
                                </select>
                            </div>
                            <input type="text" id="search2" name="search" class="form-control"
                                   aria-label="Text input with dropdown button" value="${search}" placeholder="검색어를 입력하세요">
                            <button class="btn btn-info" type="button" id="searchBtn2">검색</button>

                            <!-- 페이징작업용 -->
                            <input type="hidden" id="searchn22" value="${searchn2}">
                            <input type="hidden" id="search22" value="${search2}">
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
                                <th>카테고리</th>
                                <th>재고수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${slist2 }" var="dto">
                                <tr class="detailTr col-5" data-id="${dto.id}">
                                    <td class="col-1">${start2} <c:set var="start2" value="${start2 +1 }"/></td>
                                    <td class="col-1">${dto.productName }</td>
                                    <td class="col-1">${dto.cls_nm_4 }</td>
                                    <td class="col-1">${dto.quantity }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row row-buttons">
                    <div class="col-3 text-start">
                        <img width="50" height="50" src="https://img.icons8.com/color/48/ms-excel.png" alt="ms-excel"/>
                        <button type="button" class="btn btn-success" id="downlodeExcelList2">리스트 다운로드</button>
                    </div>
                    <div class="col-6 d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">



                                <c:if test="${begin2 > pageNum2 }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link"
                                           onclick="pageingFunction2(this.id)" id="${begin2 - 1 }">&lt;</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${begin2 }" end="${end2 }" var="i">
                                    <li class="page-item <c:if test="${p2 == i}"> active </c:if>">
                                        <a href="javascript:void(0);" class="page-link "
                                           onclick="pageingFunction2(this.id); return false;" id="${i }">${i }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${end2 < totalPages2 }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link"
                                           onclick="pageingFunction2(this.id)" id="${end2 + 1 }">&gt;</a>
                                    </li>
                                </c:if>


                            </ul>
                        </nav>
                    </div>

                    <input type="hidden" id="p2" value="${p2}"/>

                    <div class="col-3 text-end">
                        <button type="button" class="btn btn-primary" id="createButton2">생성</button>
                    </div>
                </div><!-- row row-buttons -->
            </div>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


    $(document).ready(function () {
        $("#downlodeStockForm,downlodeStockForm2").on("click",function(){
            var form = document.createElement("form");
            form.action = "/stock/downloadStockForm";
            form.method = "GET";
            document.body.appendChild(form);
            form.submit();
        });

        $("#downlodeExcelList,downlodeExcelList2").on("click",function(){
            var form = document.createElement("form");
            form.action = "/stock/downloadExcelList";
            form.method = "GET";
            document.body.appendChild(form);
            form.submit();
        });

        //POST방식으로 create폼화면 출력
        //탭 1 생성 버튼
        $("#createButton").on("click", function () {
            var form = document.createElement("form");
            form.action = "/stock/create";
            form.method = "POST";
            document.body.appendChild(form);
            form.submit();
        });

        //탭 2 생성 버튼
        $("#createButton2").on("click", function () {
            var form = document.createElement("form");
            form.action = "/stock/create";
            form.method = "POST";
            document.body.appendChild(form);
            form.submit();
        });

        $("body").on("click", ".detailTr", function () {
            var id = $(this).data("id");

            var form = document.createElement("form");
            form.action = "/stock/read";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        });

        //탭 1 검색기능
        $("#searchBtn, #searchBtn2").on("click", function () {

            var searchn1 = $("#searchn1").val();
            var search1 = $("#search1").val();

            var searchn2 = $("#searchn2").val();
            var search2 = $("#search2").val();


            var form = document.createElement("form");
            form.action = "/stock/list";
            form.method = "get";

            var input1 = document.createElement("input");
            input1.type = "hidden";
            input1.name = "searchn1";
            input1.value = searchn1;
            form.appendChild(input1);

            var input2 = document.createElement("input");
            input2.type = "hidden";
            input2.name = "search1";
            input2.value = search1;
            form.appendChild(input2);

            var input3 = document.createElement("input");
            input3.type = "hidden";
            input3.name = "p1";
            input3.value = 1;
            form.appendChild(input3);


            var input4 = document.createElement("input");
            input4.type = "hidden";
            input4.name = "searchn2";
            input4.value = searchn2;
            form.appendChild(input4);

            var input5 = document.createElement("input");
            input5.type = "hidden";
            input5.name = "search2";
            input5.value = search2;
            form.appendChild(input5);

            var input6 = document.createElement("input");
            input6.type = "hidden";
            input6.name = "p2";
            input6.value = 1;
            form.appendChild(input6);

            document.body.appendChild(form);
            form.submit();

        });

    });

    function pageingFunction1(clickedId) {
        var searchn1 = $("#searchn11").val();
        var search1 = $("#search11").val();

        var searchn2 = $("#searchn22").val();
        var search2 = $("#search22").val();

        var p2 = $("#p2").val();

        var form = document.createElement("form");
        form.action = "/stock/list";
        form.method = "get";

        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "searchn1";
        input1.value = searchn1;
        form.appendChild(input1);

        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "search1";
        input2.value = search1;
        form.appendChild(input2);

        var input3 = document.createElement("input");
        input3.type = "hidden";
        input3.name = "p1";
        input3.value = clickedId;
        form.appendChild(input3);




        var input4 = document.createElement("input");
        input4.type = "hidden";
        input4.name = "searchn2";
        input4.value = searchn2;
        form.appendChild(input4);

        var input5 = document.createElement("input");
        input5.type = "hidden";
        input5.name = "search2";
        input5.value = search2;
        form.appendChild(input5);

        var input6 = document.createElement("input");
        input6.type = "hidden";
        input6.name = "p2";
        input6.value = p2;
        form.appendChild(input6);

        document.body.appendChild(form);
        form.submit();
    }

    function pageingFunction2(clickedId) {
        var searchn1 = $("#searchn11").val();
        var search1 = $("#search11").val();

        var searchn2 = $("#searchn22").val();
        var search2 = $("#search22").val();

        var p1 = $("#p1").val();

        var form = document.createElement("form");
        form.action = "/stock/list";
        form.method = "get";

        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "searchn1";
        input1.value = searchn1;
        form.appendChild(input1);

        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "search1";
        input2.value = search1;
        form.appendChild(input2);

        var input3 = document.createElement("input");
        input3.type = "hidden";
        input3.name = "p1";
        input3.value = p1;
        form.appendChild(input3);




        var input4 = document.createElement("input");
        input4.type = "hidden";
        input4.name = "searchn2";
        input4.value = searchn2;
        form.appendChild(input4);

        var input5 = document.createElement("input");
        input5.type = "hidden";
        input5.name = "search2";
        input5.value = search2;
        form.appendChild(input5);

        var input6 = document.createElement("input");
        input6.type = "hidden";
        input6.name = "p2";
        input6.value = clickedId;
        form.appendChild(input6);

        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>
</html>