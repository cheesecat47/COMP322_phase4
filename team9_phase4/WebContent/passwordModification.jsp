<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/memberRelatedFunctions.jsp"%>
	<br>
	<div class="container">
		<form action="./process/passwordModificationProcess.jsp" method="POST" name="passwordModificationForm">
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">비밀번호</label>
	            <div class="col-sm-9">
	            	<input required name="pw" type="password" class="form-control" placeholder="비밀번호">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">새 비밀번호</label>
	            <div class="col-sm-9">
	            	<input required name="new_pw" type="password" class="form-control" placeholder="새 비밀번호">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">새 비밀번호 확인</label>
	            <div class="col-sm-9">
	            	<input required name="new_checkPw" type="password" class="form-control" placeholder="새 비밀번호 확인">
	            </div>
	        </div>
	
	        <span style="float:right;">
	            <button type="submit" class="btn btn-primary mb-2">비밀번호 수정</button>
	        </span>
	
	    </form>
	</div>
</body>
</html>