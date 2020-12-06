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
	        	<button id="searchBtn" class="btn btn-primary col-sm-2 mb-2">검색</button>
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
			var form = document.videoTitleSearchForm;
            var title = form.title.value;
            
            var data = { "title": getParam("title") || title };
            console.log("data: ", data);
			
			let table = $('#datatables').DataTable({
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
			
			
			$("searchBtn").on("click", function () {
				table.ajax.reload();
			})
		});
	</script>
</body>
</html>