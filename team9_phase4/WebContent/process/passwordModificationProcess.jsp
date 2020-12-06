<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String id = accountInfo.getId();

	String account_pw = request.getParameter("pw");
	String checkPw = request.getParameter("checkPw");
	String new_pw = request.getParameter("new_pw");
	String new_pw2 = request.getParameter("new_pw2");

	if (!account_pw.equals(checkPw)) {
        System.out.println("비밀번호 확인이 일치하지 않습니다.");
        return;
    }
	
	if (!new_pw.equals(new_pw2)) {
        System.out.println("비밀 번호가 다릅니다.");
        return;
    }
	accountInfo.setPw(new_pw);
	
	ResultSet rs = null;
	DB db = new DB();

	try {
		String sql = "update account set account_pw = '" + new_pw
                + "' where account_id = '" + id + "'";
		
		db.connectToDB();
		db.executeUpdate(sql);
		
		System.out.println("비밀 번호 수정이 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("비밀 번호 수정 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();        
		session.setAttribute("accountInfo", accountInfo);
    }
%>
