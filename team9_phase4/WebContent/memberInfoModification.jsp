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
		<form action="./process/memberInfoModificationProcess.jsp" method="POST" name="memberInfoModificationForm">
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">비밀번호</label>
	            <div class="col-sm-9">
	            	<input required name="pw" type="password" class="form-control" placeholder="비밀번호">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">비밀번호 확인</label>
	            <div class="col-sm-9">
	            	<input required name="checkPw" type="password" class="form-control" placeholder="비밀번호 확인">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">이름</label>
	            <div class="col-sm-9">
	            	<input required name="name" type="name" class="form-control" placeholder="이름을 입력하세요">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">생년월일</label>
	            <div class="col-sm-9">
	            	<input name="bday" type="bday" class="form-control" placeholder="yyyy-mm-dd">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">성별</label>
	            <div class="col-sm-9">
		            <select name="sex" class="form-control">
		                <option value="m">남성</option>
		                <option value="f">여성</option>
	            	</select>
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">주소</label>
	            <div class="col-sm-9">
	            	<input name="address" type="address" class="form-control" placeholder="주소를 입력하세요">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">전화번호</label>
	            <div class="col-sm-9">
	            	<input required name="phone" type="phoneNumber" class="form-control" placeholder="123-4567">
	            </div>
	        </div>
	        
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">직업</label>
	            <div class="col-sm-9">
	            	<input name="job" type="job" class="form-control" placeholder="직업을 입력하세요">
	            </div>
	        </div>
	
	        <span style="float:right;">
	            <button type="submit" class="btn btn-primary mb-2">회원정보 수정</button>
	        </span>
	
	    </form>
	</div>
</body>
</html>