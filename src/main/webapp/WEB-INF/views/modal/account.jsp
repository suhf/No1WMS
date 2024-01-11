<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    function onButtonClick(tag){
        const $tag = $(tag);
        const id = $tag.data("tid");
        const
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-12">
            <table class="table" >
                <thead class="table-dark">
                <tr><th>번호</th><th>권한 명</th><th>선택</th></tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="dto" varStatus="status">
                    <c:if test="${dto.isGroupAuthority == true and dto.activation == true}">
                        <tr class="group_authority_tr">
                            <td>${status.count}</td>
                            <td>${dto.name}</td>
                            <td><button data-tid="${dto.id}" data-tname="${dto.name}" class="btn-primary btn" onclick="onButtonClick(this)">선택</button></td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>