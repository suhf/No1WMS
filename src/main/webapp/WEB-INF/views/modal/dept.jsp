<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    function onSearch(){
        //
        //
    }

    function onSelectDept(tag){
        const $tag = $(tag);
        const tid = $tag.data('tid');
        const name = $tag.data('tname');

        $("#account_dept_name").val(name);
        $("#departmentId").val(tid);
        hideSearchModal();
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div id="div_auth_search" class="text-end">
                <select name="search_select" class="form-select d-inline w-10">
                    <option selected value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                </select>
                <input id="search_auth_input" type="text" class="w-30 d-inline form-control" placeholder="검색">
                <button id="search_auth_btn" type="button" class="btn btn-primary" onclick="onSearch()">검색</button>
            </div>
        </div>
        <div class="col-12">
            <table class="table">
                <thead class="table-dark">
                <tr><th>부서 명</th><th></th></tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="dto" varStatus="status">
                <tr>
                    <td>${dto.name}</td>
                    <td><button data-tid="${dto.id}" data-tname="${dto.name}" class="btn btn-primary" onclick="onSelectDept(this)">선택</button></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>