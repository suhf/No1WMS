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
<script>
    /*
    yes no 모달의 확인 버튼을 누를때 재정의할 function

    yesNoModal.yesFunction = myYesFunction;
    function myYesFunction(){
      alert("재정의 됨");
    }
    */
    $(function(){
        $('.tabcontent > div').hide();
        $('.tabnav a').click(function () {
            $('.tabcontent > div').hide().filter(this.hash).fadeIn();
            $('.tabnav a').removeClass('active');
            $(this).addClass('active');
            return false;
        }).filter(':eq(0)').click();
    });
</script>
여기다가 화면 만들기
<!--탭키명 -->
<div class="tab">
    <ul class="tabnav">
        <li><a href="#tab01">재고</a></li>
        <li><a href="#tab02">부족한재고</a></li>
    </ul>

    <!--탭키 내용-->
    <div class="tabcontent">

        <!--재고 탭 내용-->
        <div id="tab01">
            <div id="search" align="center">
                <form action="search">
                    <select name="searchn">
                        <option value="0">창고명</option>
                        <option value="1">제품명</option>
                    </select>
                    <input type="text" name="search" maxlength="50"/>
                    <input type="submit" class="btn btn-primary" value="검색" />
                </form>
            </div>

            <!--재고 리스트 -->
            <c:if test="${count != 0 }">
                <table>
                    <tr>
                        <th>번호</th>
                        <th>제품명</th>
                        <th>창고명</th>
                    </tr>
                    <c:forEach items="${list}" var="stock">
                        <tr>
                            <td><a href ="read/${stock.id}">${stock.stock.id}</a></td>
                            <td>${stock.product.name }</td>
                            <td>${stock.warehouse.name }</td>
                        </tr>
                    </c:forEach>
                </table>
                <div id="page">
                    <c:if test="${begin > pageNum }">
                        <a href="list?p=${begin-1 }">[이전]</a>
                    </c:if>
                    <c:forEach begin="${begin }" end="${end}" var="i">
                        <a href="list?p=${i}">${i}</a>
                    </c:forEach>
                    <c:if test="${end < totalPages }">
                        <a href="list?p=${end+1}">[다음]</a>
                    </c:if>
                </div>

            </c:if>
        </div>

        <!--부족한재고 탭 내용-->
        <div id="tab02">
            tab2 content
        </div>
    </div>
</div>

</body>
</html>