<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 -->
<link rel="stylesheet" href="authority.css">
<script>
    /*
    yes no 모달의 확인 버튼을 누를때 재정의할 function

    yesNoModal.yesFunction = myYesFunction;
    function myYesFunction(){
      alert("재정의 됨");
    }
    */
    $(function() {
        $("#div_personal_search").hide();
        $(".nav-item button").on("click", function(obj){
            const selectedButtonId = $(obj.currentTarget).attr('id');
            if(selectedButtonId === 'home-tab'){
                $("#div_group_search").show();
                $("#div_personal_search").hide();
            }else{
                $("#div_group_search").hide();
                $("#div_personal_search").show();
            }
        });

        $(".group_authority_tr").on("click", function(event){
            readGroupAuthority($(event.currentTarget).data("tid"));
        });


    });

    function onSearch(isPersonalSearch){
        let jsonData = {};
        if(isPersonalSearch){
            jsonData.searchOption = $("select[name='search_select'] option:selected").val();
            jsonData.searchValue = $("#search_personal_input").val();

        }else{
            jsonData.searchValue = $("#search_group_input").val();
        }

        console.log(JSON.stringify(jsonData));
    }

    function readGroupAuthority(id){
        $("#formInput").val(id);
        $("#form").attr("action", "/authority/read" );
        $("#form").trigger("submit");

    }



</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>그룹 권한 관리</h1>
            </div>
            <div>
                <hr>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <!-- 탭 부분 -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#personal_authority_tab" type="button" role="tab" aria-controls="profile" aria-selected="false">개인 권한</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="home-tab" data-bs-toggle="tab" data-bs-target="#group_authority_tab" type="button" role="tab" aria-controls="home" aria-selected="true">그룹 권한</button>
                            </li>
                        </ul>
                    </div>
                    <div class="col-8">
                        <div id="div_group_search" class="text-end">
                            <input id="search_group_input" type="text" class="w-60 d-inline form-control" placeholder="검색">
                            <button id="search_group_btn" type="button" class="btn btn-primary" onclick="onSearch(false)">검색</button>
                        </div>
                        <div id="div_personal_search" class="text-end">
                            <select name="search_select" class="form-select d-inline">
                                <option selected value="10">10</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                            </select>
                            <input id="search_personal_input" type="text" class="w-60 d-inline form-control" placeholder="검색">
                            <button id="search_personal_btn" type="button" class="btn btn-primary" onclick="onSearch(true)">검색</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="personal_authority_tab" role="tabpanel" aria-labelledby="personal-authority-tab">
                                <table class="table" >
                                    <thead class="table-dark">
                                    <tr><th>사번</th><th>사용자 명</th><th>권한 명</th><th>활성 여부</th></tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list }" var="dto" varStatus="status">
                                        <c:if test="${dto.isGroupAuthority == false}">
                                            <tr>
                                                <td>${dto.accountDto.employeeNumber}</td>
                                                <td>${dto.accountDto.name}</td>
                                                <td>${dto.name}</td>
                                                <td>
                                                <c:choose>
                                                    <c:when test="${dto.activation}">O</c:when>
                                                    <c:otherwise>X</c:otherwise>
                                                </c:choose>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="group_authority_tab" role="tabpanel" aria-labelledby="group-authority-tab">
                                <table class="table" >
                                    <thead class="table-dark">
                                    <tr><th>번호</th><th>권한 명</th><th>활성 여부</th></tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list }" var="dto" varStatus="status">
                                        <c:if test="${dto.isGroupAuthority == true}">
                                            <tr class="group_authority_tr" data-tid ="${dto.id}">
                                                <td>${status.count}</td>
                                                <td>${dto.name}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${dto.activation}">O</c:when>
                                                        <c:otherwise>X</c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
                    <!-- 탭 부분 끝 -->
        </div>
    </div>
</div>
<form id="form" method="post">
    <input name="id" id="formInput" hidden>
</form>