<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    function onSelect(tag) {
        const $tag = $(tag);

        const tname = $tag.data('tname');
        const tid = $tag.data('tid');
        const tcategory = $tag.data('tcategory');
        const tcompany_name = $tag.data('tcompany_name');

        $("#stock_pro_name").val(tname);
        $("#product_id").val(tid);
        $("#stock_category_name").val(tcategory);
        $("#stock_company_name_name").val(tcompany_name);

        hideSearchModal();
    }

    $(document).ready(function () {
        // 검색 기능
        $("#searchBtn").on("click", function () {
            var searchn = $("#searchn").val();
            var search = $("#search").val();

            $.ajax({
                type: "POST",
                url: "/stock/show_modal",
                data: {
                    searchn: searchn,
                    search: search,
                    p: 1,
                    name: "product_category_company_search"
                },
                success : function(result) { // 결과 성공 콜백함수
                    $("#search_modal_body").html(result);
                    searchModalBootStrap.show();
                },
                error : function(request, status, error) {
                    alert(error)
                }
            });
        });
    });


    function pageingFunction(clickedId) {
        var searchn = $("#searchn").val();
        var search = $("#search").val();

        $.ajax({
            type: "POST",
            url: "/stock/show_modal",
            data: {
                searchn: searchn,
                search: search,
                p: clickedId,
                name: "product_category_company_search"
            },
            success : function(result) { // 결과 성공 콜백함수
                $("#search_modal_body").html(result);
                searchModalBootStrap.show();
            },
            error : function(request, status, error) {
                alert(error)
            }
        });
    }
</script>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div id="div_product_category_company_search" class="text-end">
                <div class="input-group mb-3 w-50 col-centered">
                    <div class="w-30">
                        <select class="form-select" name="searchn" id="searchn">
                            <option value="0">제품명</option>
                            <option value="1">카테고리</option>
                            <option value="2">제조사</option>

                        </select>
                    </div>
                    <input type="text" id="search" name="search" class="form-control" placeholder="검색어를 입력하세요">
                    <button class="btn btn-info" type="button" id="searchBtn">검색</button>
                    <!-- 페이징작업용 -->
                    <input type="hidden" id="searchn1" value="${searchn}">
                    <input type="hidden" id="search1" value="${search}">
                    <!-- 페이징작업용 -->
                </div>
            </div>
        </div>
        <div class="col-12 col-centered">
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th class="col-1"></th>
                    <th class="col-3">제품</th>
                    <th class="col-3">카테고리</th>
                    <th class="col-3">제조사</th>
                    <th class="col-1"></th>
                    <th class="col-1"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="dto">
                    <tr>
                        <td></td>
                        <td>${dto.name }</td>
                        <td>${dto.cls_Nm_4 }</td>
                        <td>${dto.company_name }</td>
                        <td>
                            <button data-tid="${dto.productId}"
                                    data-tname="${dto.name}"
                                    data-tcategory="${dto.cls_Nm_4}"
                                    data-tcompany_name="${dto.company_name}"
                                    class="btn btn-primary" onclick="onSelect(this)">선택
                            </button>
                        </td>
                        <td></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row row-buttons">

            <div class="col-12 d-flex justify-content-center">
                <nav>
                    <ul class="pagination">

                        <c:if test="${begin > pageNum }">
                            <li class="page-item">
                                <a href="javascript:void(0);" class="page-link" onclick="pageingFunction(this.id)"
                                   id="${begin - 1 }">&lt;</a>
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
                                <a href="javascript:void(0);" class="page-link" onclick="pageingFunction(this.id)"
                                   id="${end + 1 }">&gt;</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>

        </div><!-- row row-buttons -->
    </div>
</div>
