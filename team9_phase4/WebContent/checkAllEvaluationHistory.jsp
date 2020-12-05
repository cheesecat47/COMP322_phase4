<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<%@include file="./include/header.jsp"%>
<body>
	<%@include file="./include/isManager.jsp"%>
	<%@include file="./include/afterLogin.jsp"%>
	<%@include file="./include/evaluationRelatedFunctions.jsp"%>
	<br>
	
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 mx-auto">
				<table id="datatables" class="display">
					<thead>
						<tr>
							<th>평가자</th>
							<th>영상물 제목</th>
							<th>평점</th>
							<th>평가 내역</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<br>
	<div id = "footer">
		<%@include file="./include/registrationNumberSearch.jsp"%>
	</div>
	
	<script type="text/javascript">
		$(document).ready( function () {
			$('#datatables').DataTable({
				//serverSide: true,
				stateSave: true,
				searching: false,
				info: false,
				ajax: {
					url: './process/getAllEvaluation.jsp'
				},
				columns: [
					{ data: "account_id" },
					{ data: "movie_title" },
					{ data: "rating_score" },
					{ data: "rating_description" }
				]
			});
		});
	</script>
</body>
</html>