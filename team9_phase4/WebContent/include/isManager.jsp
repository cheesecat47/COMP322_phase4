<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.AccountInfo" %>

<!DOCTYPE html>
<html>

<body>
<%
	request.setCharacterEncoding("UTF-8");

	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String identity = accountInfo.getIdentity();
	System.out.println("isManager: identity:" + identity);
	
	if (!identity.equals("manager")) {
%>
	<script>
		alert("관리자 계정이 아닙니다.");
		history.back();
	</script>
<%
	}
	
%>
</body>
</html>