<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String register_no = request.getParameter("register_no");

	ResultSet rs = null;
	DB db = new DB();

	String version_country = request.getParameter("version_country");
	String version_title = request.getParameter("version_title");

	/* try {	
		String sql = "insert into movie values (" 
                + this_movie_id + ", '" + movie_title + "', '"
                + movie_type + "', " + movie_runtime
                + ", TO_DATE('" + movie_start_year + "', 'yyyy-mm-dd'))";
		System.out.println("changeMovieInfoDetailProcess: sql: " + sql);
		
		db.connectToDB();
		db.executeUpdate(sql);
		
		sql = "insert into category values ('" + genre_name +
                "', " + this_movie_id + ")";
        System.out.println("changeMovieInfoDetailProcess: sql: " + sql);
        
        db.executeUpdate(sql);
		
        sql = "insert into version values (" + max_version_no +
                ", '" + version_country +
                "', '" + version_title +
                "', " + this_movie_id + ")";
        System.out.println("changeMovieInfoDetailProcess: sql: " + sql);

        db.executeUpdate(sql);
        
        if (movie_type.equals("TV Series") && !episode_name.equals("")) {
            sql = "insert into episode values (" + max_episode_no +
                    ", '" + episode_name +
                    "', " + this_movie_id + ")";
            System.out.println("changeMovieInfoDetailProcess: sql: " + sql);

            db.executeUpdate(sql);
        }
        
        System.out.println("changeMovieInfoDetailProcess: 영상물 등록이 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
    } finally {
        db.closeConnDB();
        response.sendRedirect("../videoInfoCorrection.jsp");
    } */
%>

