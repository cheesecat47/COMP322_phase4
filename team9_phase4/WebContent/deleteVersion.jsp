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
		<form action="./process/~.jsp" method="POST" name="deleteVersionForm">
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">버전을 삭제 하시겠습니까?</label>
	        </div>
	        
	       	<div class="form-group row justify-content-end">
	        	<button type="cancelBtn" class="btn btn-primary">취소</button>
	        	<button type="deleteBtn" class="btn btn-danger">버전 삭제</button>
	        </div>
		</form>
	</div>
</body>
</html>