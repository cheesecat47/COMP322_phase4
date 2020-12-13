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
		<form method="POST" name="changeEpisodeInfoForm">
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">에피소드 정보 입력</label>
	        </div>
	        
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">에피소드 이름: </label>
	            <div class="col-sm-9">
	            	<input name="episode_name" type="text" class="form-control" placeholder="에피소드 이름">
	            </div>
	        </div>
			
	        <div class="form-group row justify-content-end">
	        	<button id="editBtn" class="btn btn-primary mb-2">에피소드 정보 수정</button>
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
				let form = document.changeEpisodeInfoForm;
				form.action = "./process/changeEpisodeInfoDetailProcess.jsp?episode_no=" + getParam('episode_no');
				form.submit();
			})
		});
	</script>
</body>
</html>