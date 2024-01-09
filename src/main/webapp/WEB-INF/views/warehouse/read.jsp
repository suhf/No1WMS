<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>창고 상세페이지</title>
    <style type="text/css">
        .header {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="col-12">
        <div class="col-3">
        </div>
        <div class="mt-5 mb-5 col-6 text-center">
            <h1>제품 카테고리 상세페이지</h1>
        </div>
        <div class="col-3">
            <button type="button" class="btn btn-danger" id="deleteButton">삭제</button>
        </div>
    </div>
</body>


<script>
    $(document).ready(function(){
        $("#deleteButton").on("click", function() {

            var id = $(this).data("id");

            var form = document.createElement("form");
            form.action = "/warehouse/list";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();
        });
    });//ready


</script>
</html>
