<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<style>
	#footer {

    position:absolute;

    bottom:0;

    width:100%;

    height:70px;   
}
</style>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/videoRelatedFunctions.jsp"%>
	
	<div id = "footer">
		<%@include file="./include/registrationNumberSearch.jsp"%>
	</div>
</body>
</html>