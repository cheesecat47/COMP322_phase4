<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="team9_phase4.DB" %>
<%@ page import="team9_phase4.AccountInfo" %>
<%@ page import="team9_phase4.CheckFormats" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	AccountInfo accountInfo = (AccountInfo)session.getAttribute("accountInfo");
	String id = accountInfo.getId();

	String account_pw = request.getParameter("pw");
	String checkPw = request.getParameter("checkPw");
	String account_name = request.getParameter("name");
	String account_bday = request.getParameter("bday");
	String account_sex = request.getParameter("sex");
	String account_address = request.getParameter("address");
	String account_phone = request.getParameter("phone");
	String account_job = request.getParameter("job");

	if (!account_pw.equals(checkPw)) {
        System.out.println("비밀번호 확인이 일치하지 않습니다.");
        return;
    }
	
	String sql = "update account set ";
    ArrayList<String> toBeUpdated = new ArrayList<>();
	
	CheckFormats chk = new CheckFormats();
	
	if (!account_name.equals("")) {
        toBeUpdated.add("account_name = '" + account_name + "'");
        accountInfo.setName(account_name);
    }
	
	if (!account_bday.equals("")) {
        // 생년월일 입력했는데 포맷 안 맞으면 변경 불가
        if (!chk.checkDateFormat(account_bday)) {
            System.out.println("생년월일을 형식에 맞게 입력해주세요.");
            return;
        }
        toBeUpdated.add("account_bday = TO_DATE('" + account_bday + "', 'yyyy-mm-dd')");
        accountInfo.setBday(account_bday);
    }
	
    if (!chk.checkSex(account_sex).equals("null")) {
        toBeUpdated.add("account_sex = '" + account_sex + "'");
        accountInfo.setSex(account_sex);
    }
    
    if (!account_address.equals("")) {
        toBeUpdated.add("account_address = '" + account_address + "'");
        accountInfo.setAddr(account_address);
    }
 	
    if (!account_phone.equals("")) {
        // 전화번호 입력했는데 포맷 안 맞으면 변경 불가
        if (!chk.checkPhoneFormat(account_phone)) {
            System.out.println("전화번호를 형식에 맞게 입력해주세요.");
            return;
        }
        toBeUpdated.add("account_phone = '" + account_phone + "'");
        accountInfo.setPhone(account_phone);
    }
	
    if (!account_job.equals("")) {
        toBeUpdated.add("account_job = '" + account_job + "'");
        accountInfo.setJob(account_job);
    }
    
	//  System.out.println("toBeUpdated: " + toBeUpdated);
	String toBeUpdatedStr = String.join(", ", toBeUpdated);
	//  System.out.println("toBeUpdatedStr: " + toBeUpdatedStr);
	sql += toBeUpdatedStr + " where account_id = '" + id + "'";
	/* System.out.println("sql: " + sql); */
    
	ResultSet rs = null;
	DB db = new DB();

	try {
		db.connectToDB();
		db.executeUpdate(sql);
		
		System.out.println("회원 정보 수정이 완료되었습니다.");
        db.commit();
    } catch (SQLException e) {
        db.rollback();
        e.printStackTrace();
        System.err.println("회원 정보 수정 중 오류가 발생했습니다.");
    } finally {
        db.closeConnDB();
		session.setAttribute("accountInfo", accountInfo);
    }
%>
