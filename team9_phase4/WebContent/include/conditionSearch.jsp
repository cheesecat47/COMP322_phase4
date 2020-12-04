<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<body>
	<div class="container">
		<form action="./videoConditionSearch.jsp" method="POST" name="conditionSearchForm" enctype="multipart/form-data" >
			<div class="form-group row">
			   <label for="movie_type" class="col-sm-3 col-form-label">영상물 종류</label>
		       <div class="col-sm-9">
			       	<select name="type" class="form-control" id="movie_type">
		                <option value="Movie">Movie</option>
		                <option value="TV Series">TV Series</option>
		                <option value="KnuMovieDB Original">KnuMovieDB Original</option>
	            	</select>
		       </div>
			</div>
			
			<div class="form-group row">
			   <label for="genre_name" class="col-sm-3 col-form-label">영상물 장르</label>
			      <div class="col-sm-9">
			      	<select name="genre" class="form-control" id="genre_name">
		                <option value="Action">Action</option>
		                <option value="Comedy">Comedy</option>
		                <option value="Romance">Romance</option>
		                <option value="Drama">Drama</option>
		                <option value="Thriller">Thriller</option>
	            	</select>
			      </div>
			</div>
			  
			<div class="form-group row">
			   <label for="version_country" class="col-sm-3 col-form-label">상영 국가</label>
			      <div class="col-sm-9">
			      	<select name="country" class="form-control" id="version_country">
		                <option value="KR">KR</option>
		                <option value="US">US</option>
		                <option value="IT">IT</option>
	            	</select>
			      </div>
			</div>
			<span style="float:right;">
	            <button type="submit" class="btn btn-primary mb-2">해당 조건 검색</button>
	        </span>
		</form>
	</div>
</body>
</html>