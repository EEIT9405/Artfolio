<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" name="report" value="檢舉" /><br/>
<input type="button" name="contact" value="客服" /><br/><br/>

<form id="myForm">
</form><br/><hr/>



<!-- JS -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery.formatDateTime.min.js"></script>
<script type="text/javascript">
	var form = $('#myForm');
	
	$('input[name="report"]').click(function(){
		form.empty();
		
		var cell1 = $('<textarea name=mailcontent maxlength=100 rows=10 cols=20 form=myForm required />');
		var cell2 = $('<input type=hidden name=toId value=1>');//
		var cell3 = $('<input type=hidden name=mailtitle value="wid:4">');
		var cell4 = $('<input type=hidden name=mstatus value=3><br/>');
		var cell5 = $('<input type=button name=submit value=送出 >');
		form.append(['檢舉事由：<br/>',cell1,cell2,cell3,cell4,cell5]);
	});
	
	form.on('click','input[name=submit]', function(){
		$.post('sendToAdminMail.controller', form.serialize(), function(data){
			alert(data);
			form.empty();
		});
	});
	
</script>
</body>
</html>