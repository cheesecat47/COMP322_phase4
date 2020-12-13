<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="java.sql.*" %>

<%@ page import="org.json.simple.*"%>


<%
	ResultSet rs = null;
	DB db = new DB();
	JSONObject data = new JSONObject();
	JSONArray rs_data = new JSONArray();
	
	request.setCharacterEncoding("utf-8");
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String id = accountInfo.getId();
	
	String version_identification_no = request.getParameter("register_no");
	
	
	try {
		String sql = "select movie_register_no" +
                " FROM version" +
                " WHERE version_identification_no = '" + version_identification_no + "'";
		db.connectToDB();
        rs = db.executeQuery(sql);
        String register_no = "";
        if (rs.next()) {
        	register_no = Integer.toString(rs.getInt(1));
        }
		
		sql = "select m.movie_register_no, m.movie_title, m.movie_type, m.movie_runtime, m.movie_start_year, c.genre_name" +
                " FROM movie m, category c" +
                " WHERE c.movie_register_no = m.movie_register_no" +
                " and m.movie_register_no = '" + register_no + "'";
		
		db.connectToDB();
        rs = db.executeQuery(sql);

        JSONObject rs_row = new JSONObject();
        if (rs.next()) {
        	int rs1 = rs.getInt(1);
            String rs2 = rs.getString(2);
            String rs3 = rs.getString(3);
            String rs4 = rs.getString(4);
            String rs5 = rs.getString(5);
            String rs6 = rs.getString(6);
            rs_row.put("movie_register_no", rs1);
            rs_row.put("movie_title", rs2);
            rs_row.put("movie_type", rs3);
            rs_row.put("movie_runtime", rs4);
            rs_row.put("movie_start_year", rs5);
            rs_row.put("genre_name", rs6);
        }
        
        sql = "select avg(r.rating_score) as avg_rate" +
                " FROM write_rate w, rating r" +
                " WHERE w.rating_no = r.rating_no" +
                " and w.movie_register_no = '" + register_no + "'" +
                " group by w.movie_register_no";
        rs = db.executeQuery(sql);
        
        if (rs.next()) {
            String rs1 = rs.getString(1);
            rs_row.put("avg_rate", rs1);
        } else {
        	rs_row.put("avg_rate", "No rate");
        }
        rs.close();
        
        rs_data.add(rs_row);
                
	} catch (SQLException e) {
		System.out.println("getVideoConditionSearchDetailsProcess: e: " + e);
		e.printStackTrace();
    } finally {
        db.closeConnDB();
        data.put("data", rs_data);
        response.setContentType("application/json");
        System.out.println("getVideoConditionSearchDetailsProcess: data: " + data);
        out.print(data.toJSONString());
    }
%>

