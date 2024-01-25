<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mt-5 mb-5 text-center">
		<h1 style="color: green;" >마이페이지</h1>
	</div>
	<hr>
	<div class="body">
		<div class="container-fluid">
			<div class="row">
	            <div class="col-md-4" style="text-align: center;">
	            	<img alt="Default Image" width="200" src="${pageContext.request.scheme}://${pageContext.request.serverName}/images/${userData.id}.jpg" onerror="this.onerror=null; this.src='${pageContext.request.scheme}://${pageContext.request.serverName}/images/defaultimg.jpg'" />
	            	<!-- <img alt="Default Image" src="/resources/static/img/mypage/profile/${list.id}.png" width="200" /> -->
	                <!--  -->
	                <hr>
	                <p><b>
	                	<span style="color: #6E6ED7; font-size: 20px;">${list.positionDto.name }&nbsp;&nbsp; </span>
	                	<span style="font-size: 20px;">${list.name}</span>
	                </b></p>
	                <br>
	                <!--  -->
	                <form method="post" action="/mypage/uplodeImg"   enctype="multipart/form-data" class="form-horizontal">
						<div class="col-centered">
							<table id="datatable-scroller" class="table table-bordered tbl_Form">
								<tbody>
									<tr>
										<th class="active" style="text-align:right"><label class="control-label" for="">프로필사진 업로드</label></th>
										<td>
											<input type="file" name="file" id="file" accept=".jpg, .jpeg, .png" />
										</td>
									</tr>
								</tbody>
								
							</table>
						</div>
						<div class="col-centered">
							
				        	<button type="submit" class="btn btn-danger" id="uploadImg">프로필 사진 수정</button>
				            
						</div>
					</form><!-- uplodeImgForm -->
	            </div>
	            
	            
	           <div class="col-md-8">
				    <form id="userInfoForm" action="/updateUserInfo" method="post">
				        
				        <div class="form-group row">
				            <label for="name" class="col-md-2 col-form-label">이름</label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" id="name" name="name" value="${list.name}" readonly>
				            </div>
				        </div>
				        <div class="form-group row">
				            <label for="employeeNumber" class="col-md-2 col-form-label">사원 번호</label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" id="employeeNumber" name="employeeNumber" value="${list.employeeNumber}" readonly>
				            </div>
				        </div>
				        <div class="form-group row">
				            <label for="password" class="col-md-2 col-form-label">비밀번호</label>
				            <div class="col-md-6">
				                <input type="password" class="form-control" id="password" name="password" value="${list.password}">
				            </div>
				        </div>
				        <!--  -->
						<div class="form-group row">
				            <label for="email" class="col-md-2 col-form-label">이메일주소</label>
				            <div class="col-md-6">
				                <input type="email" class="form-control" id="email" name="email" value="${list.email }">
				            </div>
				        </div>
						
						<div class="form-group row">
				            <label for="gender" class="col-md-2 col-form-label">성별</label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" id="gender" name="gender" value="${list.gender }">
				            </div>
				        </div>
				        
				        <div class="form-group row">
				            <label for="birth" class="col-md-2 col-form-label">생일</label>
				            <div class="col-md-6">
				            	<fmt:formatDate value="${list.birth}" pattern="yyyy-MM-dd" type="date" var="formattedDate" />
        						<input type="date" class="form-control" id="birth" name="birth" value="${formattedDate}" />
				            </div>
				        </div>
				        
				        <div class="form-group row">
				            <label for="telephone" class="col-md-2 col-form-label">전화번호</label>
				            <div class="col-md-6">
				                <input type="tel" class="form-control" id="telephone" name="telephone" value="${list.telephone }">
				            </div>
				        </div>
				        
				        <div class="form-group row">
				            <label for="address" class="col-md-2 col-form-label">주소</label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" id="address" name="address" value="${list.address }">
				            </div>
				        </div>
				        
				        <div class="form-group row">
				            <label for="department" class="col-md-2 col-form-label">부서</label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" id="department" name="department" value="${list.departmentDto.name }" readonly>
				            </div>
				        </div>
				        
				        <div class="form-group row">
				            <label for="position" class="col-md-2 col-form-label">직책</label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" id="position" name="position" value="${list.positionDto.name }" readonly>
				            </div>
				        </div>
				        
				        <hr style="width: 700px;">
				        <div class="form-group row">
				            <div class="col-md-2"></div>
				            <div class="col-md-6 text-end">
				                <button type="button" id="submitBtn" class="btn btn-primary">저장</button>
				            </div>
				        </div>
				        
				        <input type="hidden" id="id" name="id" value="${list.id }">
				        <input type="hidden" id="personalAuthorityId" name="personalAuthorityId" value="${list.personalAuthorityId }">
				        <input type="hidden" id="groupAuthorityId" name="groupAuthorityId" value="${list.groupAuthorityId }">
						<input type="hidden" id="positionId" name="positionId" value="${list.positionId }">
						<input type="hidden" id="departmentId" name="departmentId" value="${list.departmentId }">
				    </form> 
	            </div>
	        </div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<script>
		$(document).ready(function(){
			$("#submitBtn").on("click",function(){
				//
				var name = $("#name").val();
				var password = $("#password").val();
				var employeeNumber = $("#employeeNumber").val();
				var email = $("#email").val();
				var personalAuthorityId = $("#personalAuthorityId").val();
				var gender = $("#gender").val();
				var birth = $("#birth").val();
				var telephone = $("#telephone").val();
				var address = $("#address").val();
				var departmentId = $("#departmentId").val();
				var positionId = $("#positionId").val();
				var id = $("#id").val();
				var activation = true;

		        const data = { name : name,
		        		password : password,
		        		employeeNumber : employeeNumber,
		        		email : email,
		        		personalAuthorityId : personalAuthorityId,
		        		gender : gender,
		        		birth : birth,
		        		telephone : telephone,
		        		address : address,
		        		departmentId : departmentId,
		        		positionId : positionId,
		        		id : id,
		        		activation : activation,
		        		};
			        $.ajax({
			            type : 'put',           // 타입 (get, post, put 등등)
			            url : '/mypage/updateUserInfo',           // 요청할 서버url
			            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
			            data : data
			        }).done(function(data) {
			        	console.log(data)//true
		                if (data == true) {
		                	alert("개인정보가 변경되었습니다.");
		                	$(location).attr("href", "/mypage");
		    				
		                } else {
		                	alert("개인정보 변경에 실패했습니다.");
		                }
		            }).fail(function() {
		                alert("오류가 발생했습니다.");
		            }).always(function() {
		            	//		
		            });
			        
			//
			});//submitBtn
		});//ready
	function _onSubmit(){
	        if($("#file").val()){
	            alert("이미지 파일을 업로드해주세요.");
	            $("#file").focus();
	            return false;
	        }   
	        return true;
	    }
	</script>
	
	
</body>
</html>