<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String account_id = request.getParameter("id");
	String account_pw = request.getParameter("pw");
	String checkPw = request.getParameter("checkPw");
	String account_name = request.getParameter("name");
	String account_bday = request.getParameter("bday");
	String account_sex = request.getParameter("sex");
	String account_address = request.getParameter("address");
	String account_phone = request.getParameter("phone");
	String account_job = request.getParameter("job");

	CheckFormats chk = new CheckFormats();
	
	// 필수 항목 검사
    if (account_id.equals("") || account_pw.equals("")
            || account_name.equals("") || account_phone.equals("")) {
        System.out.println("필수 항목을 입력하지 않았습니다.");
        return;
    }
	
 	// 생년월일 포맷 검사
    if (!chk.checkDateFormat(account_bday)) {
        System.out.println("생년월일을 형식에 맞게 입력해주세요.");
        /* return; */
    }
 	
 	// 전화번호 포맷 검사
    if (!chk.checkPhoneFormat(account_phone)) {
        System.out.println("전화번호를 형식에 맞게 입력해주세요.");
        return;
    }

	System.out.println("아이디: " + account_id);
    System.out.println("비밀번호: " + account_pw);
    System.out.println("이름: " + account_name);
    System.out.println("생년월일: " + account_bday);
    System.out.println("성별: " + account_sex);
    System.out.println("주소: " + account_address);
    System.out.println("전화번호: " + account_phone);
    System.out.println("직업: " + account_job);
	
	ResultSet rs = null;
	DB db = new DB();

	try {	
		String sql = "insert into account values ('" + account_id
                + "', '" + account_pw + "', '" + account_name
                + "', TO_DATE('" + account_bday + "', 'yyyy-mm-dd'), '"
                + account_sex + "', '" + account_address + "', '"
                + account_phone + "', 'customer', '" + account_job
                + "', 'Basic')";
		
		db.connectToDB();
		db.executeUpdate(sql);
		
		System.out.println("회원 가입이 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
    } finally {
        db.closeConnDB();
        response.sendRedirect("../beforeLogin.jsp");
    }
%>

