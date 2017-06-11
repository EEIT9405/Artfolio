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
.mailReid {
	border: 1px solid #E6E6E6;
	width: 500px;
	font-size: 12px;
}
.writeout{
	padding:5px;
	font-size:14px;
	font-weight:bolder;
	background-color: #0174DF;
	color: white;
	text-align:center;
}
.writeover{
	padding:5px;
	background-color: #2E2EFE;
	font-weight:bolder;
	color: white;
	font-size:14px;
	text-align:center;
}
div.mailboxout{
	padding:2px;
	font-size:14px;
	background-color: ;
	text-align:center;
}
div.mailboxover{
	padding:2px;
	font-size:14px;
	background-color: #E6E6E6;
	text-align:center;
}
.uniqueClassName{
	text-align:center;
}
div#replyBox {
	border: 1px solid #E6E6E6;
	padding-right: 50px;
	padding-bottom: 50px;
	width: 450px;
	font-size: 12px;
	color: #A4A4A4;
}
#reply{
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-2">
	       <div class="list-group" style="width:100px">
					<br><br>			
					<div id="write"><span class='glyphicon glyphicon-pencil'></span>撰寫</div>
					<br>
					<div id="serviceMail">客服信件匣</div>
					<br>
					<div id="reportMail">檢舉信件匣</div>
					<br>
					<div id="junk">垃圾桶</div>		
			</div>				
		</div>
		<div class="col-md-9">
	    	<div class="mailContainer">
				<br><br>
				<table id="mailTable"
						class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						
				</table>
			</div>
	    </div>
	</div>	

<!-- JS -->
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
<script src="../js/jquery.formatDateTime.min.js"></script>

<script>
//=====按鈕樣式======================================
$('#write').addClass('writeout').mouseover(function (){
	$(this).removeClass().addClass('writeover');
}).mouseout(function (){
	$(this).removeClass().addClass('writeout');	
});

$('#serviceMail').addClass('mailboxout').mouseover(function (){
	$(this).removeClass().addClass('mailboxover');
}).mouseout(function (){
	$(this).removeClass().addClass('mailboxout');	
});

$('#reportMail').addClass('mailboxout').mouseover(function (){
	$(this).removeClass().addClass('mailboxover');
}).mouseout(function (){
	$(this).removeClass().addClass('mailboxout');	
});

$('#junk').addClass('mailboxout').mouseover(function (){
	$(this).removeClass().addClass('mailboxover');
}).mouseout(function (){
	$(this).removeClass().addClass('mailboxout');	
});

var mailTable = $('#mailTable');
makeView();
function makeView(){
	$.getJSON('showAdminMails.controller',{reportOrService:0},function(data){
		mailTable.DataTable({
		 	 "order":[[3,"desc"]],
			 "language": {
				 	"search": "搜尋:",
				 	"paginate": {
				      "previous": "前一頁",
				      "next": "下一頁",
				      "search":"搜尋"
				    },
		            "lengthMenu": "每頁顯示 _MENU_ 筆",
		            "zeroRecords": "沒有可以顯示的筆數",
		            "info": "顯示  第_PAGE_頁  至 第 _PAGES_頁",
		            "infoEmpty": "「收件匣」中沒有信件",
		            "infoFiltered": "(filtered from _MAX_ total records)"
		        },	 			        
			 destroy: true,
	           "data": data,
	           "aoColumns": [
	               { "data": "memberBean.name",
	     		      "data": "memberBean.email",
	     			  "data": function (data, type, dataToSet) {
	     			      return data.memberBean.name + "  " + data.memberBean.email;
	     			  },"title":"寄件者",className: "uniqueClassName"
	     		    },
	               { "data": "mailtitle" ,"title":"主旨", className: "uniqueClassName"},
	               { "data": "maildate" ,"title":"寄件日期", className: "uniqueClassName", type: "date",render: function(maildate) {
	                   var d = new Date(maildate);  return d.getFullYear() + '/'  + (d.getMonth() + 1) + '/' + d.getDate() + ' ' + d.getHours()+ ':' + d.getMinutes()+ ':' + d.getSeconds();
	                 }},
	               { "data": null,
	            	 "defaultContent": "<button class='btn btn-default'><span class='glyphicon glyphicon-trash'></span>",
	            	 },            
	               { "data": "mailid" ,"title":"mailid", "class":"hidden", className: "uniqueClassName"}
	           ]
		});
	});
}

function showMail(){
	
	var container = mailTable.parents('.mailContainer');
	$.getJSON('showReIdMails.controller', {mailid:mailid},function(data){
		var docFrag = $(document.createDocumentFragment());
		container.empty();
		container.append($('<div></div>').html("<h3>Re：" +data[0].mailtitle + "</h3>"));
		$.each(data, function(index, value){
			var cell1 = $('<tr></tr>').html($('<td></td>').text("寄件者：" + value.memberBean.name + "("+value.memberBean.email+")"));
			var cell2 = $('<tr></tr>').html($.formatDateTime('yy-mm-dd gg:ii:ss a',new Date(value.maildate))+"<br><br>");
			var cell3 = $('<tr></tr>').html($('<td></td>').text(value.mailcontent));
			var table = $('<table class="mailReid"></table>');
			table.append([cell1,cell2,cell3]);
			docFrag.append(table);
		});
		docFrag.append('<div id="replyBox" class="panel panel-default" style="width:500px;"><div class="panel-body">按這裡即可<a id="reply">回覆</a>郵件</div></div>');
		container.append(docFrag);
	});
}

mailTable.on('click','tr>td:not(:nth-child(4))', function(){
	mailid = $(this).parent('tr').children('td:last').text();
	showMail();
});

$('.mailContainer').on('click','#reply', function(){
	var container = $('.mailContainer');
	$('#replyBox').remove();
	var sendBox = $('<div id="sendBox" class="form-group" style="width:500px;"></div>');
	var cell1 = $('<form class="myForm"></form>');
	cell1.append($('<textarea class="form-control" rows="10" name="mailcontent"></textarea>'));
	cell1.append($('<input type="hidden" name="mailid" value='+mailid+'></input>'));
	sendBox.append([cell1]);
	sendBox.append($('<input type="button" class="fileUpload btn btn-primary"></input>').val("傳送"));
	container.append([sendBox]);
});

$('.mailContainer').on('click','input.fileUpload', function(){
	$.post('replyAdminMail.controller', $('form.myForm').serialize(), function(data){
		alert(data);
		$('#sendBox').empty();
	});
});


</script>
</body>
</html>