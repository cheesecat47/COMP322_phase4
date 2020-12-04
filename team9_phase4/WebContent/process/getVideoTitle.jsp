<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="java.sql.*" %>

<%@ page import="org.json.simple.*"%>


<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String id = accountInfo.getId();
	
	ResultSet rs = null;
	DB db = new DB();
	JSONObject data = new JSONObject();

	try {
		System.out.println("getVideoTitle: id:" + id + " / title: " + title);
		
		String sql = "select movie_register_no, movie_title from movie" +
                " where movie_title like '%" + title + "%'" +
                " and movie_register_no not in (" +
                " select movie_register_no from write_rate" +
                " where account_id = '" + id + "'" +
                ") order by movie_register_no";
		
		db.connectToDB();
        rs = db.executeQuery(sql);
	    
        rs.last();
        int rowCount = rs.getRow();
        if (rowCount == 0){
            System.out.println("검색된 영상물이 없습니다.");
            System.out.println();
            return;
        }
        rs.beforeFirst();

        JSONArray rs_data = new JSONArray();
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
                
        data.put("data", rs_data);
        response.setContentType("application/json");
        System.out.println("getVideoTitle: data: " + data);
        out.print(data.toJSONString());
        
	} catch (SQLException e) {
		System.out.println("getVideoTitle: e: " + e);
		session.invalidate();
		e.printStackTrace();
    } finally {
        db.closeConnDB();
    }
%>

