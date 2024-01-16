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

        $(".group_tr").on("click", function(event){
            read($(event.currentTarget).data("tid"));
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

    function read(id){
        $("#formInput").val(id);
        $("#form").attr("action", "/account/read" );
        $("#form").trigger("submit");

    }

    function onPaging(target){
        const p = $(target).data("p");
        $("#pPage").val(p);
        const $form = $("#search_form");
        $form.attr("action", "/account/list");
        $form.trigger("submit");
    }



</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>계정 관리</h1><form method="post" action="/account/create"><button class="btn btn-primary" type="submit" id="btn_create">생성</button></form>
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
                    <div class="col-12">
                        <div id="search" align="center">
                            <form id="search_form">
                                <select name="searchn">
                                    <option <c:if test="${searchn == 0}">selected="selected"</c:if> value="0">사번</option>
                                    <option <c:if test="${searchn == 1}">selected="selected"</c:if> value="1">사원명</option>
                                </select>
                                <input type="text" name="search" maxlength="50" value="${search}"/>
                                <button type="submit" class="btn btn-primary" >검색</button>
                                <input id="pPage" hidden type="text" name="page">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <table class="table" >
                            <thead class="table-dark">
                            <tr><th>사번</th><th>사용자 명</th><th>활성 여부</th></tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list }" var="dto" varStatus="status">
                                <tr class="group_tr" data-mingu = "111" data-tid="${dto.id}">
                                    <td>${dto.employeeNumber}</td>
                                    <td>${dto.name}</td>
                                    <td>
                                    <c:choose>
                                        <c:when test="${dto.activation}">O</c:when>
                                        <c:otherwise>X</c:otherwise>
                                    </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div id="page" align="center">
                            <c:if test="${begin > pageNum }">
                                <a data-p='${begin-1 }' href="#" onclick="onPaging(this)">[<]</a>
                            </c:if>
                            <c:forEach begin="${begin }" end="${end}" var="i">
                                <a data-p='${i}' href="#" onclick="onPaging(this)" >${i}</a>
                            </c:forEach>
                            <c:if test="${end < totalPages }">
                                <a data-p='${end+1}' href="#" onclick="onPaging(this)">[>]</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="form" method="post">
    <input name="id" id="formInput" hidden>
</form>