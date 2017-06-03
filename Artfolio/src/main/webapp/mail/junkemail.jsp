<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div#column1{
	position:absolute;
	border: 1px solid #ccc;
	padding:10px;
	width:100px;
	
}
div#column2{
	position:absolute;
	left:150px;
	padding:10px;
}
table#maillist{
	border: 1px solid #ccc;
	padding:15px;
	font-size:9px;
	border-collapse:collapse
}
td{
	text-align: center;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding:10px;
}
.writeout{
	padding:5px;
	background-color: #819FF7;
	text-align:center;
}
.writeover{
	padding:5px;
	background-color: #0040FF;
	color: white;
	text-align:center;
}
div.mailboxout{
	padding:5px;
	font-size:12px;
	background-color: ;
	text-align:center;
}
div.mailboxover{
	padding:5px;
	font-size:12px;
	background-color: #E6E6E6;
	text-align:center;
}

</style>
</head>
<body>
<h3>ArtFolio活動專區</h3>
	<a href="<c:url value="/bountyIndex.jsp"/>">活動首頁</a> |
	<a href="<c:url value="/bountyDisplay.jsp"/>">所有活動</a> |
	<a href="<c:url value="/bountyUpload.jsp"/>">舉辦活動</a> |
	<a href="<c:url value="/bountyTrackPage.jsp"/>">活動追蹤</a> |
	<a href="<c:url value="/bountyPersonal.jsp"/>">活動管理</a> |
	<a href="">回作品集</a>  |
	<a href="<c:url value="/mail/mailIndex.jsp"/>">站內信</a>  |
	<a href="<c:url value="/secure/login.jsp"/>">登入</a> |
	<a href="<c:url value="/secure/logout.jsp"/>">登出</a> |  <span>您好，${loginOK.mid}</span>
	<hr>


<div id="column1">
	<h3>站內信通知</h3>
	
	<div id="write">撰寫</div>
	<hr>
	<div id="mailbox">收件匣 ( ${mailcount})</div>
	<br>
	<div id="mailcopy">寄件備份</div>
	<br>
	<div id="draft">草稿</div>
	<br>
	<div id="junk">垃圾桶 ( )</div>
	<br>
</div>

<div id="column2">
	<table id="mailTable">
		<thead>
			<tr>
				<th>信件編號</th>
				<th>寄件者</th>
				<th>主旨</th>
				<th>寄件日期</th>	
			<tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
</div>

<script src="../js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		var mid = "${loginOK.mid}"
			var contentPath = "${pageContext.request.contextPath}"
			loadMail(mid)
			
			$('#write').addClass('writeout').mouseover(function (){
				$(this).removeClass().addClass('writeover');
			}).mouseout(function (){
				$(this).removeClass().addClass('writeout');	
			});
			
			$('#mailbox').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			$('#junk').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			$('#mailcopy').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			$('#draft').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});	
			
			$('#write').click(function () {	
	 			$(location).attr('href', contentPath+'/mail/mailUploadList.controller?mailClass=general')	
			});
			
			$('#mailbox').click(function () {			
				$(location).attr('href', '<c:url value="/mail/mailIndex.jsp" />')				
			});
			
			$('#junk').click(function () {			
				$(location).attr('href', '<c:url value="/mail/junkemail.jsp" />')			
			});
		
		function loadMail(mid) {
			$.getJSON("mailDisplay.controller",{"targetId":mid,"ShowReadOrDelete":"delete"},function(datas) {
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#mailTable>tbody');
				tb.empty();
				$.each(datas, function(idx, mail) {
					   var cell1 = $('<td></td>').text(mail.mailid);
					   var cell2 = $('<td></td>').text(mail.memberBean.name);
					   var cell3 = $('<td></td>').text(mail.mailtitle);
					   var cell4 = $('<td></td>').text(mail.maildate);	 
					   var cell5 = $('<td></td>').html("<input type='button' name='undelete' value='復原'/><input type='button' name='deletepermanently' value='永久刪除'/>");
					   var row = $('<tr></tr>').append(
								[cell1,cell2,cell3,cell4,cell5]);
						docFrag.append(row);
				})
				tb.append(docFrag);
			})
		}
		
		// ====================================================================================================
		$('#mailTable>tbody').on('click','input:nth-child(1)',function(data) { //復原
			var mailid = $(this).parents('tr').children('td:eq(0)').text();
			$.get('mailUpdate.controller',{"mailid":mailid,'ReadOrDelete':'undelete'}, function(data) {
				alert(data);
				loadMail(mid);
			});
		});	
		
	});
</script>



</body>
</html>