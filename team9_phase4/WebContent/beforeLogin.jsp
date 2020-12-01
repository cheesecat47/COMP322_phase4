<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>

<body>
	<div class="text-center mt-4">
	    <form action="afterLogin.jsp" class="form-signin" method="POST">
	        <h2 class="form-signin-heading">knuMovieDB</h2>
	        <label for="inputId" class="sr-only">ID</label>
	        <input type="text" id="inputId" name="id" class="form-control" placeholder="ID"
	               required autofocus>
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="password" id="inputPassword" name="pw" class="form-control"
	               placeholder="Password" required>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	    </form>
	    <a href="signUp.jsp" class="btn btn-lg btn-block join-btn">회원가입</a>
	    <hr class="hr-light mb-3 mt-4">
	    <div class="inline-ul text-center">
	
	    </div>
	</div>
</body>
</html>