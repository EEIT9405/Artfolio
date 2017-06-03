<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

td {
	border:solid 1px;
}
</style>
</head>
<body>
	<input type="text" name="msg">
	<input id="b1" type="button" value="留言"><br/>
	<input id="b2" type="button" value="顯示"><br/>
	<table id="t1" style="border:solid 1px;">
	</table>
	<input id="user" type="hidden" value="${sessionScope.loginOK.mid}"> 
	
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery.formatDateTime.min.js"></script>
<script>
	$('#b1').click(function(){
		var msg = $('input[name="msg"]').val();
		$.post('insertWmsg.controller', {wmsgcontent:msg, wid:2}, function(data){
			$('#t1').append("<tr><td>"+ data.memberBean.mid +"</td>" + "<td>"
					+data.wmsgcontent+"</td>"+"<td>"+ $.formatDateTime('yy-mm-dd gg:ii:ss a',new Date(data.wmsgdate)) +"</td></tr>");
		});
	});
	
	$('#b2').click(function(){
		doClick();
	});
	
	function doClick(){
		$('#t1').empty();
		$.getJSON('showWmsg.controller',{wid:2}, function(data){
			//var datas = JSON.parse(data);
			$.each(data, function(k,v){
				var cell1 = $('<td></td>').text(v.memberBean.mid);
				var cell2 = $('<td></td>').text(v.wmsgcontent);
				var cell3 = $('<td></td>').text($.formatDateTime('yy-mm-dd gg:ii:ss a',new Date(v.wmsgdate)));
				var cell6 = $('<input type="hidden" value=' + v.wmsgid + '>')
				if(v.memberBean.mid == $('#user').val()){
				    var cell4 = $('<input name="delete" type="button" value="刪除">');
				    var cell5 = $('<input name="update" type="button" value="編輯">');
				    var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6]);
				    $('#t1').append(row);
				}else{
					var row = $('<tr></tr>').append([cell1,cell2,cell3,cell6]);
					$('#t1').append(row);
				}
				
			});
		});
	}
	
	$('#t1').on('click', 'input[name=update]', function(event){
		var thiz = this;
		var id = $(thiz).next('input').val();
		var td = $(thiz).parent('tr').children('td').eq(1);
		var msg = td.text();
		var btnval = $(thiz).val();
		if(btnval == "編輯"){
			td.html('<input value="'+msg+'"/>');
			$(thiz).val('更新');
		}
		if(btnval == "更新"){
			var wmsgcontent = td.children('input').val();
			$.get('updateWmsg.controller', {wmsgid: id, wmsgcontent:wmsgcontent}, function(data){
				td.empty();
				td.text(data.wmsgcontent);
				$(thiz).val('編輯');
			});
		}
	});
	
	
	$('#t1').on('click', 'input[name=delete]', function(event){
		var thiz = this;
		var id = $(thiz).next('input').next('input').val();
		$.get('deleteWmsg.controller', {wmsgid: id}, function(data){
			if(data){
				$(thiz).parent('tr').remove();
			}
		});
	});
</script>
</body>
</html>