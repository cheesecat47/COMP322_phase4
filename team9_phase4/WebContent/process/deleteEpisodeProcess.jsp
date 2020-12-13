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
	
	DB db = new DB();

	try {
        String sql = "delete from episode where episode_no=" + episode_no;
        System.out.println("deleteEpisodeProcess: sql: " + sql);
        
        db.connectToDB();
        db.executeUpdate(sql);

        System.out.println("deleteEpisodeProcess: 에피소드 삭제가 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("deleteEpisodeProcess: 에피소드 삭제 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();        
        response.sendRedirect("../videoInfoCorrection.jsp");
    }
%>
