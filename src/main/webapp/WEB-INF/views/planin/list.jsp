<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 이 안에 내용 복사해서 jsp에 붙여넣기 -->
<link rel="stylesheet" href="/resources/static/css/account.css">
<script>
   $(function(){
      const $trs = $(".group_tr");

      $trs.on("click", function(event){
          const $tr = $(event.currentTarget);
          const groupNumber = $tr.data("groupn");
          const productId = $tr.data('productid');

          goRead(groupNumber, productId);
      });
   });

   function goRead(groupNumber, productId){
        const $form = $("#form");

        $("#productId").val(productId);
        $("#groupId").val(groupNumber);

        $form.trigger("submit");
   }

   function goCreate(){
       const $form = $("<form method='post' action='/plan_in/create'></form> ");
       $(".att").after($form);
       $form.trigger("submit");

   }

</script>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="mt-5 mb-5 text-center">
                <h1>입고 예정</h1>
            </div>
            <div>
                <hr>
	        </div>
	    </div>
	</div>
    <div class="row">
        <div class="col-12 att">
        	<form class="d-inline" id="search_form">
	            <select name="searchn">
	                <option <c:if test="${searchn == 0}">selected="selected"</c:if> value="0">그룹번호</option>
	                <option <c:if test="${searchn == 1}">selected="selected"</c:if> value="1">제품명</option>
                    <option <c:if test="${searchn == 2}">selected="selected"</c:if> value="2">수량</option>
	            </select>
	            <input type="text" name="search" maxlength="50" value="${search}"/>
	            <button type="submit" class="btn btn-primary" >검색</button>
	            <input id="pPage" hidden type="text" name="page">
            </form>
            <button style="float: right;"  class="btn btn-primary" type="submit" id="btn_create" onclick="goCreate() ">생성</button>
        </div>
        <div class="col-12 m-0">
            <table class="table" >
                <thead class="table-dark">
                <tr><th>그룹번호</th><th>제품명</th><th>수량</th><th>입고 예정 날짜</th><th>비고</th></tr>
                </thead>
                <tbody>
                    <c:forEach items="${list }" var="dto" varStatus="status">
                    <tr class="group_tr"  data-groupn="${dto.groupNumber}" data-productid="${dto.productId}">
                        <td>${dto.viewGroupNumber}</td>
                        <td>${dto.productDto.name}</td>
                        <td>${dto.quantity}</td>
                        <td><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" type="date"/></td>
                        <td>${dto.other}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<form id="form" action='/plan_in/read' method="post">
    <input name="groupNumber" id="groupId" hidden>
    <input name="productId" id="productId" hidden>
</form>