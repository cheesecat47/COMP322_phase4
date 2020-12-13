<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");

	ResultSet rs = null;
	DB db = new DB();
	CheckFormats chk = new CheckFormats();

	ArrayList<String> change_list = new ArrayList<>();
	String movie_title = request.getParameter("movie_title");
	String movie_type = request.getParameter("movie_type");
	String movie_runtime = request.getParameter("movie_runtime");
	String movie_start_year = request.getParameter("movie_start_year");
	
	String register_no = request.getParameter("register_no");
	
 	// 상영 년도 포맷 검사
    if (!movie_start_year.equals("") && !chk.checkDateFormat(movie_start_year)) {
        System.out.println("changeMovieInfoDetailProcess: 상영 년도를 형식에 맞게 입력해주세요.");
        response.sendRedirect("../videoInfoCorrection.jsp");
        return;
    }
 	
    if (!movie_title.equals("")) {
        change_list.add("movie_title='" + movie_title + "'");
    }
    if (!movie_type.equals("")) {
        change_list.add("movie_type='" + movie_type + "'");
    }
    if (!movie_runtime.equals("")) {
        change_list.add("movie_runtime=" + movie_runtime + "");
    }
    if (!movie_start_year.equals("")) {
        change_list.add("movie_start_year=TO_DATE('" + movie_start_year + "', 'yyyy-mm-dd')");
    }

	try {	
		String sql = "update movie set ";
        sql += String.join(", ", change_list);
        sql += " where movie_register_no=" + register_no;
		System.out.println("changeMovieInfoDetailProcess: sql: " + sql);
		
		db.connectToDB();
		db.executeUpdate(sql);
		
        System.out.println("changeMovieInfoDetailProcess: 영상물 수정이 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.out.println("changeMovieInfoDetailProcess: 영상물 수정 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();
        response.sendRedirect("../videoInfoCorrection.jsp");
    }
%>

