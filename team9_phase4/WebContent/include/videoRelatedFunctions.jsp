<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./header.jsp"%>
<body>
	<div class="text-center mt-4">
		<button onclick="location='checkTheEntireVideo.jsp'" style="width:32%" class="btn btn-outline-secondary">전체 영상물 확인</button>
	
		<button onclick="location='videoTitleSearch.jsp'" style="width:32%" class="btn btn-outline-secondary">영상물 제목 검색</button>
		
		<button onclick="location='videoConditionSearch.jsp'" style="width:32%" class="btn btn-outline-secondary">영상물 조건 검색</button>
	</div>
</body>
</html>