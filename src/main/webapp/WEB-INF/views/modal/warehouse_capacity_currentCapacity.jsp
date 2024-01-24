<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<script>

    function onSelect(tag) {
        const $tag = $(tag);

        const id = $tag.data('id');
        const name = $tag.data('name');
        const address = $tag.data('address');
        const capacity = $tag.data('capacity');
        const remainingcapacity = $tag.data('remainingcapacity');


        $("#warehouse_id").val(id);
        $("#warehouse_name").val(name);
        $("#Address_name").val(address);
        $("#Capacity_name").val(capacity);
        $("#remainingcapacity").val(remainingcapacity);

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
                    name: "warehouse_capacity_currentCapacity"
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
        var searchn1 = $("#searchn1").val();
        var search1 = $("#search1").val();

        $.ajax({
            type: "POST",
            url: "/stock/show_modal",
            data: {
                searchn: searchn1,
                search: search1,
                p: clickedId,
                name: "warehouse_capacity_currentCapacity"
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


<div class="container" id="pageingData">
    <div class="row">
        <div class="col-12">
            <div id="div_warehouse_capacity_currentCapacity" class="text-end">
                <div class="input-group mb-3 w-50 col-centered">
                    <div class="w-30">
                        <select class="form-select" name="searchn" id="searchn">
                            <option value="0" ${searchn == 0 ? 'selected' : ''}>창고명</option>
                            <option value="1" ${searchn == 1 ? 'selected' : ''}>지역</option>
                            <option value="2" ${searchn == 2 ? 'selected' : ''}>용적</option>
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
        <div class="col-12">
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th class="col-1"></th>
                    <th class="col-2">창고명</th>
                    <th class="col-2">지역</th>
                    <th class="col-2">용적</th>
                    <th class="col-2">잔여 용량</th>
                    <th class="col-1"></th>
                    <th class="col-1"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="dto">
                    <tr>
                        <td></td>
                        <td>${dto.warehouseName }</td>
                        <td>${dto.address }</td>
                        <td>${dto.capacity }</td>
                        <td>${dto.capacity - dto.current_capacity }</td>
                        <td>
                            <button data-id="${dto.warehouseId}"
                                    data-name="${dto.warehouseName}"
                                    data-address="${dto.address}"
                                    data-capacity="${dto.capacity}"
                                    data-remainingcapacity="${dto.capacity - dto.current_capacity }"
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
</body>