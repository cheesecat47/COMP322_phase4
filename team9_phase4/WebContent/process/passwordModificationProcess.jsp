<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String id = accountInfo.getId();
	String pw = accountInfo.getPw();
	System.out.println("passwordModificationProcess: id: " + id + " / pw: " + pw);
	
	String account_pw = request.getParameter("pw");
	String new_pw = request.getParameter("new_pw");
	String new_checkPw = request.getParameter("new_checkPw");
	
	if (!account_pw.equals(pw)) {
        System.out.println("현재 비밀 번호가 틀렸습니다.");
        %>
        <script type="text/javascript">
        	console.log("현재 비밀 번호가 틀렸습니다.")
        	alert("현재 비밀 번호가 틀렸습니다.");
        </script>
        <%
        response.sendRedirect("../passwordModification.jsp");
        return;
    }
	
	if (!new_pw.equals(new_checkPw)) {
        System.out.println("새 비밀 번호 확인이 다릅니다.");
        %>
        <script type="text/javascript">
        	console.log("새 비밀 번호 확인이 다릅니다.")
        	alert("새 비밀 번호 확인이 다릅니다.");
        </script>
        <%
        response.sendRedirect("../passwordModification.jsp");
        return;
    }
	accountInfo.setPw(new_pw);
	
	ResultSet rs = null;
	DB db = new DB();

	String returnmsg = "";
	try {
		String sql = "update account set account_pw = '" + new_pw
                + "' where account_id = '" + id + "'";
		
		db.connectToDB();
		db.executeUpdate(sql);
		
		System.out.println("비밀 번호 수정이 완료되었습니다.");
		%>
        <script type="text/javascript">
        	console.log("비밀 번호 수정이 완료되었습니다.")
        	alert("비밀 번호 수정이 완료되었습니다.");
        </script>
        <%
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("비밀 번호 수정 중 오류가 발생했습니다.");
        %>
        <script type="text/javascript">
        	console.log("비밀 번호 수정 중 오류가 발생했습니다.")
        	alert("비밀 번호 수정 중 오류가 발생했습니다.");
        </script>
        <%
    } finally {
        db.closeConnDB();        
		session.setAttribute("accountInfo", accountInfo);
		response.sendRedirect("../passwordModification.jsp");
    }
%>

</body>
</html>
