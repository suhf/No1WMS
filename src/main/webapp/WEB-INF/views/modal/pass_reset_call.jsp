<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>No1 WMS</title>
    <style>
        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }
        body{
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }


    </style>

</head>
<body class="text-center">
<script>
    function onPassReset(){
        const data={};
        data.employeeNumber=$("#employ_number").val();
        data.note=$("#note").val();
        $.ajax({
            type: 'post',           // 타입 (get, post, put 등등)
            url: '/resetpassword/insert',           // 요청할 서버url
            dataType: 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data: data,
            success: function (result) { // 결과 성공 콜백함수
                if (result === 's') {
                    alert("패스워드 초기화 요청이 완료되었습니다");
                    window.location.href = "/login";
                }else if(result === 'f'){
                    alert("요청에 실패하였습니다")
                }
            },
            error: function (request, status, error) {
                alert(error);
            }
        });
    }
</script>
<main class="form-signin">
    <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">비밀번호 초기화 요청</h1>

    <div class="form-floating mb-3">
        <input type="text" required class="form-control" id="employ_number" name="employeeNumber" placeholder="사번">
        <label for="employ_number">사번</label>

    </div>
    <div class="form-floating  mb-3">


        <textarea class="form-control w-100" name="note" id="note" placeholder="사유를 적으세요" required></textarea>
        <label for="note" class="form-label">사유</label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="button" onclick="onPassReset()">초기화 요청</button>
    <p class="mt-5 mb-3 text-muted">© 2023–2024</p>
</main>

</body>
</html>