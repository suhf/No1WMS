<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    function onSelect(tag) {
        const $tag = $(tag);

        const product_id = $tag.data('product_id');
        const product_name = $tag.data('product_name');
        const warehouse_id = $tag.data('warehouse_id');
        const warehouse_name = $tag.data('warehouse_name');
        const kan_code = $tag.data('kan_code');
        const quantity = $tag.data('quantity');

        $("#product_id").val(product_id);
        $("#product_name").val(product_name);
        $("#warehouse_id").val(warehouse_id);
        $("#warehouse_name").val(warehouse_name);
        $("#kan_code").val(kan_code);
        $("#quantity").val(quantity);

        hideSearchModal();
    }

    $(document).ready(function () {
        // 검색 기능
        $("#searchBtn").on("click", function () {
            var searchn = $("#searchn").val();
            var search = $("#search").val();

            $.ajax({
                type: "POST",
                url: "/out/show_modal",
                data: {
                    searchn: searchn,
                    search: search,
                    p: 1,
                    name: "stock_product_warehouse"
                },
                success: function (result) { // 결과 성공 콜백함수
                    $("#search_modal_body").html(result);
                    searchModalBootStrap.show();
                },
                error: function (request, status, error) {
                    alert(error)
                }
            });
        });
    });


    function pageingFunction(clickedId) {
        var searchn = $("#searchn1").val();
        var search = $("#search1").val();

        $.ajax({
            type: "POST",
            url: "/out/show_modal",
            data: {
                searchn: searchn,
                search: search,
                p: clickedId,
                name: "stock_product_warehouse"
            },
            success: function (result) { // 결과 성공 콜백함수
                $("#search_modal_body").html(result);
                searchModalBootStrap.show();
            },
            error: function (request, status, error) {
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
                            <option value="0" ${searchn == 0 ? 'selected' : ''}>제품명</option>
                            <option value="1" ${searchn == 1 ? 'selected' : ''}>창고명</option>
                        </select>
                    </div>
                    <input type="text" id="search" name="search" class="form-control" value="${search}" placeholder="검색어를 입력하세요">
                    <button class="btn btn-info" type="button" id="searchBtn">검색</button>
                    <!-- 페이징작업용 -->
                    <input type="hidden" id="searchn1" value="${searchn}">
                    <input type="hidden" id="search1" value="${search}">
                    <!-- 페이징작업용 -->
                </div>
            </div>
        </div>
        <div class="col-11 col-centered">
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th class="col-1"></th>
                    <th class="col-2">제품</th>
                    <th class="col-2">제품코드</th>
                    <th class="col-2">창고</th>
                    <th class="col-2">재고량</th>
                    <th class="col-1"></th>
                    <th class="col-1"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="dto">
                    <tr>
                        <td></td>
                        <td>${dto.product_name }</td>
                        <td>${dto.kan_code }</td>
                        <td>${dto.warehouse_name }</td>
                        <td>${dto.quantity }</td>
                        <td>
                            <button data-product_id="${dto.product_id}"
                                    data-product_name="${dto.product_name}"
                                    data-warehouse_id="${dto.warehouse_id}"
                                    data-warehouse_name="${dto.warehouse_name}"
                                    data-kan_code="${dto.kan_code}"
                                    data-quantity="${dto.quantity}"
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
