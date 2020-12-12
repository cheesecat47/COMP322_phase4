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
			
			<div class="text-center mt-4">
				<button onclick="onClickHandler('changeVersionInfoDetai')" style="width:24%" class="btn btn-outline-secondary">버전 정보 수정</button>
			
				<button onclick="onClickHandler('deleteVersion')" style="width:24%" class="btn btn-outline-secondary">버전 삭제</button>
			</div>
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
	
	function getCheckedRadio() {
		let radio = document.getElementsByName('version_no');
		for(let i = 0; i < radio.length; i++) {
			//console.log('i: ', i, radio[i]);
			if(radio[i].checked == true) {
				return radio[i].value;
			}
		}
	}
	
	function onClickHandler(str) {
		let register_no = getParam('register_no');
		let version_no = getCheckedRadio();
		console.log('version_no: ', version_no);
		
		switch(str) {
			case "changeVersionInfoDetail":
				location.href = 'changeVersionInfoDetail.jsp?version_no=' + version_no;
				break;
			case "deleteVersion":
				location.href = 'deleteVersion.jsp?version_no=' + version_no;
				break;
		}
	}
	
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
				{ data: 'version_identification_no',
					render: function(data, type, row){
						data = '<input type="radio" name="version_no" value="' + data + '" />  ' + data;
						return data;
					}},
				{ data: "version_country" },
				{ data: "version_name" },
				{ data: "movie_register_no" }
			]
		});
	});
	</script>
</body>
</html>