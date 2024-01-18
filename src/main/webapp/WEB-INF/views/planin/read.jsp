<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	<c:forEach items="${list }" var="dto" varStatus="status">
	    ${dto.productDto.name}<br>
	</c:forEach>
	
    function showSearchModal(title, val){
        $("#searchModalLabel").text(title);
        const data = { name : val};
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/plan_in/show_modal',           // 요청할 서버url
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

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>입고 예정 상세페이지</h1>
            </div>
            <div>
                <hr>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 att">
        	qr : <a href = "/plan_in/qr/${groupNum}"> link </a>
            <button style="float: right;"  class="btn btn-primary" type="submit" id="btn_create" onclick="goCreate() ">삭제 </button>
        </div>
        <div class="col-12 m-0">
            <table class="table" >
                <thead class="table-dark">
                <tr><th>제품 카테고리</th><th>제품명</th><th>수량</th><th>공급업체</th><th>날짜</th><th>수정/삭제</th></tr>
                </thead>
                <tbody>
                    <c:forEach items="${list }" var="dto" varStatus="status">
                    <tr class="group_tr"  data-groupn="${dto.groupNumber}" data-productid="${dto.productId}">
                        <td>${dto.caName}</td>
                        <td>${dto.productDto.name}</td>
                        <td>${dto.quantity}</td>
                        <td>${dto.vendorDto.name}</td>
                        <td><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" type="date"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>                   
        </div>
            <div class="col-12 text-end">
            	<form class="d-inline" method="get" action="/plan_in/list">
   	            	<button type="submit" class="btn btn-primary" >확인</button>
   	            </form>
   	            <form class="d-inline" method="post" action="/plan_in/update">
            		<button type="submit" class="btn btn-warning" >수정</button>
            		<input name="groupNumber" value="${groupNum}" hidden>
            	</form>
            </div>
    </div>
</div>
<form id="form" action='/plan_in/read' method="post">
    <input name="groupNumber" id="groupId" hidden>
    <input name="productId" id="productId" hidden>
</form>