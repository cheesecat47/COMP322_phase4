<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.AccountInfo" %>
<!DOCTYPE html>
<html>
<body>
<% 
	AccountInfo accountInfo_e = (AccountInfo)session.getAttribute("accountInfo");

	if(accountInfo_e.getIdentity() == "manager"){
%>
		<div class="text-center mt-4">
			<button onclick="location='checkMyEvaluationHistory.jsp'" style="width:49%" class="btn btn-outline-secondary">나의 평가 내역 확인</button>
			
			<button onclick="location='checkAllEvaluationHistory.jsp'" style="width:49%" class="btn btn-outline-secondary">모든 평가 내역 확인</button>
		</div>
<%
	}
	else{
%>
		<div class="text-center mt-4">
			<button onclick="location='checkMyEvaluationHistory.jsp'" style="width:98%" class="btn btn-outline-secondary">나의 평가 내역 확인</button>
		</div>
<%
	}
%>
</body>
</html>