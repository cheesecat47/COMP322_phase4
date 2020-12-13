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
			
			<div class="text-center mt-4">
				<button onclick="onClickHandler('changeEpisodeInfoDetail')" class="btn btn-outline-secondary">에피소드 정보 수정</button>
			
				<button onclick="onClickHandler('deleteEpisode')" class="btn btn-outline-secondary">에피소드 삭제</button>
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
		let radio = document.getElementsByName('episode_no');
		for(let i = 0; i < radio.length; i++) {
			//console.log('i: ', i, radio[i]);
			if(radio[i].checked == true) {
				return radio[i].value;
			}
		}
	}
	
	function onClickHandler(str) {
		let register_no = getParam('register_no');
		let episode_no = getCheckedRadio();
		console.log('episode_no: ', episode_no);
		if (episode_no != undefined){			
			
			switch(str) {
				case "changeEpisodeInfoDetail":
					location.href = 'changeEpisodeInfoDetail.jsp?episode_no=' + episode_no;
					break;
				case "deleteEpisode":
					location.href = 'deleteEpisode.jsp?episode_no=' + episode_no;
					break;
			}
		}
	}
	
	$(document).ready( function () {
		let table = $('#datatables').DataTable({
			//serverSide: true,
			stateSave: true,
			searching: false,
			info: false,
			ajax: {
				url: './process/getVideoEpisodes.jsp',
				data: {"register_no": getParam('register_no')}
			},
			columns: [
				{ data: 'episode_no',
					render: function(data, type, row){
						data = '<input type="radio" name="episode_no" value="' + data + '" />  ' + data;
						return data;
					}},
				{ data: "episode_name" },
			]
		});
	});
	</script>
</body>
</html>