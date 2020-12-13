<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="java.sql.*" %>

<%
	ResultSet rs = null;
	DB db = new DB();
	AccountInfo accountInfo = null;

	try {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("loginProcess: id:" + id + " / pw: " + pw);
		
		String sql = "select * from account "
                + "where account_id = '" + id
                + "' and account_pw = '" + pw + "'";
		
		db.connectToDB();
        rs = db.executeQuery(sql);
        if (rs.next()) {
        	System.out.println("loginProcess: rs");
            accountInfo = new AccountInfo(true,
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getString(10)
            );
            rs.close();
        }
	} catch (SQLException e) {
		System.out.println("loginProcess: e: " + e);
		session.invalidate();
		e.printStackTrace();
    } finally {
        db.closeConnDB();
    }
	
	if (accountInfo != null) {
		session.setAttribute("accountInfo", accountInfo);
        System.out.println("loginProcess: set Session");
        response.sendRedirect("../checkTheEntireVideo.jsp");
	} else {
		System.out.println("loginProcess: 아이디 또는 비밀번호가 틀렸습니다.");
        accountInfo = null;
		session.invalidate();
        response.sendRedirect("../beforeLogin.jsp");
	}
%>

