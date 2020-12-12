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
		<div class="row justify-content-center">
			<div class="col-12 mx-auto">
				<table id="datatables" class="display">
					<thead>
						<tr>
							<th>등록 번호</th>
							<th>영상물 제목</th>
							<th>영상물 종류</th>
							<th>상영 시간(분)</th>
							<th>상영 날짜</th>
							<th>장르</th>
							<th>평점</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div class="text-center mt-4">
		<button onclick="location='changeMovieInfoDetail.jsp'" style="width:12%" class="btn btn-outline-secondary">영상물 정보 수정</button>
	
		<button onclick="location='deleteMovie.jsp'" style="width:12%" class="btn btn-outline-secondary">영상물 삭제</button>
		
		<button onclick="location='changeVersionInfo.jsp'" style="width:12%" class="btn btn-outline-secondary">버전 정보 수정</button>
		
		<button onclick="location='changeEpisodeInfo.jsp'" style="width:12%" class="btn btn-outline-secondary">에피소드 수정</button>
	</div>
	
	<script type="text/javascript">
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
			let table = $('#datatables').DataTable({
				//serverSide: true,
				stateSave: true,
				searching: false,
				paging: false,
				info: false,
				ajax: {
					url: './process/getVideoDetailsProcess.jsp?register_no=' + getParam('register_no'),
				},
				columns: [
					{ data: "movie_register_no" },
					{ data: "movie_title" },
					{ data: "movie_type" },
					{ data: "movie_runtime" },
					{ data: "movie_start_year" },
					{ data: "genre_name" },
					{ data: "avg_rate" },
				]
			});
		});
	</script>
</body>
</html>