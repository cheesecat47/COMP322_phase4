<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<style>
	#footer {

    position:absolute;

    bottom:0;

    width:100%;

    height:70px;   
}
</style>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/videoRelatedFunctions.jsp"%>
	
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-10 mx-auto">
				<table id="datatables" class="display">
					<thead>
						<tr>
							<th>등록 번호</th>
							<th>제목</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

	<div id = "footer">
		<%@include file="./include/registrationNumberSearch.jsp"%>
	</div>
	
	<script type="text/javascript">
		$(document).ready( function () {
			$('#datatables').DataTable({
				//serverSide: true,
				stateSave: true,
				ajax: {
					url: './process/getEntireVideo.jsp'
				},
				columns: [
					{ data: "movie_register_no" },
					{ data: "movie_title" }
				]
			});
		});
	</script>
</body>
</html>