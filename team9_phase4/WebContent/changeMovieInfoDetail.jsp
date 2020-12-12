<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/administratorFunctions.jsp"%>
	<br>
	<div class="container">
		<form action="./process/~.jsp" method="POST" name="changeMovieInfoForm">
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">영상물 정보 수정</label>
	        </div>
	        
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">영상물 제목: </label>
	            <div class="col-sm-9">
	            	<input required name="movie_title" type="text" class="form-control" placeholder="영상물 제목">
	            </div>
	        </div>
	        
			<div class="form-group row">
			   <label class="col-sm-3 col-form-label">영상물 종류: </label>
		       <div class="col-sm-9">
			       	<select id="movie_type_select" name="movie_type" class="form-control">
		                <option value="Movie">Movie</option>
		                <option value="TV Series">TV Series</option>
		                <option value="KnuMovieDB Original">KnuMovieDB Original</option>
	            	</select>
		       </div>
			</div>
			
			<div class="form-group row">
	            <label class="col-sm-3 col-form-label">상영 시간: </label>
	            <div class="col-sm-9">
	            	<input required name="movie_runtime" type="text" class="form-control" placeholder="단위: 분">
	            </div>
	        </div>
	        
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">상영 년도: </label>
	            <div class="col-sm-9">
	            	<input required name="movie_start_year" type="text" class="form-control" placeholder="yyyy-mm-dd">
	            </div>
	        </div>
	        
			<div class="form-group row">
			   <label class="col-sm-3 col-form-label">영상물 장르: </label>
			      <div class="col-sm-9">
			      	<select name="genre_name" class="form-control">
		                <option value="Action">Action</option>
		                <option value="Comedy">Comedy</option>
		                <option value="Romance">Romance</option>
		                <option value="Drama">Drama</option>
		                <option value="Thriller">Thriller</option>
	            	</select>
			      </div>
			</div>
			
	        <div class="form-group row justify-content-end">
	        	<button type="editBtn" class="btn btn-primary mb-2">영상물 정보 수정</button>
	        </div>
		</form>
	</div>
</body>
</html>