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

    const tid = '${dto.id}';
    $(function(){

    });
    function goList(){
        const $form =$("<form action='/account/list'></form>");
        $(".c_body").after($form);
        $form.submit();
    }

    function goUpdate(){
        const $form =$("<form method='post' action='/account/update'><input hidden name='id' value='"+tid+"'></form>");
        $(".c_body").after($form);
        $form.submit();
    }
    function goDelete(){
        yesNoModalTextDefine("계정 삭제", "해당 계정을 더이상 사용 안하시겠습니까?");
        $("#yesNoModalLabel").text(yesNoModal.title);
        $("#yesNoModalBodyTextDiv").text(yesNoModal.body);
        yesNoModal.yesFunction = deleteProcess;
        yesNoModalBootStrap.show();


    }

    function deleteProcess(){
        const data = {};
        data.id = tid;

        $.ajax({
            type: 'post',           // 타입 (get, post, put 등등)
            url: '/account/delete_process',           // 요청할 서버url
            dataType: 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data: data,
            success: function (result) { // 결과 성공 콜백함수
                const $form =$("<form method='get' action='/account/list'></form>");
                $(".c_body").after($form);
                $form.submit();
            },
            error: function (request, status, error) {
                alert(error)
            }
        });
    }
    function resetPassword(){
        const data = {};
        data.id = tid;

        $.ajax({
            type: 'post',           // 타입 (get, post, put 등등)
            url: '/account/reset_password',           // 요청할 서버url
            dataType: 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data: data,
            success: function (result) { // 결과 성공 콜백함수
                alert("비밀번호가 사번으로 변경되었습니다");
            },
            error: function (request, status, error) {
                alert(error)
            }
        });
    }
</script>
<div class="container-fluid c_body">
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
            <div class="w-50">
                <span>이름 : ${dto.name}</span>

                <span class="me-5"></span>
                <span>사번 : ${dto.employeeNumber}</span>

            </div>
            <div class="w-50 mt-3">
                <span>부서 : ${dto.departmentDto.name}</span>
                <span class="me-5"></span>
                <span>직책 : ${dto.positionDto.name}</span>
            </div>
            <div class="w-50 mt-3">
                <span>권한 : ${dto.personalAuthorityDto.name}</span>
            </div>
            <div class="w-50 mt-3">
                <span>이메일 : ${dto.email}</span>
                <span class="me-5"></span>
                <span>전화번호 : ${dto.telephone}</span>
            </div>
            <div class="w-50 mt-3">
                <span>성별 : ${dto.gender}</span>
                <span class="me-5"></span>
                <span>생일 : <fmt:formatDate value="${dto.birth}" pattern="yyyy-MM-dd" type="date"/></span>

            </div>
            <div class="w-50 mt-3">
                <span>주소 : ${dto.address}</span>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <button class="btn btn-primary" id="password_reset_button" onclick="resetPassword()">비밀번호 리셋</button>
            <button class="btn btn-primary" id="btn_edit" onclick="goUpdate()">수정</button>
            <button class="btn btn-danger" id="btn_exit" onclick="goList()">뒤로</button>
            <button class="btn btn-danger" id="btn_delete" onclick="goDelete()">삭제</button>
        </div>
    </div>
</div>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 끝 -->