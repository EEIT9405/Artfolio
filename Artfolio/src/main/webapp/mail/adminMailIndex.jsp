<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css">
<title>管理員信箱</title>
<style>
div#column1{
	position:absolute;
	border: 1px solid #ccc;
	padding:10px;
	width:100px;
		
}

div.mailContainer {
	margin-top:30px;
	margin-left:100px;
	width:50%;
}
</style>
</head>
<body>
<div id="column1">
	<h3>管理員</h3>
	<hr>
	<div id="serviceMail">客服信件匣</div>
	<br>
	<div id="reportMail">檢舉信件匣</div>
	<br>
	<div id="junk">垃圾桶</div>
	<br>
</div>
<div class="container mailContainer">
<table id="adminMail" class="table table-bordered table-striped table-hover">
	<thead>
		<tr>
			<th>寄件者</th>
			<th>標題</th>
			<th>時間</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</div>

<!-- JS -->
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
<script src="../js/jquery.formatDateTime.min.js"></script>

<script>
var mailTable = $('#adminMail');
$.getJSON('showAdminMails.controller',{reportOrService:0},function(data){
	mailTable.DataTable({
		"data":data,
		"columnDefs": [
		    {"width": "20%", "targets": 3}
		  ],
		"aoColumns":[
		    { "data": "memberBean.name",
		      "data": "memberBean.email",
			  "data": function (data, type, dataToSet) {
			      return data.memberBean.name + "<br/>" + data.memberBean.email;
			  }
		    },
			{"data":"mailtitle"},
			{"data":"maildate", "type":"date", "render":function(data){
				return $.formatDateTime('yy-mm-dd gg:ii:ss a',new Date(data));
			}},
			{"data":null,"defaultContent":"<input class='btn btn-danger' type=button value=刪除>"+" "+"<input class='btn btn-primary' type=button value=未讀>"},
			{"data":"mailid", "class":"hidden"}
		]
// 		"fnDrawCallback": function ( oSettings ) {
// 		    $(oSettings.nTHead).hide();
// 		}
	});
});

mailTable.on('click','tr>td:not(:nth-child(4))', function(){
	var mailid = $(this).parent('tr').children('td:last').text();
	var container = mailTable.parents('.container');
	$.getJSON('showReIdMails.controller', {mailid:mailid},function(data){
		var docFrag = $(document.createDocumentFragment());
		container.empty();
		container.html($('<table id=adminMail>haha</table>'));
		
	});
});

</script>
</body>
</html>