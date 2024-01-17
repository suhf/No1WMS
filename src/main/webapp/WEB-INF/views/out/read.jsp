<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>


<div class="mt-5 mb-5 text-center">
    <h1>출고 예정 상세페이지</h1>
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


                <!--제품 관련 -->
                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Product_label' class="input-group-text">제품</span>
                    <input readonly id="product_name" type="text" class="form-control" value="${dto.product_name}">
                    <input hidden name="ProductName" id="product_id" value="${dto.product_id}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='kan_code_label' class="input-group-text">제품 코드</span>
                    <input readonly id="kan_code" type="text" class="form-control" value="${dto.kan_code}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='quantity_name' class="input-group-text">출고량</span>
                    <input readonly id="quantity" type="text" class="form-control" placeholder="수량을 입력하세요" value="${dto.quantity}">
                </div>

                <!--창고 관련 -->
                <div class="input-group mb-3 w-40 col-centered">
                    <span id='Warehouse_label' class="input-group-text">창고</span>
                    <input readonly id="warehouse_name" type="text" class="form-control" value="${dto.warehouse_name}">
                    <input hidden name="warehouse_id" id="warehouse_id" value="${dto.warehouse_id}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='expected_delivery_date_label' class="input-group-text">출고 예정 날짜</span>
                    <input readonly type="text" id="expected_delivery_date" value="${dto.expected_delivery_date}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='delivery_date_label' class="input-group-text">출고 날짜</span>
                    <input readonly type="text" id="delivery_date" value="${dto.delivery_date}">
                </div>

                <div class="input-group mb-3 w-40 col-centered">
                    <span id='note_label' class="input-group-text">비고</span>
                    <textarea readonly id="note" class="form-control" rows="5" value="${dto.note}"></textarea>
                </div>


            </div>
        </div>
    </div>
    <div class="row col-12">
        <div class="col-6 ">
            <div class="w-40 col-centered" style="text-align: right">
                <button type="button" class="btn btn-danger" id="outNow">출고</button>
            </div>
        </div>
        <div class="col-6 ">
            <div class="w-40 col-centered" style="text-align: left">
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

<div class="modal fade" id="outNowModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="outNowLabel">출고하시겠습니까?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="modal_yes_button_outNow" type="button" class="modal_yes btn btn-primary">삭제</button>
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
            url : '/out/show_modal',           // 요청할 서버url
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
            form.action = "/out/update";
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
            $(location).attr("href", "/out/list");

        })

        yesNoModal.yesFunction1 = deleteStockFunction;

        function deleteStockFunction() {
            var id = $("#id").val();


            $.ajax({
                url: "/out/delete",
                type: "delete",
                data: {
                    "id": id,

                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("삭제되었습니다.");
                    $(location).attr("href", "/out/list");
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



        yesNoModal.yesFunction2 = outNowUpdate;

        function outNowUpdate() {
            var id = $("#id").val();
            var expected_delivery_date = $("#expected_delivery_date").val();
            // 현재 날짜와 시간을 얻기
            var now = new Date();
            var delivery_date = now.toISOString().slice(0, 19).replace('T', ' ');

            $.ajax({
                url: "/out/outNow",
                type: "put",
                data: {
                    "id": id,
                    "expected_delivery_date": expected_delivery_date,
                    "delivery_date": delivery_date
                },
                datatype: "json"
            }).done(function (data) {
                if (data == true) {
                    alert("출고 되었습니다.");
                    $(location).attr("href", "/out/list");
                } else {
                    alert("정상적으로 출고되지 않았습니다..");
                }
            }).fail(function () {
                alert("오류가 발생했습니다.");
            }).always(function () {
                //
            });

        }//deleteCategoryFunction

        const outNowBootStrap = new bootstrap.Modal("#outNowModal");

        $("#outNow").on("click", function () {
            outNowBootStrap.show();
        });

        $("#modal_yes_button_outNow").on("click", function () {
            console.log("삭제 버튼 클릭 이벤트 실행");
            yesNoModal.yesFunction2();
            yesNoModalBootStrap.hide();
        });


    });
</script>
<script>
    $(function () {
        // 달력을 표시할 input 요소에 대해 datepicker를 호출
        $("#expected_delivery_date").datetimepicker(); // 예상 배송일에 대해 날짜 및 시간을 선택할 수 있게 함
        $("#delivery_date").datetimepicker(); // 실제 배송일에 대해 날짜 및 시간을 선택할 수 있게 함
    });
</script>