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
	
		<form name="videoTitleSearchForm">
	        <div class="form-group row">
	            <label class="col-sm-3 col-form-label">제목: </label>
	            <div class="col-sm-7">
	            	<input required autofocus name="title" type="text" class="form-control">
	            </div>
	        	<button onclick="getData()" class="btn btn-primary col-sm-2 mb-2">검색</button>
	        </div>
	    </form>
		
		<div class="row justify-content-center">
			<div class="col-12 mx-auto">
				<table id="datatables">
					<thead>
						<tr>
							<th>영상물 등록 번호</th>
							<th>영상물 제목</th>
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
			$('#datatables').hide();
		});
		
		function getData() {
			$('#datatables').show();
			
			var form = document.videoTitleSearchForm;
            var title = form.title.value;
            
            var data = { "title": title };
			
			$('#datatables').DataTable({
				//serverSide: true,
				stateSave: true,
				searching: false,
				info: false,
				ajax: {
					url: './process/getVideoTitle.jsp',
					data: data
				},
				columns: [
					{ data: "movie_register_no" },
					{ data: "movie_title" }
				]
			});			
		};
	</script>
</body>
</html>