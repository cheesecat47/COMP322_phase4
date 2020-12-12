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
		<form action="./process/~.jsp" method="POST" name="changeVersionInfoForm">
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">새 버전 정보 입력</label>
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
	            	<input required name="version_title" type="text" class="form-control" placeholder="버전 이름">
	            </div>
	        </div>
			
	        <div class="form-group row justify-content-end">
	        	<button type="editBtn" class="btn btn-primary mb-2">버전 정보 수정</button>
	        </div>
		</form>
	</div>
</body>
</html>