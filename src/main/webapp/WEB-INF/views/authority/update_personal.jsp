<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    /*
    yes no 모달의 확인 버튼을 누를때 재정의할 function

    yesNoModal.yesFunction = myYesFunction;
    function myYesFunction(){
      alert("재정의 됨");
    }
    */
    const originalAuthorityName = '${dto.name}';
    const authorityId = '${dto.id}';
    const authorityCategoryList = [
        {'eng' : 'account', 'kor' : '계정', 'value' : ${dto.account}},
        {'eng':'authority','kor' : '권한', 'value' : ${dto.authority}},
        {'eng' : 'productCategory', 'kor' : '제품 카테고리', 'value' : ${dto.productCategory}},
        {'eng': 'product' ,'kor' : '제품', 'value' : ${dto.product}},
        {'eng':'prices' ,'kor' : '가격', 'value' : ${dto.prices} },
        {'eng': 'vendor' ,'kor' : '거래처' , 'value' : ${dto.vendor}} ,
        {'eng':'warehouse' ,'kor' : '창고' , 'value' : ${dto.warehouse}},
        {'eng': 'stock' ,'kor' : '재고', 'value' : ${dto.stock} } ,
        {'eng':'planIn' ,'kor' : '입고 예정', 'value' : ${dto.planIn}},
        {'eng':'productIn' ,'kor' : '입고', 'value' : ${dto.productIn}},
        {'eng':'productOut' ,'kor' : '출고', 'value' : ${dto.productOut}},
        {'eng':'board' ,'kor' : '게시판', 'value' : ${dto.board}}
    ]

    /*뒤에서부터 index번째 비트가 1인가 확인하는 기능
       ex) data : 9(1001), index : 1 = true
                           index : 2 = false
                           index : 3 = false
                           index : 4 = true
    */
    function bitCalcResult(data, index){
        let v = 1;
        for(let i = 1 ; i < index; ++i ){
            v*=2;
        }
        return (data & v) > 0;
    }

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
        authorityCategoryList.reverse().forEach(function(element) {

            const value =element.value;
            if(  bitCalcResult(value, 4 ))
                $("#"+element.eng+"_read").attr('checked', true);
            if(  bitCalcResult(value, 3 ))
                $("#"+element.eng+"_create").attr('checked', true);
            if(  bitCalcResult(value, 2 ))
                $("#"+element.eng+"_update").attr('checked', true);
            if(  bitCalcResult(value, 1 ))
                $("#"+element.eng+"_delete").attr('checked', true);
        });


    });




    function onAuthorityUpdateProcess(){

        let data = {};
        data.name = originalAuthorityName;
        const $checkBoxList = $("input[type='checkbox']:checked");
        $checkBoxList.each(function(index, element){
            const category = $(element).data('category');
            if(data[category] == null){
                data[category] = 0;
            }
            data[category] += Number($(element).val());
        });
        data['isGroupAuthority'] = false;
        data['activation'] = $('input[name="activation"]:checked').val();
        data['id'] = authorityId;
        console.log(data);
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/authority/update_process', // 요청할 서버url
            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data : data,
            success : function(result) { // 결과 성공 콜백함수
                if(result){
                    const $form = $("<form method='get' action='/authority/list'></form>");
                    $(".temp").after($form);
                    $form.submit();
                }else{
                    alert("업데이트 중에 오류기 발생하였습니다");
                }
            },
            error : function(request, status, error) {
                alert(error)
            }
        });
    }

</script>
<div class="temp row">
    <div class="col-12">
        <div class="mt-5 mb-5 text-center">
            <h1>개인 권한 수정</h1>
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
            <div class="col-12">
                <span class="me-5">사용자 명 ${dto.accountDto.name}</span>
                <span>사번 ${dto.accountDto.employeeNumber}</span>
            </div>



        </div>
        <div class="row">
            <div class="col-2">
                활성 여부
            </div>
            <div class="col-10">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="activation" id="inlineRadio1" value="true"  <c:if test="${dto.activation == true}"> checked</c:if>>
                    <label class="form-check-label" for="inlineRadio1">활성</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="activation" id="inlineRadio2" value="false" <c:if test="${dto.activation == false}"> checked</c:if>>
                    <label class="form-check-label" for="inlineRadio2">비활성</label>
                </div>
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
                <button class="btn btn-primary" onclick="onAuthorityUpdateProcess()">수정</button>
                <button class="btn btn-primary" onclick="window.history.back()">뒤로</button>
            </div>
        </div>
    </div>
</div>
