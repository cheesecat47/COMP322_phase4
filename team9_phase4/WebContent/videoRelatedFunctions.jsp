<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team9 Phase4</title>
</head>
<body>
	<form action = "checkTheEntireVideo.jsp" method = "POST">
		<input type = "submit" value = "전체 영상물 확인">
	</form>
	
	<form action = "videoTitleSearch.jsp" method = "POST">
		<input type = "submit" value = "영상물 제목 검색">
	</form>
	
	<form action = "videoConditionSearch.jsp" method = "POST">
		<input type = "submit" value = "영상물 조건 검색">
	</form>
</body>
</html>