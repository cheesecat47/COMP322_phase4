<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/videoRelatedFunctions.jsp"%>
	
	<br>
	<div class="container">
	
		<%-- <%@include file="./include/conditionSearch.jsp"%> --%>
		<form name="videoConditionSearchForm">
			<div class="form-group row">
			   <label class="col-sm-3 col-form-label">영상물 종류: </label>
		       <div class="col-sm-9">
			       	<select name="type" class="form-control">
		                <option value="Movie">Movie</option>
		                <option value="TV Series">TV Series</option>
		                <option value="KnuMovieDB Original">KnuMovieDB Original</option>
	            	</select>
		       </div>
			</div>
			
			<div class="form-group row">
			   <label class="col-sm-3 col-form-label">영상물 장르: </label>
			      <div class="col-sm-9">
			      	<select name="genre" class="form-control">
		                <option value="Action">Action</option>
		                <option value="Comedy">Comedy</option>
		                <option value="Romance">Romance</option>
		                <option value="Drama">Drama</option>
		                <option value="Thriller">Thriller</option>
	            	</select>
			      </div>
			</div>
			<div class="form-group row">
			   <label class="col-sm-3 col-form-label">상영 국가: </label>
			      <div class="col-sm-9">
			      	<select name="country" class="form-control">
		                <option value="KR">KR</option>
		                <option value="US">US</option>
		                <option value="IT">IT</option>
	            	</select>
			      </div>
	        </div>
	        <div class="form-group row justify-content-end">
	        	<button id="searchBtn" class="btn btn-primary mb-2">해당 조건 검색</button>
	        </div>
		</form>
		
		<div class="row justify-content-center">
			<div class="col-12 w-100 mx-auto">
				<table id="datatables">
					<thead>
						<tr>
							<th>버전 등록 번호</th>
							<th>국가</th>	
							<th>버전 제목</th>
						</tr>
					</thead>
				</table>
			</div>
			<p class="justify-content-center">행을 선택하면 세부 정보를 검색합니다.</p>
		</div>
	</div>
	
	<script type="text/javascript">
		// https://electronic-moongchi.tistory.com/82
		function getParam(sname) {
			var params = location.search.substr(location.search.indexOf("?") + 1);
			var sval = "";
			params = params.split("&");
			for (var i = 0; i < params.length; i++) {
				temp = params[i].split("=");
				if ([temp[0]] == sname) { sval = temp[1]; }
			}
			return sval;
		};
		$(document).ready( function () {
			var form = document.videoConditionSearchForm;
			var type = form.type.value;
			var genre = form.genre.value;
			var country = form.country.value;
			
			var data = { "type": getParam("type") || type, "genre": getParam("genre") || genre, "country": getParam("country") || country};
			console.log("data: ", data);
			
			let table = $('#datatables').DataTable({
				//serverSide: true,
				stateSave: true,
				searching: false,
				info: false,
				ajax: {
					url: './process/getConditionSearchVideo.jsp',
					data: data
				},
				columns: [
					{ data: "version_identification_no" },
					{ data: "version_country"},
					{ data: "version_name"},
				]
			});
			
			$('#datatables tbody').on('click', 'tr', function() {
				let data = table.row($(this).closest('tr')).data();
	            // console.log('data', data);
	            let register_no = data.version_identification_no;
	            // console.log('register_no', register_no);
	            location.href = 'checkVideoConditionSearchDetails.jsp?register_no=' + register_no;
			})
			
			$("#searchBtn").on("click", function () {
				table.ajax.reload();
			})
		});
	</script>
</body>
</html>