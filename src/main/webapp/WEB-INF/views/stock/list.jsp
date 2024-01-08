<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>재고 리스트</title>
    <style type="text/css">
        .header {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>재고 리스트</h1>
</div>
<hr>

<div class="body">
<!--탭키명 -->
<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
            재고
        </button>
    </li>
    <li class="nav-item" role="presentation">
        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">
            부족한 재고
        </button>
    </li>
</ul>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
        <div id="search" align="center">
            <form action="search">
                <select name="searchn">
                    <option value="0">제품명</option>
                    <option value="1">카테고리</option>
                </select>
                <input type="text" name="search" maxlength="50"/>
                <input type="submit" class="btn btn-primary" value="검색" />
            </form>
        </div>

        <!--재고 리스트 -->
        <c:if test="${count != 0 }">
        <table align="center">
            <tr>
                <th>번호</th>
                <th>제품명</th>
                <th>창고명</th>
            </tr>
            <c:forEach items="${list}" var="stock">
                <tr>
                    <td><a href ="read/${stock.id}">${stock.id}</a></td>
                    <td>${stock.product_name }</td>
                    <td>${stock.warehouse_name }</td>
                </tr>
            </c:forEach>
        </table>

        <!-- 엑셀 다운로드-->
        <div class="excelButton" align="left">
            <button id="excelButton" value="excelButton">다운로드</button>
        </div>
        <div id="page" align="center">
            <c:if test="${begin > pageNum }">
                <a href="list?p=${begin-1 }">[<]</a>
            </c:if>
            <c:forEach begin="${begin }" end="${end}" var="i">
                <a href="list?p=${i}">${i}</a>
            </c:forEach>
            <c:if test="${end < totalPages }">
                <a href="list?p=${end+1}">[>]</a>
            </c:if>
        </div>

        <div class="createButton" align="right">
            <button id="createButton" href="create">생성</button>
        </div>


    </div>

    </c:if>
    </div>
    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
        탭2 내용
    </div>
</div>
</div>


</body>

<script src="../../utils.js" type="text/javascript"></script>
<script>



    /*엑셀 다운로드 클릭 펑션 */
    $("#excelButton").click(function(){
        const columns = [
            {name: '번호', key: 'id'},
            {name: '제품명', key: 'product_name'},
            {name: '창고명', key: 'warehouse_name'},
            {name: '재고수', key: 'quantity'},
            {name: '카테고리', key: 'cls_Nm_4'}

        ];

        exportExcel(e, 'sheet', columns, list, 'stock');
    })


</script>
</html>
