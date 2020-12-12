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
							<th>에피소드 번호</th>
							<th>에피소드 이름</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div class="text-center mt-4">
		<button onclick="location='changeEpisodeInfoDetail.jsp'" style="width:24%" class="btn btn-outline-secondary">에피소드 정보 수정</button>
	
		<button onclick="location='deleteEpisode.jsp'" style="width:24%" class="btn btn-outline-secondary">에피소드 삭제</button>
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
					url: './process/~.jsp?register_no=' + getParam('register_no'),
				},
				columns: [
					{ data: "episode_no" },
					{ data: "episode_name" }
				]
			});
		});
	</script>
</body>
</html>