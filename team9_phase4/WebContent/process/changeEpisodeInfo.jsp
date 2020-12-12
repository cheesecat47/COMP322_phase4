<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");

	ResultSet rs = null;
	DB db = new DB();
	CheckFormats chk = new CheckFormats();

	
	int this_movie_id = db.getMaxIdNo("movie_register_no", "movie") + 1;
	String movie_title = request.getParameter("movie_title");
	String movie_type = request.getParameter("movie_type");
	String movie_runtime = request.getParameter("movie_runtime");
	String movie_start_year = request.getParameter("movie_start_year");
	
	String genre_name = request.getParameter("genre_name");
	
	int max_version_no = db.getMaxIdNo("version_identification_no", "version") + 1;
	String version_country = request.getParameter("version_country");
	String version_title = request.getParameter("version_title");

	int max_episode_no = db.getMaxIdNo("episode_no", "episode") + 1;
	String episode_name = request.getParameter("episode_name");

	
	// 필수 항목 검사
    if (movie_title.equals("") || movie_type.equals("")
            || movie_runtime.equals("") || movie_start_year.equals("") || genre_name.equals("")) {
        System.out.println("changeMovieInfoDetailProcess: 필수 항목을 입력하지 않았습니다.");
        return;
    }
	
 	// 상영 년도 포맷 검사
    if (!chk.checkDateFormat(movie_start_year)) {
        System.out.println("changeMovieInfoDetailProcess: 상영 년도를 형식에 맞게 입력해주세요.");
        return;
    }


	try {	
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
    }
%>

