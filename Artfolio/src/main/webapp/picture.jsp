<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/jquery.ui.css"></link>
</head>
<body>
	<input type="hidden" name="wid" value="3">
	<img id="p1" width="200" src="/img/1495356333957IMG_4113.JPG">
	<br />
	<hr />
	<input type="hidden" name="mid" value="3">
	<input id="block" type="button" value="加入黑名單">
	<input id="unblock" type="button" value="移除黑名單">
	<input id="blockList" type="button" value="黑名單">
	<br />
	<hr />
	時間:
	<select id="select">
		<option value="" selected>請選擇</option>
		<option value="stop">停止</option>
		<option value="0 0/5 * * * ?">每五分鐘</option>
		<option value="59 59 23 * * ?">每日24:00</option>
		<option value="59 59 23 * * 7">每週六24:00</option>
		<option value="0 0 0 1 * ?">每月底24:00</option>
	</select>
	<br />
	<input id="cron" type="button" value="改時鐘">
	<br />
	<input id="status" type="button" value="狀態">
	<br />
	<div id="d1"></div>
	<br />
	<hr />
	<input id="picture" type="button" value="顯示">
	<br />
	<table id="d2"></table>
	<br />
	<hr/>
	
	<input id="WorkRelational" type="button" value="相關圖">

	<script src="js/jquery-3.2.1.min.js"></script>
	<script>
		$("#p1").click(function() {
			var data = $('input[name="wid"]').val();
			$.post('browsed.controller', {
				wid : data
			});
		});

		$('#block').click(function() {
			var v = $('input[name="mid"]').val();
			$.post('block.controller', {
				mid : v
			}, function(data) {
				alert(data);
			});
		});

		$('#unblock').click(function() {
			var v = $('input[name="mid"]').val();
			$.get('unBlock.controller', {
				mid : v
			}, function(data) {
				alert(data);
			});
		});

		$('#blockList').click(function() {
			$.getJSON('listBlock.controller', function(data) {
				console.log(data);
			});
		});

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
				$('#d1').text(data);
			});
		}

		$('#status').click(function() {
			doStatus();
		});

// 		$('#picture').click(function(){
// 			$('#d2').empty();
// 			$.getJSON('showTop.controller',function(data){
// 				$.each(data, function(k,v){
// 					var cell1 = $('<img width="200" src="'+v.picurl+ '"/>');
// 					$('#d2').append(cell1);
// 				});
// 			});
// 		});
		
		$('#picture').click(function(){
			$('#d2').empty();
			var documentFrag = $(document.createDocumentFragment());
			$.getJSON('showAllTop.controller',function(data){
				
				$.each(data, function(i,v){
					var cell1 = $('<td></td>').text(i);
					var row = $('<tr></tr>').append([cell1]);
					$.each(v, function(key,value){
						var cell2 = $('<td></td>').html('<img width="200" src="'+value.picurl+'">');
						row.append([cell2]);
					});
					documentFrag.append(row);
				});
				$('#d2').append(documentFrag);
			});
		});
		
		$('#WorkRelational').click(function(){
			$.getJSON('showRelationalWork.controller',{wid:1}, function(data){
				console.log(data);
			});
		});
		
	</script>
</body>
</html>