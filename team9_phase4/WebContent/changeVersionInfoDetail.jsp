<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/administratorFunctions.jsp"%>
	<br>
	<div class="container">
		<form method="POST" name="changeVersionInfoForm">
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">버전 정보 수정</label>
	        </div>
	        
			<div class="form-group row">
			   <label class="col-sm-3 col-form-label">상영 국가: </label>
			      <div class="col-sm-9">
			      	<select name="version_country" class="form-control">
		                <option value="KR">KR</option>
		                <option value="US">US</option>
		                <option value="IT">IT</option>
	            	</select>
			      </div>
	        </div>
	        
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">버전 이름: </label>
	            <div class="col-sm-9">
	            	<input name="version_name" type="text" class="form-control" placeholder="버전 이름">
	            </div>
	        </div>
			
	        <div class="form-group row justify-content-end">
	        	<button id="editBtn" class="btn btn-primary mb-2">버전 정보 수정</button>
	        </div>
		</form>
	</div>
	
	<script type="text/javascript">
		function getParam(sname) {
			var params = location.search.substr(location.search.indexOf("?") + 1);
			var sval = "";
			params = params.split("&");
			for (var i = 0; i < params.length; i++) {
				temp = params[i].split("=");
				if ([temp[0]] == sname) { sval = temp[1]; }
			}
			return sval;
		};
		
		$(document).ready( function () {
			let btn = document.getElementById("editBtn");
			btn.addEventListener('click', function() {
				let form = document.changeVersionInfoForm;
				form.action = "./process/changeVersionInfoDetailProcess.jsp?version_no=" + getParam('version_no');
				form.submit();
			})
		});
	</script>
</body>
</html>