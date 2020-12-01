<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./header.jsp"%>
<body>
	<div class="container">
	    <form action="/checkSignUpInfo.do" method="POST" name="signUpForm" enctype="multipart/form-data" >
			<div class="form-group row">
			    <label for="joinInputId" class="col-sm-3 col-form-label">등록번호</label>
			    <div class="col-sm-9">
			        <div class="input-group mb-3">
			            <input required name="id" type="text" class="form-control" id="joinInputId" placeholder="등록번호" onchange="resetDidIdCheck()">
			            <input type="hidden" name="didIdChecked" id="didIdChecked" value="false">
			            <div class="input-group-append">
			                <button class="btn btn-outline-secondary" type="button" onclick="checkId()">상세 내용 검색</button>
			            </div>
			        </div>
			    </div>
			</div>
		</form>
	</div>
</body>
</html>