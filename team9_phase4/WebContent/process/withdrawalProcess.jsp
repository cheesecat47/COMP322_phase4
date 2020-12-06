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
	
	if (account_pw.equals("") || !accountInfo.getPw().equals(account_pw)) {
        System.out.println("탈퇴가 취소되었습니다.");
        return;
    }	
	
	ResultSet rs = null;
	DB db = new DB();
	
	// 본인이 관리자이고 다른 관리자가 없으면 탈퇴 안됨.
    if (accountInfo.getIdentity().equals("manager")){
        int manager_count = 0;
        try {
            String sql = "select count(*) from account where account_identity='manager'";
            db.connectToDB();
            rs = db.executeQuery(sql);
            if (rs.next()) {
                manager_count = rs.getInt(1);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnDB();
        }

        if (manager_count < 2) {
            System.out.println("관리자가 본인밖에 없습니다. 탈퇴가 취소되었습니다.");
            return;
        }
    }

	try {
		String sql = "delete from write_rate where account_id = '"
                + accountInfo.getId() + "'";
		
		db.connectToDB();
		db.executeUpdate(sql);
		
		sql = "delete from account where account_id = '"
                + accountInfo.getId() + "'";
        db.executeUpdate(sql);
		
        System.out.println("회원 탈퇴가 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("회원 탈퇴 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();        
        session.invalidate();
        response.sendRedirect("../beforeLogin.jsp");
    }
%>
