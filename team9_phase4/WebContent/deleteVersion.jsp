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
		<form method="POST" name="deleteVersionForm">
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">버전을 삭제 하시겠습니까?</label>
	        </div>
	        
	       	<div class="form-group row justify-content-end">
	        	<button id="deleteBtn" class="btn btn-danger">버전 삭제</button>
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
		
		$(document).ready(function () {
			let deleteBtn = document.getElementById("deleteBtn");
			deleteBtn.addEventListener('click', function() {
				let form = document.deleteMovieForm;
				console.log('deleteVersion: form: ', form);
				form.action = "./process/deleteVersionProcess.jsp?version_no=" + getParam('version_no');
				form.submit();
			})
		});
	</script>
</body>
</html>