<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>재고 생성</title>
    <style type="text/css">
        .header {
            text-align: center;
        }
    </style>
</head>
<body>
<div class = "container" >
    <div class="header">
        <h1>재고 관리 생성</h1>
    </div>
    <hr>
    <div class = "row">
        <div class = "col-6">
            <form>
                <input type="text" name="search" maxlength="50" readonly/>
                <input type="submit" class="btn btn-primary"  id = "search_modal_show_button" value="검색" />
            </form>
        </div>
    </div>
</div>



<div class="modal fade" id="search_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" >
        <div class="modal-content" id="search_modal_content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="searchModalLabel">재고명 검색</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="search_modal_body">

            </div>
        </div>
    </div>
</div>
</body>
<script src="utils.js" type="text/javascript"></script>
<script>


    //검색 팝업 모달 관련
    const searchModalBootStrap = new bootstrap.Modal("#search_modal");
    $("#search_modal_show_button").on("click", function(){
        searchModalBootStrap.show();
    });

    /*
    * 검색 팝업 모달 닫는 함수
    */
    function hideSearchModal(){
        searchModalBootStrap.hide();
    }


    //검색 팝업 모달 관련 끝
</script>

</html>