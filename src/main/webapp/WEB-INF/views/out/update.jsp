<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="mt-5 mb-5 text-center">
    <h1>출고 예정 수정</h1>
</div>
<hr>
<div class="container" style="text-align: center">
    <div class="ulTag">
        <div class="row">
            <div class="col-12">

                <input type="hidden" id="id" value="${dto.id }">
                <input type='hidden' id="manager_id" value="83f11782-ae95-11ee-935d-0242ac110006">
                <input type='hidden' id="activation" value="1">


                <!--제품 관련 -->
                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Product_label' class="input-group-text">제품</span>
                    <input readonly id="product_name" type="text" class="form-control" placeholder="제품 검색" value="${dto.product_name}">
                    <input hidden name="ProductName" id="product_id" value="${dto.product_id}">
                    <button id="product_search_button" class="btn-primary btn"
                            onclick="showSearchModals('제품 검색','stock_product_warehouse')">검색
                    </button>
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Category_label' class="input-group-text">제품 코드</span>
                    <input readonly id="kan_code" type="text" class="form-control" placeholder="" value="${dto.kan_code}">
                </div>


                <div class="input-group mb-3 w-40 col-centered">
                    <span id='stockQuantity_name' class="input-group-text">재고량</span>
                    <input readonly id="stockQuantity" type="text" class="form-control" placeholder="수량을 입력하세요" value="${dto.stockQuantity}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='outQuantity_name' class="input-group-text">출고량</span>
                    <input readonly id="outQuantity" type="text" class="form-control" placeholder="수량을 입력하세요" value="${dto.outQuantity}">
                </div>


                <!--창고 관련 -->
                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Warehouse_label' class="input-group-text">창고</span>
                    <input readonly id="warehouse_name" type="text" class="form-control" placeholder="창고 검색" value="${dto.warehouse_name}">
                    <input hidden name="warehouse_id" id="warehouse_id" value="${dto.warehouse_id}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='expected_delivery_date_label' class="input-group-text">출고 예정 날짜</span>
                    <input type="text" id="expected_delivery_date" placeholder="yyyy-MM-dd" value="${dto.expected_delivery_date}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='delivery_date_label' class="input-group-text">출고 날짜</span>
                    <input type="text" id="delivery_date" placeholder="" readonly value="${dto.expected_delivery_date}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='note_label' class="input-group-text">비고</span>
                    <textarea  id="note" class="form-control" rows="5">${dto.note}</textarea>
                </div>


            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 ">
            <div class="w-40 col-centered" style="text-align: right">
                <button type="button" class="btn btn-primary" id="updateBtn">수정 완료</button>
                <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
            </div>
        </div>
    </div>
</div>
<script>


    function showSearchModals(title, val) {
        $("#searchModalLabel").text(title);
        const data = {name: val};
        $.ajax({
            type: 'post',           // 타입 (get, post, put 등등)
            url: '/out/show_modal',           // 요청할 서버url
            dataType: 'html',       // 데이터 타입 (html, xml, json, text 등등)
            data: data,
            success: function (result) { // 결과 성공 콜백함수
                $("#search_modal_body").html(result);
                searchModalBootStrap.show();
            },
            error: function (request, status, error) {
                alert(error)
            }
        });
    }


    $(document).ready(function () {


        $("#updateBtn").on("click", function () {
            var id = $("#id").val();
            var product_id = $("#product_id").val();
            var stockQuantity = parseInt($("#stockQuantity").val(), 10);
            var outQuantity = parseInt($("#outQuantity").val(), 10);
            var expected_delivery_date = $("#expected_delivery_date").val();
            var warehouse_id = $("#warehouse_id").val();
            var note = $("#note").val();
            var activation = $("#activation").val();

            if (outQuantity > stockQuantity) {
                alert("출고량이 재고량을 넘을 수 없습니다.");
                return false;
            }

            if (!product_id) {
                alert("제품을 선택해야 합니다.");
                $("#product_id").focus();
                return false;
            }
            if (!expected_delivery_date) {
                alert("출고 예정 날짜를 입력하세요.");
                $("#expected_delivery_date").focus();
                return false;
            }
            $.ajax({
                url: "/out/update_process",
                type: "put",
                data: {
                    "id": id,
                    "product_id": product_id,
                    "expected_delivery_date":expected_delivery_date,
                    "note":note,
                    "warehouse_id": warehouse_id,
                    "quantity": outQuantity,
                    "activation": activation,


                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("출고 정보가 수정되었습니다.");

                    var form = document.createElement("form");
                    form.action = "/out/read";
                    form.method = "POST";
                    document.body.appendChild(form);

                    var input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "name";
                    input.value = name;
                    form.appendChild(input);

                    form.submit();

                    window.location.href = "/out/list";
                } else {
                    alert("출고 정보 수정에 실패하였습니다.");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        })

        $("#cancelBtn").on("click", function () {
            var id = $("#id").val();

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

        })


    });
</script>

