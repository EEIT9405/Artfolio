<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Timer</title>
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<script src='/Artfolio/js/sweetalert.min.js'></script>
</head>
<body>
	<div style="margin-left:10px;">
	<h4>時間:</h4>
	<select id="select">
		<option value="" selected>請選擇</option>
		<option value="stop">停止</option>
		<option value="0 0/5 * * * ?">每五分</option>
		<option value="59 59 23 * * ?">每日24:00</option>
		<option value="59 59 23 * * 7">每週六24:00</option>
		<option value="0 0 0 1 * ?">每月底24:00</option>
<!-- 		<option value="0/10 * * * * ?">每10秒</option> -->
<!-- 		<option value="0/30 * * * * ?">每30秒</option> -->
	</select>
	<br />
	<br />
	<input class="btn btn-primary" style="margin-right:10px;" id="cron" type="button" value="改時鐘">
	<input class="btn btn-default" id="status" type="button" value="狀態">
	<br />
	<div id="d1"></div>
	</div>
<!-- JS -->
<script>

$('#cron').click(function() {
	var time = $('#select').find(':selected').val();
	var text = $('#select').find(':selected').text();
	$.post('workTop.controller', {
		cron : time,
		timetext : text
	}, function(data) {
		alert(data);
		doStatus();
	});
});

function doStatus() {
	$.get('WorkTopStatus.controller', function(data) {
		$('#d1').html('<h4>'+data+'</h4>');
	});
}

$('#status').click(function() {
	doStatus();
});
</script>
</body>
</html>