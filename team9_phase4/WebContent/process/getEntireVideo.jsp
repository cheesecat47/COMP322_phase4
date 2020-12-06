<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration"%>

<%@ page import="org.json.simple.*"%>


<%
	Enumeration params = request.getParameterNames();

	ResultSet rs = null;
	DB db = new DB();
	JSONObject data = new JSONObject();
	JSONArray rs_data = new JSONArray();
	
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	
	try {
		String id = accountInfo.getId();
		System.out.println("getEntireVideo: id:" + id);
		
		String sql = "select movie_register_no, movie_title from movie" +
                " where movie_register_no not in (" +
                " select movie_register_no from write_rate" +
                " where account_id = '" + id + "'" +
                ") order by movie_register_no";
		
		db.connectToDB();
        rs = db.executeQuery(sql);
	    
        // https://wookoa.tistory.com/111
        rs.last();
        int rowCount = rs.getRow();
        if (rowCount == 0){
            System.out.println("검색된 영상물이 없습니다.");
            System.out.println();
            return;
        }
        rs.beforeFirst();

        while (rs.next()) {
        	JSONObject rs_row = new JSONObject();
            int rs1 = rs.getInt(1);
            String rs2 = rs.getString(2);
            //System.out.printf("등록번호: %d / 제목: %s\n", rs1, rs2);
            rs_row.put("movie_register_no", rs1);
            rs_row.put("movie_title", rs2);
            rs_data.add(rs_row);
        }
        System.out.println();
        System.out.println(rowCount + "개의 영상물 검색이 완료되었습니다.");
        System.out.println();
                
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

