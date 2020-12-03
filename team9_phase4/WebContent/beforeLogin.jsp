<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<div class="text-center col-md-4" style="margin:auto; margin-top:100px;">
	<h2 class="form-signin-heading">knuMovieDB</h2>
	    <!-- <form action="checkTheEntireVideo.jsp" class="form-signin" method="POST">  -->
	    <form action="./process/loginProcess.jsp" class="form-signin" method="POST">
	        <label for="inputId" class="sr-only">ID</label>
	        <input type="text" id="inputId" name="id" class="form-control" placeholder="ID"
	               required autofocus>
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="password" id="inputPassword" name="pw" class="form-control"
	               placeholder="Password" required>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	    </form>
	    <a href="signUp.jsp" class="btn btn-lg btn-block btn-outline-secondary">회원가입</a>
	</div>
</body>
</html>