<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>


function goDown(target){
	const $target = $(target);
	const name= $target.data("name");
	const catname = $target.data("catname");
	const vendor = $target.data("vendor");
	const id = $target.data("id");
	const vendorId = $target.data("vendorid");

	$("#input_category").val(catname);
	$("#input_vendor").val(vendor);
	$("#input_id").val(id);
	$("#input_name").val(name);
	$("#id_vendor_id").val(vendorId);


}

function editData(){

	$("#input_name").val(modalData.name);
	$("#input_category").val(modalData.category);
	$("#input_id").val(modalData.id);
	$("#input_vendor").val(modalData.vendor);
	$("#input_date").val(modalData.date);
	$("#input_num").val(modalData.num);


}

function goTable(){
	const data= {};

	data.name = $("#input_name").val();
	data.category = $("#input_category").val();
	data.id = $("#input_id").val();
	data.vendor = $("#input_vendor").val();
	data.date = $("#input_date").val();
	data.num = $("#input_num").val();

	editToTable(data);



	hideSearchModal();
}

</script>

<div class="container">
	<div class="row">
		<div class="col-12">
			<table class="table">
						<thead class="table-dark">
							<tr>
								<th>제품명</th>
								<th>회사명</th>
								<th>분류</th>
								<th>거래처</th>
								<th>등록날짜</th>
								<th>선택</th>
							</tr>
						</thead>
							<tbody>
								<c:forEach items="${list }" var="dto">
									<tr class="detailTr" data-product_id="${dto.id}" >
										<td>${dto.name }</td>
										<td>${dto.company_name }</td>
										<td>${dto.categoryDto.cls_nm_4 }</td>
										<td>${dto.vendorDto.name }</td>
										<td><fmt:formatDate value="${dto.registration_date }"
												dateStyle="short" /></td>
										<td><button type="button" class="btn btn-warning" data-id = "${dto.id}" 
										data-name = "${dto.name}" data-catname = "${dto.categoryDto.cls_nm_4 }"
										data-vendor = "${dto.vendorDto.name}" onclick= "goDown(this)"
										>확인</button></td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
		</div>
	</div>
    <div class="row">
        <div class="col-12">
  			<hr>
			<div style="text-align: center">
				<form>
					<div class="ulTag">
						<div class="row">
							<div class="col-12" style="text-align: center;">
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon1">제품카테고리</span>
									 <input
										id='input_category' type="text" class="form-control" placeholder="제품카테고리"
										aria-label="제품카테고리" value="" readonly>
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon2">제품명</span> 
									<input
										id='input_name' type="text" class="form-control" placeholder="제품명"
										aria-label="제품명" value="" readonly>
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon3">수량</span> 
									<input
										id='input_num' type="number" min="0" class="form-control" placeholder="수량"
										aria-label="수량" value="">
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon4">공급업체</span> 
									<input
										id='input_vendor'	type="text" class="form-control" placeholder="공급업체" 
										aria-label="공급업체" value="" readonly>
								</div>
		
								<div class="input-group mb-3 w-40 col-centered">
									<span class="input-group-text" id="basic-addon5">날짜</span> 
									<input
										id='input_date' type="date" class="form-control" placeholder="날짜"
										aria-label="날짜" value="">
								</div>
								<input hidden id="input_id" type="text" value="">
								
							</div>
						</div>
					</div>
		
					<div class="row">
						<div class="col-12 ">
							<div class="w-40 col-centered" style="text-align: right">
								<button type="button" class="btn btn-primary" id="updateBtn" onclick='goTable()'>수정 완료</button>
								<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
							</div>
						</div>
					</div>
				</form>
				</div>
				</div>
				</div>
			</div>
<form id="form" action='/plan_in/read' method="post">
    <input name="groupNumber" id="groupId" hidden>
    <input name="productId" id="productId" hidden>
</form>
