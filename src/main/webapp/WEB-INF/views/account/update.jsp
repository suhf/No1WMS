<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 -->
<script>
    /*
    yes no 모달의 확인 버튼을 누를때 재정의할 function

    yesNoModal.yesFunction = myYesFunction;
    function myYesFunction(){
      alert("재정의 됨");
    }
    */
    let personalAuthData = null;
    const tid = '${dto.id}';
    function showSearchModal(title, val){
        $("#searchModalLabel").text(title);
        const data = { name : val};
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/account/show_modal',           // 요청할 서버url
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
    //다른거하고 달리 auth의 경우 list가 아닌 값을 가져옴
    function showAuthModal(title, val){
        if(personalAuthData == null) {
            $("#searchModalLabel").text(title);
            const data = {};
            data.id = $("#personalAuthorityId").val();
            $.ajax({
                type: 'post',           // 타입 (get, post, put 등등)
                url: '/account/show_personal_auth_modal',           // 요청할 서버url
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
        }else{
            searchModalBootStrap.show();
        }
    }

    function updateProcess(){
        let data = {};
        data.personalAuthorityDto = {};
        data.personalAuthorityDto.name = originalAuthorityName;
        data.personalAuthorityDto.activation = authorityActivation;
        data.personalAuthorityDto.isGroupAuthority = "false";
        data.account = {};
        data.account.id = tid;
        data.account.activation = $("input[name='activation']:checked").val();
        const $dataInputList = $("input.create_data");
        $dataInputList.each(function(index, element){
           const $element = $(element);
           const name = $element.attr("name");
           const val = $element.val();
           data.account[name] = '"'+val.trim()+'"';
        });
        const $checkBoxList = $(".auth_input:checked");
        $checkBoxList.each(function(index, element){
            const category = $(element).data('category');
            if(data.personalAuthorityDto[category] == null){
                data.personalAuthorityDto[category] = 0;
            }
            data.personalAuthorityDto[category] += Number($(element).val());
        });
        data.personalAuthorityDto.id = '${dto.personalAuthorityId}';
        aaa = data;
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/account/update_process',           // 요청할 서버url
            contentType : "application/json; charset=UTF-8",
            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data : JSON.stringify(data),
            success : function(result) { // 결과 성공 콜백함수
                const $form = $("<form method='post' action='/account/read'><input name='id' value='"+tid+"'></form>")
                $("#c-body").after($form);
                $form.submit();
            },
            error : function(request, status, error) {
                alert(error)
            }
        });
    }


    $(function (){
        $("#searchModalLabel").text('개인 권한 수정');
        const data = {};
        data.id = $("#personalAuthorityId").val();
        $.ajax({
            type: 'post',           // 타입 (get, post, put 등등)
            url: '/account/show_personal_auth_modal',           // 요청할 서버url
            dataType: 'html',       // 데이터 타입 (html, xml, json, text 등등)
            data: data,
            success: function (result) { // 결과 성공 콜백함수
                $("#search_modal_body").html(result);
            },
            error: function (request, status, error) {
                alert(error)
            }
        });
    });

</script>
<div id='c-body' class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>사용자 추가</h1>
            </div>
            <div>
                <hr>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="input-group w-50">
                <span class="input-group-text">활성화</span>
                <div class="form-check form-check-inline">
                    <input <c:if test="${dto.activation == true}">checked </c:if> class="form-check-input" type="radio" name="activation" id="inlineRadio1" value="true">
                    <label class="form-check-label" for="inlineRadio1">활성</label>
                </div>
                <div class="form-check form-check-inline">
                    <input <c:if test="${dto.activation == false}">checked </c:if> class="form-check-input" type="radio" name="activation" id="inlineRadio2" value="false">
                    <label class="form-check-label" for="inlineRadio2">비활성</label>
                </div>
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_name_label' class="input-group-text">이름</span>
                <input value = "${dto.name}" name="name" id="account_name" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="account_name_label">
                <span class="me-5"></span>
                <span id='employee_number_label' class="input-group-text">사번</span>
                <input value = "${dto.employeeNumber}" id=employee_number" name="employeeNumber" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="employee_number_label">
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_dept_label' class="input-group-text">부서</span>
                <input value = "${dto.departmentDto.name}" readonly id="account_dept_name" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_dept_label">
                <input value = "${dto.departmentId}" hidden name="departmentId" readonly id="departmentId" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="account_dept_label">
                <button id="btn_dept" type="button" class="btn btn-primary" onclick="showSearchModal('부서 검색','dept')">검색</button>
                <span class="me-5"></span>
                <span id='employee_pos_label' class="input-group-text">직책</span>
                <input value = "${dto.positionDto.name}" readonly id="account_pos_name" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="employee_number_pos">
                <input value = "${dto.positionId}" hidden name="positionId" readonly id="positionId" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="employee_number_pos">
                <button id="btn_pos" type="button" class="btn btn-primary" onclick="showSearchModal('직책 검색','pos')">검색</button>
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_group_label' class="input-group-text">권한</span>
                <input value = "${dto.personalAuthorityDto.name}" readonly id="account_auth_group_name" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_group_label">
                <input value = "${dto.personalAuthorityId}" hidden name="personalAuthorityId" readonly id="personalAuthorityId" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="account_group_label">
                <button id="account_search_button" class="btn-primary btn" onclick="showAuthModal('개인 권한 수정','personal_auth')">수정</button>
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_email_label' class="input-group-text">이메일</span>
                <input value = "${dto.email} "id="account_email" name="email" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="account_email_label">
                <span class="me-5"></span>
                <span id='employee_telephone_label' class="input-group-text">전화번호</span>
                <input value = "${dto.telephone}" id=employee_telephone" name="telephone" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="employee_telephone_label">
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_gender_label' class="input-group-text">성별</span>
                <input value = "${dto.gender}" id="account_gender" name="gender" type="text" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="account_gender_label">
                <span class="me-5"></span>
                <span id='employee_birth_label' class="input-group-text">생일</span>
                <input value = "<fmt:formatDate value='${dto.birth}' pattern='yyyy-MM-dd' type='date'/>" id="employee_birth" name="birth" type="date" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="employee_birth_label">
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_address_label' class="input-group-text">주소</span>
                <input value = "${dto.address}" id="account_address" type="text" name="address" class="create_data form-control" placeholder="" aria-label="Username" aria-describedby="account_address_label">
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <button class="btn btn-primary" id="btn_confirm" onclick="updateProcess()">확인</button>
            <button class="btn btn-danger" id="btn_exit" onclick="window.history.back()">뒤로</button>
        </div>
    </div>
</div>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 끝 -->