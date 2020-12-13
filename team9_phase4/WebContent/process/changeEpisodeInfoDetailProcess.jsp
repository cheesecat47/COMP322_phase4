<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String episode_no = request.getParameter("episode_no");

	ResultSet rs = null;
	DB db = new DB();

	String episode_name = request.getParameter("episode_name");
    
	if (!episode_name.equals("")) {
		try {	
			String sql = "update episode set episode_name='" + episode_name + "'" +
	                " where episode_no=" + episode_no;
			System.out.println("changeEpisodeInfoDetailProcess: sql: " + sql);
			
			db.connectToDB();
			db.executeUpdate(sql);
	        
	        System.out.println("changeEpisodeInfoDetailProcess: 에피소드 수정이 완료되었습니다.");
	        db.commit();
	    } catch (SQLException e) {
	        db.rollback();
	        e.printStackTrace();
	    } finally {
	        db.closeConnDB();
	        response.sendRedirect("../videoInfoCorrection.jsp");
	    }
	}
%>

