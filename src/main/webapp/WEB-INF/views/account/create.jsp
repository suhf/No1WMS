<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 -->
<script>
    /*
    yes no 모달의 확인 버튼을 누를때 재정의할 function

    yesNoModal.yesFunction = myYesFunction;
    function myYesFunction(){
      alert("재정의 됨");
    }
    */
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
</script>
<div class="container-fluid">
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
                <span id='account_name_label' class="input-group-text">사용자 명</span>
                <input name="name" id="account_name" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_name_label">
                <span class="me-5"></span>
                <span id='employee_number_label' class="input-group-text">사번</span>
                <input id=employee_number" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="employee_number_label">
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_dept_label' class="input-group-text">부서 명</span>
                <input readonly id="account_dept" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_dept_label">
                <button id="btn_dept" type="button" class="btn btn-primary">검색</button>
                <span class="me-5"></span>
                <span id='employee_pos_label' class="input-group-text">직책</span>
                <input readonly id="employee_pos" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="employee_number_pos">
                <button id="btn_pos" type="button" class="btn btn-primary">검색</button>
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_group_label' class="input-group-text">권한</span>
                <input readonly id="account_auth_group_name" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_group_label">
                <input hidden name="groupAuthorityId" readonly id="groupAuthorityId" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_group_label">
                <button id="account_search_button" class="btn-primary btn" onclick="showSearchModal('권한 검색','auth')">검색</button>
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_email_label' class="input-group-text">이메일</span>
                <input id="account_email" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_email_label">
                <span class="me-5"></span>
                <span id='employee_telephone_label' class="input-group-text">전화번호</span>
                <input id=employee_telephone" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="employee_telephone_label">
            </div>
            <div class="input-group w-50 mt-3">
                <span id='account_gender_label' class="input-group-text">성별</span>
                <input id="account_gender" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="account_gender_label">
                <span class="me-5"></span>
                <span id='employee_birth_label' class="input-group-text">생일</span>
                <input id="employee_birth" type="date" class="form-control" placeholder="" aria-label="Username" aria-describedby="employee_birth_label">
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <button class="btn btn-primary" id="btn_confirm">확인</button>
            <button class="btn btn-danger" id="btn_exit">뒤로</button>
        </div>
    </div>
</div>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 끝 -->