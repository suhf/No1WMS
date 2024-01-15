<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test상세페이지</title>

</head>
<div class="row row-buttons">
				<form name="uplodeExcleForm" id="uplodeExcleForm" method="post" onsubmit="return _onSubmit();" action="/category/uplodeExcel"   enctype="multipart/form-data" class="form-horizontal">
					<div class="col-4 text-start">
						<table id="datatable-scroller" class="table table-bordered tbl_Form">
							<tbody>
								<tr>
									<th class="active" style="text-align:right"><label class="control-label" for="">파일 업로드</label></th>
									<td>
										<input type="file" name="file" id="file" accept=".xlsx, .xls"/>
									</td>
								</tr>
							</tbody>
							
						</table>
					</div>
					<div class="col-4 text-start">
						<div class="d-flex justify-content-start align-items-center">
			                <button type="submit" class="btn btn-success" id="uploadExcel">업로드</button>
			            </div>
					</div>
				</form><!-- uplodeExcleForm -->
			</div><!-- row row-buttons -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<script>
	
	
	$(document).ready(function(){
		
		
		var msg = "${resMap.msg}";
		if (msg != "") alert(msg);
		
	});//ready
		function _onSubmit(){
			        
			        if($("#file").val() == ""){
			            alert("파일을 업로드해주세요.");
			            $("#file").focus();
			            return false;
			        }
			        
			       
			        
			        return true;
			    }
</script>

</body>
</html>