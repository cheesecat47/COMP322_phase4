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
							<th>버전 번호</th>
							<th>버전 국가</th>
							<th>버전 이름</th>
							<th>영상물 등록 번호</th>
						</tr>
					</thead>
				</table>
			</div>
			<p class="justify-content-center">행을 선택하여 해당 영상물 정보를 수정합니다.</p>
		</div>
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
			info: false,
			ajax: {
				url: './process/getVideoVersions.jsp',
				data: {"register_no": getParam('register_no')}
			},
			columns: [
				{ data: "version_identification_no" },
				{ data: "version_country" },
				{ data: "version_name" },
				{ data: "movie_register_no" }
			]
		});
		
		// https://pjsprogram.tistory.com/51
		$('#datatables tbody').on('click', 'tr', function() {
			let data = table.row($(this).closest('tr')).data();
            // console.log('data', data);
            let register_no = data.movie_register_no;
            // console.log('register_no', register_no);
            location.href = 'changeVersionInfoMenu.jsp?register_no=' + register_no;
		})
	});
	</script>
</body>
</html>