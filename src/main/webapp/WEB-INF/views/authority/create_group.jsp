<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    /*
    yes no 모달의 확인 버튼을 누를때 재정의할 function

    yesNoModal.yesFunction = myYesFunction;
    function myYesFunction(){
      alert("재정의 됨");
    }
    */
    const authorityCategoryList = [
        {'eng' : 'account', 'kor' : '계정'},
        {'eng':'authority','kor' : '권한'},
        {'eng' : 'productCategory', 'kor' : '제품 카테고리'},
        {'eng': 'product' ,'kor' : '제품' },
        {'eng':'prices' ,'kor' : '가격' },
        {'eng': 'vendor' ,'kor' : '거래처' } ,
        {'eng':'warehouse' ,'kor' : '창고' },
        {'eng': 'stock' ,'kor' : '재고' } ,
        {'eng':'planIn' ,'kor' : '입고 예정'},
        {'eng':'productIn' ,'kor' : '입고'},
        {'eng':'productOut' ,'kor' : '출고'},
        {'eng':'board' ,'kor' : '게시판'}
    ]

    $(function(){
        const $div_check_box_body  = $("#table_check_box_body");
        authorityCategoryList.reverse().forEach(function(element){
            $div_check_box_body.after('<tr>' +
                '                                            <td>'+element.kor+'</td>\n' +
                '                                            <td><div id="'+element.eng+'_check_read" class="form-check form-check-inline">\n' +
                '                                                <input class="form-check-input" data-category="'+element.eng+'" type="checkbox" value="8" id="'+element.eng+'_read">\n' +
                '                                                <label class="form-check-label" for='+element.eng+'_read">\n' +
                '                                                    읽기\n' +
                '                                                </label>\n' +
                '                                            </div>\n' +
                '                                            <div id="'+element.eng+'_check_write" class="form-check form-check-inline">\n' +
                '                                                <input class="form-check-input" data-category="'+element.eng+'" type="checkbox" value="4" id="'+element.eng+'_create">\n' +
                '                                                <label class="form-check-label" for="'+element.eng+'_create">\n' +
                '                                                    쓰기\n' +
                '                                                </label>\n' +
                '                                            </div>\n' +
                '                                            <div id="'+element.eng+'_check_create" class="form-check form-check-inline">\n' +
                '                                                <input class="form-check-input" data-category="'+element.eng+'" type="checkbox" value="2" id="'+element.eng+'_update">\n' +
                '                                                <label class="form-check-label" for="'+element.eng+'_update">\n' +
                '                                                    수정\n' +
                '                                                </label>\n' +
                '                                            </div>\n' +
                '                                            <div id="'+element.eng+'_check_delete" class="form-check form-check-inline">\n' +
                '                                                <input class="form-check-input" data-category="'+element.eng+'" type="checkbox" value="1" id="'+element.eng+'_delete">\n' +
                '                                                <label class="form-check-label" for="'+element.eng+'_delete">\n' +
                '                                                    삭제\n' +
                '                                                </label>\n' +
                '                                            </div></td>\n' +
                '                                        </tr>');
        });

    });

    function checkName(){
        if($("#btn_check_name").text() === "다시 설정"){
            $("#authority_name").removeAttr("disabled");
            $("#btn_check_name").text("중복 확인");
            return;
        }

        const name = $("#authority_name").val();
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/authority/checkNameDuplicate',           // 요청할 서버url
            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data : {'name' : name},
            success : function(data) { // 결과 성공 콜백함수
                if(Number(data) === 0){
                    $("#authority_name").attr('disabled','true');
                    $("#btn_check_name").text("다시 설정");
                }else{
                    alert("이미 존재하는 권한 명 입니다");
                }
            },
            error : function(request, status, error) {
                alert(error);
            }
        });
    }

    function onAuthorityProcess(){
        if($("#authority_name:disabled").length === 0 ){
            alert("'중복 확인'을 해주세요");
            return;
        }

        let data = {};
        data.name = $("#authority_name").val();
        const $checkBoxList = $("input[type='checkbox']:checked");
        $checkBoxList.each(function(index, element){
            const category = $(element).data('category');
            if(data[category] == null){
                data[category] = 0;
            }
            data[category] += Number($(element).val());
        });
        data['isGroupAuthority'] = true;
        data['activation'] = true;
        console.log(data);
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/authority/create_process',           // 요청할 서버url
            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data : data,
            success : function(result) { // 결과 성공 콜백함수
                alert(result);
                if(result === 's'){
                    $("#authority_name").attr('disabled','true');
                }else if(result === 'f'){
                    alert("이미 존재하는 권한 명 입니다");
                }
            },
            error : function(request, status, error) {
                alert(error)
            }
        });
    }

</script>
<div class="row">
    <div class="col-12">
        <div class="mt-5 mb-5 text-center">
            <h1>권한 추가</h1>
        </div>
        <div>
            <hr>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">

    </div>
</div>
<div class="row">
    <div class="container">
        <div class="row">
            <div class="col-2">
                권한명
            </div>
            <div class="col-10">
                <input class="form-control w-30 d-inline" id="authority_name" name='name' type="text" placeholder="권한 명을 입력하세요">
                <button id="btn_check_name" class="btn btn-primary" onclick="checkName()">중복 확인</button>
            </div>

        </div>
        <div class="row">
            <div class="col-12">
                <table   class="table">
                    <tbody id="table_check_box_body">

                    </tbody>

                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button class="btn btn-primary" onclick="onAuthorityProcess()">생성</button>
            </div>
        </div>
    </div>
</div>
