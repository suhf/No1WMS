<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    var originalAuthorityName = '${dto.name}';
    var authorityId = '${dto.id}';
    var authorityActivation = '${dto.activation}'
    personalAuthData = [
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

    $(function(){


        const $div_check_box_body  = $("#table_check_box_body");
        personalAuthData.reverse().forEach(function(element){
            $div_check_box_body.after('<tr>' +
                '                                            <td>'+element.kor+'</td>\n' +
                '                                            <td><div id="'+element.eng+'_check_read" class="form-check form-check-inline">\n' +
                '                                                <input class="auth_input form-check-input" data-category="'+element.eng+'" type="checkbox" value="8" id="'+element.eng+'_read">\n' +
                '                                                <label class="form-check-label" for='+element.eng+'_read">\n' +
                '                                                    읽기\n' +
                '                                                </label>\n' +
                '                                            </div>\n' +
                '                                            <div id="'+element.eng+'_check_write" class="form-check form-check-inline">\n' +
                '                                                <input class="auth_input form-check-input" data-category="'+element.eng+'" type="checkbox" value="4" id="'+element.eng+'_create">\n' +
                '                                                <label class="form-check-label" for="'+element.eng+'_create">\n' +
                '                                                    쓰기\n' +
                '                                                </label>\n' +
                '                                            </div>\n' +
                '                                            <div id="'+element.eng+'_check_create" class="form-check form-check-inline">\n' +
                '                                                <input class="auth_input form-check-input" data-category="'+element.eng+'" type="checkbox" value="2" id="'+element.eng+'_update">\n' +
                '                                                <label class="form-check-label" for="'+element.eng+'_update">\n' +
                '                                                    수정\n' +
                '                                                </label>\n' +
                '                                            </div>\n' +
                '                                            <div id="'+element.eng+'_check_delete" class="form-check form-check-inline">\n' +
                '                                                <input class="auth_input form-check-input" data-category="'+element.eng+'" type="checkbox" value="1" id="'+element.eng+'_delete">\n' +
                '                                                <label class="form-check-label" for="'+element.eng+'_delete">\n' +
                '                                                    삭제\n' +
                '                                                </label>\n' +
                '                                            </div></td>\n' +
                '                                        </tr>');
        });
        personalAuthData.reverse().forEach(function(element) {

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

    function authChange(){
        hideSearchModal();
    }
    function bitCalcResult(data, index){
        let v = 1;
        for(let i = 1 ; i < index; ++i ){
            v*=2;
        }
        return (data & v) > 0;
    }
</script>
<div class="row">
    <div class="container">
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
                <button class="btn btn-primary" onclick="authChange()">닫기</button>
            </div>
        </div>
    </div>
</div>
