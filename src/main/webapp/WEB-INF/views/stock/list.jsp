<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="base.js"></script>
    <link rel="stylesheet" href="base.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">재고</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">부족한 재고</button>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="container-fluid">
                <div class="col-12">
                    <form>
                        <div class="input-group mb-3 w-30 col-centered">
                            <div class="w-25">
                                <select class="form-select" name="searchn" id="searchn">
                                    <option value="0">제품명</option>
                                    <option value="1">카테고리</option>
                                    <option value="2">재고수</option>
                                </select>
                            </div>
                            <input type="text" id="search" name="search" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
                                <th>제품명</th>
                                <th>카테고리</th>
                                <th>재고수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${slist }" var="dto">
                                <tr class="detailTr col-5" data-id="${dto.id}" >
                                    <td class="col-1">${start} <c:set var="start" value="${start +1 }"/></td>
                                    <td class="col-1">${dto.productName }</td>
                                    <td class="col-1">${dto.cls_nm_4 }</td>
                                    <td class="col-1">${dto.quantity}</td>
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
                        <button type="button" class="btn btn-success" id="download">다운로드</button>
                    </div>
                    <div class="col-6 d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">

                                <c:if test="${begin > pageNum }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link" onclick="pageingFunction(this.id)" id="${begin - 1 }">&lt;</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${begin }" end="${end }" var="i">
                                    <li class="page-item <c:if test="${p == i}"> active </c:if>">
                                        <a href="javascript:void(0);" class="page-link " onclick="pageingFunction(this.id); return false;" id="${i }">${i }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${end < totalPages }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link" onclick="pageingFunction(this.id)" id="${end + 1 }">&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
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
                                    <option value="0">제품명</option>
                                    <option value="1">카테고리</option>
                                    <option value="2">재고수</option>
                                </select>
                            </div>
                            <input type="text" id="search2" name="search" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
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
                                <tr class="detailTr col-5" data-id="${dto.id}" >
                                    <td class="col-1">${start} <c:set var="start" value="${start +1 }"/></td>
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
                        <button type="button" class="btn btn-success" id="download2">다운로드</button>
                    </div>
                    <div class="col-6 d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">

                                <c:if test="${begin2 > pageNum2 }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link" onclick="pageingFunction2(this.id)" id="${begin2 - 1 }">&lt;</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${begin2 }" end="${end2 }" var="i">
                                    <li class="page-item <c:if test="${p2 == i}"> active </c:if>">
                                        <a href="javascript:void(0);" class="page-link " onclick="pageingFunction2(this.id); return false;" id="${i }">${i }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${end2 < totalPages2 }">
                                    <li class="page-item">
                                        <a href="javascript:void(0);" class="page-link" onclick="pageingFunction2(this.id)" id="${end2 + 1 }">&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
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


    $(document).ready(function(){
        //POST방식으로 create폼화면 출력

        //탭 1 생성 버튼
        $("#createButton").on("click",function(){
            var form = document.createElement("form");
            form.action = "/stock/create";
            form.method = "POST";
            document.body.appendChild(form);
            form.submit();
        });

        //탭 2 생성 버튼
        $("#createButton2").on("click",function(){
            var form = document.createElement("form");
            form.action = "/stock/create";
            form.method = "POST";
            document.body.appendChild(form);
            form.submit();
        });

        $("body").on("click", ".detailTr", function(){
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
        $("#searchBtn").on("click",function(){

            var searchn = $("#searchn").val();
            var search = $("#search").val();


            var form = document.createElement("form");
            form.action = "/stock/list";
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


        //탭 2 검색기능
        $("#searchBtn2").on("click",function(){

            var searchn = $("#searchn2").val();
            var search = $("#search2").val();


            var form = document.createElement("form");
            form.action = "/stock/list2";
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


    //탭 1 페이징
    function pageingFunction(clickedId){
        var searchn1 = $("#searchn1").val();
        var search1 = $("#search1").val();

        var form = document.createElement("form");
        form.action = "/stock/list";
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

    //탭 2 페이징
    function pageingFunction2(clickedId){
        var searchn2 = $("#searchn22").val();
        var search2 = $("#search22").val();

        var form = document.createElement("form");
        form.action = "/stock/list2";
        form.method = "get";

        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "searchn";
        input1.value = searchn2;
        form.appendChild(input1);

        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "search";
        input2.value = search2;
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