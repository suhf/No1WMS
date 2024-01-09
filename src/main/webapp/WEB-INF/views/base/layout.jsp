<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="/resources/static/js/base.js"></script>
    <link rel="stylesheet" href="/resources/static/css/base.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>No1 WMS</title>

</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
<tiles:insertAttribute name="navigation" />
<!-- body -->
<!-- 스크립트 부분 안건들여도됨-->
<script>

    $(function(){
        //네비게이션 관련
        const $listNavLink = $("a.nav-link");
        $listNavLink.each(function(index, element){
            const $element =$(element);
            $element.on("click", function(){
                clickMenu(this);
            })
        });
        //네비게이션 관련 끝

        //yes no 모달 관련
        const yesNoModalBootStrap = new bootstrap.Modal("#yes_no_modal");
        $("#yes_no_modal_show_button").on("click", function(){
            $("#yesNoModalLabel").text(yesNoModal.title);
            $("#yesNoModalBodyTextDiv").text(yesNoModal.body);
            yesNoModalBootStrap.show();
        });

        $("#modal_yes_button").on("click", function(){
            yesNoModal.yesFunction();
            yesNoModalBootStrap.hide();
        });



        //정상적으로 모달의 확인 버튼이 정의 되지 않으면 alert가 뜸
        function modalYesFuncNotDefined(){ alert("onModalYes가 정의되어 있지 않음"); }
        yesNoModal = {
            //yesFunction 변수를 modal.정의된 함수명 으로 덮어씌워서 자기가 원하는 기능 넣기
            yesFunction : modalYesFuncNotDefined,
            title : '확인 취소 모달 제목',
            body : '모달의 내용'

        }


        /*
        yes no 모달의 확인 버튼을 누를때 재정의할 function

        yesNoModal.yesFunction = myYesFunction;
        function myYesFunction(){
          alert("재정의 됨");
        }
        */
        //yes no 모달 관련 끝
        //검색 팝업 모달 관련
        const searchModalBootStrap = new bootstrap.Modal("#search_modal");
        $("#search_modal_show_button").on("click", function(){
            searchModalBootStrap.show();
        });

        /*
        * 검색 팝업 모달 닫는 함수
        */
        function hideSearchModal(){
            searchModalBootStrap.hide();
        }


        //검색 팝업 모달 관련 끝


        //네비게이션 쪽 아이콘만들어 주는 함수
        feather.replace();
    });
    function yesNoModalTextDefine(title, body){
        yesNoModal.title = title;
        yesNoModal.body = body;
    }
</script>
<!-- 스크립트 부분 끝 -->
<div class="col body-bg">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <tiles:insertAttribute name="content" />
            </div>
        </div>
    </div>
</div>
    </div>
</div>
<!-- yes no 모달 관련 -->
<div class="modal fade" id="yes_no_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="yesNoModalLabel">확인 취소 모달 제목</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="yesNoModalBodyTextDiv" class="modal-body">
                모달의 내용
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="modal_yes_button" type="button" class="modal_yes btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>

<!-- yes no 모달 관련 끝 -->
<!-- 팝업 검색 모달 관련 -->
<div class="modal fade" id="search_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" >
        <div class="modal-content" id="search_modal_content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="searchModalLabel">검색 모달 제목</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="search_modal_body">

            </div>
        </div>
    </div>
</div>
<!-- 팝업 검색 모달 관련 끝 -->
<!-- body 끝 -->
</body>
</html>
