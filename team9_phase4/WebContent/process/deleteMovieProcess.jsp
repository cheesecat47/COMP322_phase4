<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String register_no = request.getParameter("register_no");
	
	DB db = new DB();

	try {
		ArrayList<String> batch = new ArrayList<>();
        String sql = "delete from episode where movie_register_no=" + register_no;
        batch.add(sql);

        sql = "delete from version where movie_register_no=" + register_no;
        batch.add(sql);

        sql = "delete from category where movie_register_no=" + register_no;
        batch.add(sql);

        sql = "delete from appearance where movie_register_no=" + register_no;
        batch.add(sql);

        sql = "delete from write_rate where movie_register_no=" + register_no;
        batch.add(sql);

        sql = "delete from movie where movie_register_no=" + register_no;
        batch.add(sql);

        db.connectToDB();
        db.executeBatch(batch);

        System.out.println("deleteMovieProcess: 영상물 삭제가 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("deleteMovieProcess: 영상물 삭제 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();        
        response.sendRedirect("../videoInfoCorrection.jsp");
    }
%>
