<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<title>站內信箱</title>
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
	top:130px;
}
table#mailTable{
	border: 1px solid #ccc;
	padding:15px;
	font-size:9px;
	border-collapse:collapse;
/* 	rules:none; */
}
td{
/* 	text-align: center; */
/* 	border-top: 1px solid #ccc; */
/* 	border-bottom: 1px solid #ccc; */
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
.readtrue{
	background-color:#F2F2F2;
}
.readfalse{
	font-weight: bolder;
}
#mailmsg1{
	font-size:12px;
	font-weight: bolder;
	position:absolute;
	left:150px;
	padding:10px;
}
</style>
</head>
<body>
<h3>ArtFolio活動專區</h3>
	<a href="<c:url value="/bounty/bountyIndex.jsp"/>">活動首頁</a> |
	<a href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a> |
	<a href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a> |
	<a href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a> |
	<a href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a> |
	<a href="">回作品集</a>  |
	<a href="<c:url value="/mail/mailIndex.jsp"/>">站內信</a>  |
	<a href="<c:url value="/secure/login.jsp"/>">登入</a> |
	<a href="<c:url value="/secure/logout.jsp"/>">登出</a> |  <span>您好，${loginOK.name}</span>
	<hr>


<div id="column1">
	<h3>站內信通知</h3>
	
	<div id="write">撰寫</div>
	<hr>
	<div id="mailbox">收件匣</div>
	<br>
	<div id="mailcopy">寄件備份</div>
	<br>
	<div id="draft">草稿</div>
	<br>
	<div id="read">已讀 </div>
	<br>
	<div id="junk">垃圾桶</div>
	<br>
</div>
	<div id="mailmsg1"></div>
<div id="column2">
	<div id="mailmsg"></div>
	<table id="mailTable">
		<thead>
			<tr>
				<th></th>
				<th>寄件者</th>
				<th>主旨</th>
				<th>寄件日期</th>	
				<th></th>
			<tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
</div>


	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>

<script>
	$(document).ready(function() {
		var mid = "${loginOK.mid}"
			var contentPath = "${pageContext.request.contextPath}"
			loadMail(mid)
			
			//=====按鈕樣式======================================
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
			
			$('#read').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			//=====按鈕動作===========================================================================	
				
			$('#write').click(function () {	
	 			$(location).attr('href', contentPath+'/mail/mailUploadList.controller?mailClass=general')	
			});
			
			$('#mailbox').click(function () {			
				$(location).attr('href', '<c:url value="/mail/mailIndex.jsp" />')				
			});
			
			$('#junk').click(function () {			
				$(location).attr('href', '<c:url value="/mail/junkemail.jsp" />')			
			});
			
			$('#read').click(function () {			
				$(location).attr('href', '<c:url value="/mail/readmail.jsp" />')			
			});
		
		
			//=====載入頁面============================================================================		
		function loadMail(mid) {
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"delete"},function(datas) {
				$('#junk').text("垃圾桶 ("+datas.length+")")
			})
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"read"},function(datas) {
				$('#read').text("已讀 ("+datas.length+")")
			})
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"undelete"},function(datas) {
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#mailTable>tbody');
				tb.empty();
				$('#mailbox').text("收件匣 ("+datas.length+")")
				if(datas.length===0){
					$('#column2').attr('style','display:none');
					$('#mailmsg1').text("「收件匣」中沒有信件");
				}
				$.each(datas, function(idx, mail) {			
					   var cell1 = $('<td></td>').html("<div style='display:none'>"+mail.mailid+"</div>");
					   var cell2 = $('<td></td>').text(mail.memberBean.name);			  
					   var cell3 = $('<td></td>').text(mail.mailtitle);	 
					   var cell4 = $('<td></td>').text(mail.maildate);	 
					   var cell5 = $('<td></td>').html("<input type='button' name='delete' value='刪除'/>");
					   var row = $("<tr class='read"+mail.isread+"'></tr>").append(
								[cell1, cell2,cell3,cell4,cell5]);
						docFrag.append(row);
				})
				tb.append(docFrag);
			})
		}
		

		// ====================================================================================================
		$('#mailTable>tbody').on('click','input:nth-child(1)',function(data) { //刪除
			var mailid = $(this).parents('tr').children('td:eq(0)').text();
			$.get('mailUpdate.controller',{"mailid":mailid,'ReadOrDelete':'delete'}, function(data) {
				alert(data);
				loadMail(mid);
			});
		});		
		$('#mailTable>tbody').on('click','td:nth-child(3)',function(data) { //已讀
			var mailid = $(this).parents('tr').children('td:eq(0)').text();
			$(location).attr('href', contentPath+'/mail/mailUpdate.controller?mailid='+mailid+'&ReadOrDelete=read');
		});
	})
</script>



</body>
</html>