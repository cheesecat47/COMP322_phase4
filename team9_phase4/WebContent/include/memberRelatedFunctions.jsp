<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./header.jsp"%>
<body>
	<div class="text-center mt-4">
		<button onclick="location='memberInfoModification.jsp'" style="width:32%" class="btn btn-outline-secondary">회원 정보 수정</button>
		
		<button onclick="location=passwordModification.jsp'" style="width:32%" class="btn btn-outline-secondary">비밀 번호 수정</button>
		
		<button onclick="location='withdrawal.jsp'" style="width:32%" class="btn btn-outline-secondary">회원 탈퇴</button>
	</div>
</body>
</html>