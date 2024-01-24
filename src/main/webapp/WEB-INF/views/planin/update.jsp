<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    function goRead(){
        const $form = $("#form");


        $("#groupId").val('${groupNumber}');

        $form.trigger("submit");
    }

    let modalData = {};
    let $selectedTr;
    let viewGroupNumber = '${viewGroupNumber}';

    function showSearchModal(title){
        $("#searchModalLabel").text(title);
        const data = { };
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/plan_in/planin_add',           // 요청할 서버url
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
    function showSearchModalEdit(title, target){
        $selectedTr = $($(target).parent('td').parent("tr"));
        $("#searchModalLabel").text(title);
        const data = { };
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/plan_in/planin_edit',           // 요청할 서버url
            dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
            data : data,
            success : function(result) { // 결과 성공 콜백함수
                $("#search_modal_body").html(result);
                const tds = $selectedTr.find("td");

                modalData.name = $(tds[0]).text();
                modalData.category =  $(tds[1]).text();
                modalData.id =  $selectedTr.data("productid");
                modalData.vendor =  $(tds[3]).text();
                modalData.date =  $(tds[4]).text();
                modalData.num =  $(tds[2]).text();

                editData();
                searchModalBootStrap.show();
            },
            error : function(request, status, error) {
                alert(error)
            }
        });
    }

    function addToTable(data){
        const $addTr = $("#id_add_tr");

        const $newTr = $($("#id_table_body tr")[0]).clone();

        //데이터 세팅 부분
        $newTr.data("productid", data.id);
        const tds = $newTr.find("td");
        $(tds[0]).text(data.name);
        $(tds[1]).text(data.category);
        $(tds[2]).text(data.num);
        $(tds[3]).text(data.vendor);
        $(tds[4]).text(data.date);


        $addTr.detach().appendTo("#form");

        $("#id_table_body").append($newTr);

        $addTr.detach().appendTo("#id_table_body");
    }

    function editToTable(data){

        const $newTr = $selectedTr;

        //데이터 세팅 부분
        $newTr.data("productid", data.id);
        const tds = $newTr.find("td");
        $(tds[0]).text(data.name);
        $(tds[1]).text(data.category);
        $(tds[2]).text(data.num);
        $(tds[3]).text(data.vendor);
        $(tds[4]).text(data.date);

    }


    function deleteTable(target){
        if($(".group_tr").length <= 1){
            alert("물품은 최소한 하나는 있어야 합니다");
            return;
        }
       $($(target).parent('td').parent("tr")).remove();
    }

    function goSave(){
        const list = [];

        const $trs = $(".group_tr");

        $trs.each(function(index, item){
            let data = {};
            const $tr = $(item);
            const tds = $tr.find("td");
            data.groupNumber = $tr.data("groupn");
            data.productId = $tr.data("productid");
            data.date = $(tds[4]).text();
            data.quantity = $(tds[2]).text();
            data.viewGroupNumber = viewGroupNumber;
            list.push(data);
        });

        console.log(list);

        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/plan_in/planin_update_process',           // 요청할 서버url
            data : JSON.stringify(list),
            dataType : 'json',
            contentType: "application/json; charset=utf-8",
            success : function(result) { // 결과 성공 콜백함수
                if(result === 's') {
                    goRead();
                }else{
                    alert("에러가 발생하였습니다")
                }
            },
            error : function(request, status, error) {
                alert(error)
            }
        });

    }

    function goDelete(){

    }



</script>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>입고 예정 관리 생성</h1>
            </div>
            <div>
                <hr>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 m-0">
            <table class="table" >
                <thead class="table-dark">
                <tr><th>제품 카테고리</th><th>제품명</th><th>수량</th><th>공급업체</th><th>날짜</th><th>수정/삭제</th></tr>
                </thead>
                <tbody id="id_table_body">
                    <c:forEach items="${list }" var="dto" varStatus="status">
                    <tr class="group_tr"  data-groupn="${dto.groupNumber}" data-productid="${dto.productId}">
                        <td>${dto.caName}</td>
                        <td>${dto.productDto.name}</td>
                        <td>${dto.quantity}</td>
                        <td>${dto.vendorDto.name}</td>
                        <td><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" type="date"/></td>
                        <td><button type="button" class="btn btn-warning" onclick="showSearchModalEdit('입고 예정 추가', this)">수정</button>
                            <button type="button" class="btn btn-danger" onclick="deleteTable(this)" >삭제</button><td>
                     </tr>
                </c:forEach>
                   <tr id="id_add_tr">
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                   		<td><button type="button" class="btn btn-warning" onclick="showSearchModal('입고 예정 추가')">추가</button></td>
                   </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-12 text-end">
        <div class="col-12">
            <button class="btn-primary btn" onclick="goSave()">저장</button>
            <form method="get" class="d-inline" action="/plan_in/list">
            <button class="btn btn-secondary" type="submit">취소</button>
            </form>
        </div>
    </div>
</div>
<form id="form" action='/plan_in/read' method="post">
    <input name="groupNumber" id="groupId" hidden>
    <input name="productId" id="productId" hidden>
</form>