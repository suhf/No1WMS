<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	<c:forEach items="${list }" var="dto" varStatus="status">
	    ${dto.productDto.name}<br>
	</c:forEach>
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
            <form class="d-inline" id="search_form">
            <select name="searchn">
                <option <c:if test="${searchn == 0}">selected="selected"</c:if> value="0">사번</option>
                <option <c:if test="${searchn == 1}">selected="selected"</c:if> value="1">사원명</option>
            </select>
            <input type="text" name="search" maxlength="50" value="${search}"/>
            <button type="submit" class="btn btn-primary" >검색</button>
            <input id="pPage" hidden type="text" name="page">
            </form>
            <button style="float: right;"  class="btn btn-primary" type="submit" id="btn_create" onclick="goCreate() ">생성</button>
        </div>
        <div class="row p-0 m-0">
            <div class="col-12 m-0">
                <table class="table" >
                    <thead class="table-dark">
                    <tr><th>제품 카테고리</th><th>제품명</th><th>수량</th><th>공급업체</th><th>날짜</th><th>수정/삭제</th></tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list }" var="dto" varStatus="status">
                        <tr class="group_tr"  data-groupn="${dto.groupNumber}" data-productid="${dto.productId}">
                            <td>${dto.cName}</td>
                            <td>${dto.productDto.name}</td>
                            <td>${dto.quantity}</td>
                            <td>${dto.vendorDto.name}</td>
                            <td><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" type="date"/></td>
                            <td><button type="submit" class="btn btn-update" >수정</button><button type="submit" class="btn btn-delete" >삭제</button><td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div id="page">
                    <ul class="pagination justify-content-center">
                    <c:if test="${begin > pageNum }">
                        <li class="page-item"><a class="page-link" data-p='${begin-1 }' href="#" onclick="onPaging(this)">[<]</a></li>
                    </c:if>
                    <c:forEach begin="${begin }" end="${end}" var="i" varStatus="status">
                        <li class="page-item <c:if test="${page eq status.count}">active</c:if> "><a class="page-link"  data-p='${i}' href="#" onclick="onPaging(this)" >${i}</a></li>
                    </c:forEach>
                    <c:if test="${end < totalPages }">
                        <li class="page-item"><a class="page-link" data-p='${end+1}' href="#" onclick="onPaging(this)">[>]</a></li>
                    </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="form" action='/plan_in/read' method="post">
    <input name="groupNumber" id="groupId" hidden>
    <input name="productId" id="productId" hidden>
</form>