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
		String sql = "select * from version where movie_register_no = " + register_no;
		
		db.connectToDB();
        rs = db.executeQuery(sql);

        while (rs.next()) {
        	JSONObject rs_row = new JSONObject();
            int rs1 = rs.getInt(1);
            String rs2 = rs.getString(2);
            String rs3 = rs.getString(3);
            int rs4 = rs.getInt(4);
            rs_row.put("version_identification_no", rs1);
            rs_row.put("version_country", rs2);
            rs_row.put("version_name", rs3);
            rs_row.put("movie_register_no", rs4);
            rs_data.add(rs_row);
        }
                
	} catch (SQLException e) {
		System.out.println("getEntireVideo: e: " + e);
		e.printStackTrace();
    } finally {
        db.closeConnDB();
        data.put("data", rs_data);
        response.setContentType("application/json");
        System.out.println("getEntireVideo: data: " + data);
        out.print(data.toJSONString());
    }
%>

