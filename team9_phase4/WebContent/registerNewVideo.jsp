<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/isManager.jsp"%>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/administratorFunctions.jsp"%>
	
	<br>
	<div class="container">
		<form action="./process/registerNewVideoProcess.jsp" method="POST" name="registerNewVideoForm">
		
				<div class="form-group row">
		            <label class="col-sm-3 col-form-label">새 영상물 정보 입력</label>
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
				
				<br>
				<div class="form-group row">
		            <label class="col-sm-3 col-form-label">새 버전 정보 입력</label>
		        </div>
		        
				<div class="form-group row">
				   <label class="col-sm-3 col-form-label">상영 국가: </label>
				      <div class="col-sm-9">
				      	<select name="version_country" class="form-control">
			                <option value="KR">KR</option>
			                <option value="US">US</option>
			                <option value="IT">IT</option>
		            	</select>
				      </div>
		        </div>
		        
				<div class="form-group row">
		            <label class="col-sm-3 col-form-label">버전 이름: </label>
		            <div class="col-sm-9">
		            	<input required name="version_title" type="text" class="form-control" placeholder="버전 이름">
		            </div>
		        </div>
		        
		        <br>
		        <div id="episode_info_div">
					<div class="form-group row">
			            <label class="col-sm-3 col-form-label">새 에피소드 정보 입력</label>
			        </div>
			        
			        <div class="form-group row">
			            <label class="col-sm-3 col-form-label">에피소드 이름: </label>
			            <div class="col-sm-9">
			            	<input name="episode_name" type="text" class="form-control" placeholder="에피소드 이름">
			            </div>
			        </div>
		        </div>
		        
		        <div class="form-group row justify-content-end">
		        	<button type="registerBtn" class="btn btn-primary mb-2">새 영상물 등록</button>
		        </div>
			</form>
		</div>
		
	<script>
		let movie_type_select;
		
		function checkMovieType() {
			if (movie_type_select.value == "TV Series"){
				$("#episode_info_div").show();
			} else {
				$("#episode_info_div").hide();
			}
		}
		
		$(document).ready( function () {
			movie_type_select = document.getElementById("movie_type_select");
			checkMovieType()
			
			movie_type_select.addEventListener("change", function() {
				checkMovieType();
			})
		});
	</script>
</body>
</html>