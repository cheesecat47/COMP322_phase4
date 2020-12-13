<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	System.out.println("deleteVersionProcess");
	request.setCharacterEncoding("utf-8");
	String version_no = request.getParameter("version_no");
	
	DB db = new DB();

	try {
        String sql = "delete from version where version_identification_no=" + version_no;
        System.out.println("deleteVersionProcess: sql: " + sql);
        
        db.connectToDB();
        db.executeUpdate(sql);

        System.out.println("deleteVersionProcess: 버전 삭제가 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("deleteVersionProcess: 버전 삭제 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();        
        response.sendRedirect("../videoInfoCorrection.jsp");
    }
%>
