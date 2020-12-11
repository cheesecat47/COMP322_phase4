<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="java.sql.*" %>

<%@ page import="org.json.simple.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String type = request.getParameter("type");
	String genre = request.getParameter("genre");
	String country = request.getParameter("country");
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String id = accountInfo.getId();

	ResultSet rs = null;
	DB db = new DB();
	JSONObject data = new JSONObject();
	JSONArray rs_data = new JSONArray();

	try {
		System.out.println("getConditionSearchVideo: id:" + id + " / type: " + type + " / genre: " + genre + " / country: " + country);
		
		String sql = "select v.version_identification_no, v.version_country, v.version_name from movie m, category c, version v" +
                " where m.movie_register_no = c.movie_register_no" +
                " and m.movie_register_no = v.movie_register_no" +
				" and m.movie_type = '" + type + "'" +
				" and c.genre_name = '" + genre + "'" +
				" and v.version_country = '" + country + "'" +
				" and m.movie_register_no not in (" +
                " select movie_register_no from write_rate" +
                " where account_id = '" + id + "'" +
                ") order by m.movie_register_no";
		
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
            String rs3 = rs.getString(3);
            //System.out.printf("버전 번호: %d / 국가: %s / 버전명: %s\n", rs1, rs2, rs3);
            
            rs_row.put("version_identification_no", rs1);
            rs_row.put("version_country", rs2);
            rs_row.put("version_name", rs3);
            rs_data.add(rs_row);
        }
        System.out.println();
        System.out.println(rowCount + "개의 영상물 검색이 완료되었습니다.");
        System.out.println();

	} catch (SQLException e) {
		System.out.println("getConditionSearchVideo: e: " + e);
		session.invalidate();
		e.printStackTrace();
    } finally {
        db.closeConnDB();
        data.put("data", rs_data);
        response.setContentType("application/json");
        System.out.println("getConditionSearchVideo: data: " + data);
        out.print(data.toJSONString());
    }
%>
