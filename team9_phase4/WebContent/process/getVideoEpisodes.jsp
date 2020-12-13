<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration"%>

<%@ page import="org.json.simple.*"%>


<%
	ResultSet rs = null;
	DB db = new DB();
	JSONObject data = new JSONObject();
	JSONArray rs_data = new JSONArray();
	
	request.setCharacterEncoding("utf-8");
	String register_no = request.getParameter("register_no");
	
	try {
		String sql = "select episode_no, episode_name" +
                " from episode where movie_register_no=" + register_no +
                " order by episode_no";
		
		db.connectToDB();
        rs = db.executeQuery(sql);

        while (rs.next()) {
        	JSONObject rs_row = new JSONObject();
            int rs1 = rs.getInt(1);
            String rs2 = rs.getString(2);
            rs_row.put("episode_no", rs1);
            rs_row.put("episode_name", rs2);
            rs_data.add(rs_row);
        }
        rs.close();
                
	} catch (SQLException e) {
		System.out.println("getVideoEpisodes: e: " + e);
		e.printStackTrace();
    } finally {
        db.closeConnDB();
        data.put("data", rs_data);
        response.setContentType("application/json");
        System.out.println("getVideoEpisodes: data: " + data);
        out.print(data.toJSONString());
    }
%>

