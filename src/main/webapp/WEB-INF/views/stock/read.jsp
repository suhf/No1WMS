<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mt-5 mb-5 text-center">
    <h1>재고 상세페이지</h1>
    <div class="col-10" style="text-align: right">
        <button type="button" class="btn btn-danger" id="yes_no_modal_show">삭제</button>
    </div>
</div>
<hr>
<div class="container" style="text-align: center">
    <div class="ulTag">
        <div class="row">
            <div class="col-12">

                <input type="hidden" class="form-control" aria-label="id" id="id" value="${dto.id}" readonly>
                <input type='hidden' id="activation" value="1">


                <!--제품 관련 -->
                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Product_label' class="input-group-text">제품</span>
                    <input readonly id="stock_pro_name" type="text" class="form-control" placeholder="제품 검색" value="${dto.productName}">
                    <input hidden name="ProductName" id="product_id" value="${dto.productId}">
                    <%--                        <button id="product_search_button" class="btn-primary btn" onclick="showSearchModals('제품 검색','product_category_company_search')">검색</button>--%>
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Category_label' class="input-group-text">카테고리</span>
                    <input readonly id="stock_category_name" type="text" class="form-control" placeholder="" value="${dto.cls_nm_4}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Company_name_label' class="input-group-text">제조사</span>
                    <input readonly id="stock_company_name_name" type="text" class="form-control" placeholder="" value="${dto.company_name}">
                </div>


                <!--창고 관련 -->
                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Warehouse_label' class="input-group-text">창고</span>
                    <input readonly id="warehouse_name" type="text" class="form-control" placeholder="창고 검색" value="${dto.warehouseName}">
                    <input hidden name="product_id" id="warehouse_id" value="${dto.warehouseId}">
                    <%--                        <button id="Warehouse_search_button" class="btn-primary btn" onclick="showSearchModals('창고 검색','warehouse_capacity_currentCapacity')">검색</button>--%>
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Address_label' class="input-group-text">주소</span>
                    <input readonly id="Address_name" type="text" class="form-control" placeholder="" value="${dto.address}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Capacity_label' class="input-group-text">용적</span>
                    <input readonly id="Capacity_name" type="text" class="form-control" placeholder="" value="${dto.capacity}">
                </div>


                <!--적재할 상품의 재고수-->
                <div class="input-group mb-3 w-40 col-centered">
                    <span class="input-group-text" id="basic-addon4">재고량</span>
                    <input type="text" name="quantity" id="quantity" class="form-control"
                           placeholder="재고량을 입력하세요" aria-label="재고량" value="${dto.quantity }"
                           aria-describedby="basic-addon1" readonly>
                </div>




            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 ">
            <div class="w-40 col-centered" style="text-align: right">
                <button type="button" class="btn btn-success" id="checkBtn">확인</button>
                <button type="button" class="btn btn-secondary" id="modifyBtn">수정</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="yes_no_modal_stock_delete" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="yesNoModalLabel">삭제 하시겠습니까?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="modal_yes_button_stock_delete" type="button" class="modal_yes btn btn-primary">삭제</button>
            </div>
        </div>
    </div>
</div>

<script>

    function showSearchModals(title, val){
        $("#searchModalLabel").text(title);
        const data = { name : val};
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/stock/show_modal',           // 요청할 서버url
            dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
            data : data,
            success : function(result) { // 결과 성공 콜백함수
                $("#search_modal_body").html(result);
                searchModalBootStrap.show();
            },
            error : function(request, status, error) {
                alert(error)
            }
        });
    }


    $(document).ready(function () {
        $("#modifyBtn").on("click", function () {
            var id = $("#id").val();

            var form = document.createElement("form");
            form.action = "/stock/update";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        })

        $("#checkBtn").on("click", function () {
            $(location).attr("href", "/stock/list");

        })

        yesNoModal.yesFunction1 = deleteStockFunction;

        function deleteStockFunction() {
            var id = $("#id").val();
            var warehouse_id = $("#warehouse_id").val();
            var quantity = $("#quantity").val();

            $.ajax({
                url: "/stock/delete",
                type: "put",
                data: {
                    "id": id,
                    "warehouseId": warehouse_id,
                    "quantity" : quantity
                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("삭제되었습니다.");
                    $(location).attr("href", "/stock/list");
                } else {
                    alert("정상적으로 삭제되지 않았습니다..");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        }//deleteCategoryFunction

        const yesNoModalBootStrap = new bootstrap.Modal("#yes_no_modal_stock_delete");

        $("#yes_no_modal_show").on("click", function () {
            yesNoModalBootStrap.show();
        });

        $("#modal_yes_button_stock_delete").on("click", function () {
            console.log("삭제 버튼 클릭 이벤트 실행");
            yesNoModal.yesFunction1();
            yesNoModalBootStrap.hide();
        });


    });
</script>