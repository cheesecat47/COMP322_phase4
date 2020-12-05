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
	
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	
	try {
		String id = accountInfo.getId();
		System.out.println("getMyEvaluation: id:" + id);
		
		String sql = "select w.account_id, m.movie_title, r.rating_score, r.rating_description" +
                " from movie m, rating r, write_rate w" +
                " where m.movie_register_no = w.movie_register_no and r.rating_no = w.rating_no";
		
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
        	String rs1 = rs.getString(1);
            String rs2 = rs.getString(2);
            float rs3 = rs.getFloat(3);
            String rs4 = rs.getString(4);
            /* System.out.printf("평가자: %s / 제목: %s / 평점: %f / 내용: %s\n", rs1, rs2, rs3, rs4); */
            rs_row.put("account_id", rs1);
            rs_row.put("movie_title", rs2);
            rs_row.put("rating_score", rs3);
            rs_row.put("rating_description", rs4);
            rs_data.add(rs_row);
        }
        System.out.println();
        System.out.println(rowCount + "개의 평가 내역 검색이 완료되었습니다.");
        System.out.println();
                
        data.put("data", rs_data);
        response.setContentType("application/json");
        System.out.println("getMyEvaluation: data: " + data);
        out.print(data.toJSONString());
        
	} catch (SQLException e) {
		System.out.println("getMyEvaluation: e: " + e);
		e.printStackTrace();
    } finally {
        db.closeConnDB();
    }
%>

