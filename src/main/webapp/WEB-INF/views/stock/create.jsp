<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mt-5 mb-5 text-center">
    <h1>재고 생성</h1>
</div>
<hr>
<div class="container" style="text-align: center">
        <div class="ulTag">
            <div class="row">
                <div class="col-12">


                    <input type='hidden' id="activation" value="1">


                    <!--제품 관련 -->
                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='Product_label' class="input-group-text">제품</span>
                        <input readonly id="stock_pro_name" type="text" class="form-control" placeholder="제품 검색">
                        <input hidden name="ProductName" id="product_id" value="${dto.product_id}">
                        <button id="product_search_button" class="btn-primary btn" onclick="showSearchModals('제품 검색','product_category_company_search')">검색</button>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='Category_label' class="input-group-text">카테고리</span>
                        <input readonly id="stock_category_name" type="text" class="form-control" placeholder="">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='Company_name_label' class="input-group-text">제조사</span>
                        <input readonly id="stock_company_name_name" type="text" class="form-control" placeholder="">
                    </div>


                    <!--창고 관련 -->
                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='Warehouse_label' class="input-group-text">창고</span>
                        <input readonly id="warehouse_name" type="text" class="form-control" placeholder="창고 검색">
                        <input hidden name="product_id" id="warehouse_id" value="${dto.warehouse_id}">
                        <button id="Warehouse_search_button" class="btn-primary btn" onclick="showSearchModals2('창고 검색','warehouse_capacity_currentCapacity')">검색</button>
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='Address_label' class="input-group-text">주소</span>
                        <input readonly id="Address_name" type="text" class="form-control" placeholder="">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='Capacity_label' class="input-group-text">용적</span>
                        <input readonly id="Capacity_name" type="text" class="form-control" placeholder="">
                    </div>

                    <div class="input-group mb-3 w-40 col-centered">
                        <span id='RemainingCapacity_label' class="input-group-text">잔여 용량</span>
                        <input readonly id="remainingcapacity" type="text" placeholder="" class="form-control">
                    </div>


                    <!--적재할 상품의 재고수-->
                    <div class="input-group mb-3 w-40 col-centered">
                        <span class="input-group-text" id="basic-addon4">재고량</span>
                        <input type="text" name="quantity" id="quantity" class="form-control"
                               placeholder="재고량을 입력하세요" aria-label="재고량"
                               aria-describedby="basic-addon1">
                    </div>






                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 ">
                <div class="w-40 col-centered" style="text-align: right">
                    <button type="button" class="btn btn-success" id="submitBtn">생성</button>
                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>

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

    function showSearchModals2(title, val){
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


        $("#submitBtn").on("click", function () {
            var product_id = $("#product_id").val();
            var warehouse_id = $("#warehouse_id").val();
            var activation = $("#activation").val();
            var quantity = parseInt($("#quantity").val(), 10);
            var remainingcapacity = parseInt($("#remainingcapacity").val(), 10);

            console.log("Quantity:", quantity);
            console.log("Remaining Capacity:", remainingcapacity);

            if (quantity > remainingcapacity) {
                alert("적재 할 재고량이 잔여 용량을 넘을 수 없습니다.");
                $("#quantity").focus();
                return false;
            }

            if (!product_id) {
                alert("제품을 선택해야 합니다.");
                $("#product_id").focus();
                return false;
            }
            if (!warehouse_id) {
                alert("적재할 창고를 선택해야 합니다.");
                $("#warehouse_id").focus();
                return false;
            }

            if (!quantity) {
                alert("재고량를 입력해야 합니다.");
                $("#quantity").focus();
                return false;
            }

            $.ajax({
                url: "/stock/create_process",
                type: "post",
                data: {
                    "productId": product_id,
                    "warehouseId": warehouse_id,
                    "quantity": quantity,
                    "activation": activation

                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("재고 정보가 생성되었습니다.");

                    var form = document.createElement("form");
                    form.action = "/stock/read";
                    form.method = "POST";
                    document.body.appendChild(form);

                    var input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "name";
                    input.value = name;
                    form.appendChild(input);

                    form.submit();

                    window.location.href = "/stock/list";
                } else {
                    alert("재고 정보 생성에 실패하였습니다.");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        })

        $("#cancelBtn").on("click", function () {
            $(location).attr("href", "/stock/list");

        })


    });
</script>