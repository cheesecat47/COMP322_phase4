<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String version_no = request.getParameter("version_no");

	ResultSet rs = null;
	DB db = new DB();

	String version_country = request.getParameter("version_country");
	String version_name = request.getParameter("version_name");

	ArrayList<String> change_list = new ArrayList<>();
	if (!version_country.equals("")) {
        change_list.add("version_country='" + version_country + "'");
    }
    if (!version_name.equals("")) {
        change_list.add("version_name='" + version_name + "'");
    }
    
	try {	
		String sql = "update version set ";
        sql += String.join(", ", change_list);
        sql += " where version_identification_no=" + version_no;
		System.out.println("changeVersionInfoDetailProcess: sql: " + sql);
		
		db.connectToDB();
		db.executeUpdate(sql);
        
        System.out.println("changeVersionInfoDetailProcess: 버전 수정이 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
    } finally {
        db.closeConnDB();
        response.sendRedirect("../videoInfoCorrection.jsp");
    }
%>

