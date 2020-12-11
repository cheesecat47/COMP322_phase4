<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.AccountInfo" %>
<!DOCTYPE html>
<html>
<body>
<% 
	AccountInfo accountInfo_a = (AccountInfo)session.getAttribute("accountInfo");

	if(accountInfo_a.getIdentity().equals("manager")){
%>
		<div class="text-center mt-4">
			<h2 class="form-signin-heading">knuMovieDB_Manager_Menu</h2>
			
			<button onclick="location='checkTheEntireVideo.jsp'" style="width:24%" class="btn btn-outline-secondary">영상물 관련 기능</button>
			
			<button onclick="location='checkMyEvaluationHistory.jsp'" style="width:24%" class="btn btn-outline-secondary">평가 관련 기능</button>
			
			<button onclick="location='memberInfoModification.jsp'" style="width:24%" class="btn btn-outline-secondary">회원 관련 기능</button>
			
			<button onclick="location='registerNewVideo.jsp'" style="width:24%" class="btn btn-outline-secondary">관리자 관련 기능</button>
		</div>
<%
	}
	else{
%>

		<div class="text-center mt-4">
			<h2 class="form-signin-heading">knuMovieDB_Customer_Menu</h2>
			
			<button onclick="location='checkTheEntireVideo.jsp'" style="width:32%" class="btn btn-outline-secondary">영상물 관련 기능</button>
			
			<button onclick="location='checkMyEvaluationHistory.jsp'" style="width:32%" class="btn btn-outline-secondary">평가 관련 기능</button>
			
			<button onclick="location='memberInfoModification.jsp'" style="width:32%" class="btn btn-outline-secondary">회원 관련 기능</button>
		</div>
<%
	}
%>
</body>
</html>