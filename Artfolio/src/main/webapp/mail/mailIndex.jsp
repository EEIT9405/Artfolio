<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<title>Artfolio會員信箱</title>
<style>
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
</style>
</head>

<body>

	<div class="container">
		<header class="navbar navbar-light navbar-toggleable-md bd-navbar">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display	 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Artfoilo</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="about.html">About</a></li>
				<li><a href="services.html">Services</a></li>
				<li><a href="contact.html">Contact</a></li>
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Portfolio <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="portfolio-1-col.html">1
								Column Portfolio</a></li>
						<li><a href="portfolio-2-col.html">2 Column Portfolio</a></li>
						<li><a href="portfolio-3-col.html">3 Column Portfolio</a></li>
						<li><a href="portfolio-4-col.html">4 Column Portfolio</a></li>
						<li><a href="portfolio-item.html">Single Portfolio Item</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Blog <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="blog-home-1.html">Blog Home 1</a></li>
						<li><a href="blog-home-2.html">Blog Home 2</a></li>
						<li><a href="blog-post.html">Blog Post</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Other Pages <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="full-width.html">Full Width Page</a></li>
						<li><a href="sidebar.html">Sidebar Page</a></li>
						<li><a href="faq.html">FAQ</a></li>
						<li><a href="404.html">404</a></li>
						<li><a href="pricing.html">Pricing Table</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav> </header>
	</div>
	<!-- /.container -->
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<a><h3 class="page-header">
					Artoflio活動專區 <small></small>
				</h3></a>
<!-- 				<div class="input-group" style="width: 200px;left:80%; "> -->
<!-- 					<input type="text" class="form-control input-sm" placeholder="Search"> -->
<!-- 					<div class="input-group-btn"> -->
<!-- 						<button class="btn btn-default" type="submit"> -->
<!-- 							<i class="glyphicon glyphicon-search"></i> -->
<!-- 						</button> -->
<!-- 					</div>	 -->
<!-- 				</div> -->
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyIndex.jsp"/>">活動首頁</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a></li>
					<li class="active"><a href="">回作品集</a></li>
					<li class="active"><a href="<c:url value="/mail/mailIndex.jsp"/>">會員信箱</a></li>
					<li class="active"><a href="<c:url value="/secure/login.jsp"/>">登入</a></li>
					<li class="active"><a href="<c:url value="/secure/logout.jsp"/>">登出</a></li>
					<li class="active"><span>您好，${loginOK.name}</span></li>
				</ol>		
			</div>
		</div>
		<!-- /.row -->

		<!-- Project One -->
		<div class="row">
			<div class="col-md-2">
		       <div class="list-group 　" style="width:100px">
						<br><br>			
						<div id="write" ><span class='glyphicon glyphicon-pencil'></span>   撰寫</div>
						<br>
						<div id="mailbox" >收件匣</div>
						<br>
						<div id="mailcopy" >寄件備份</div>
						<br>
						<div id="draft" >草稿</div>
						<br>
						<div id="read" >已讀</div>
						<br>
						<div id="junk" ></div>		
				</div>				
			</div>
			<div class="col-md-9">
		    <div class="">
			<div class="">				
			</div>		
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

	<hr>

		<!-- Pagination -->
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="../js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript"
						src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
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
				$('#mailbox').text("收件匣 ("+datas.length+")")
				 $('#mailTable').DataTable({	
					 
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
		               "data": datas,
		               "columns": [
		                   { "data": "mailid" ,"title":"mailid", "class":"hidden", className: "uniqueClassName"},
		                   { "data": "memberBean.name" ,"title":"寄件者", className: "uniqueClassName"},
		                   { "data": "mailtitle" ,"title":"主旨", className: "uniqueClassName"},
		                   { "data": "maildate" ,"title":"寄件日期", className: "uniqueClassName", type: "date",render: function(maildate) {
		                       var d = new Date(maildate);  return d.getFullYear() + '/'  + (d.getMonth() + 1) + '/' + d.getDate() + ' ' + d.getHours()+ ':' + d.getMinutes()+ ':' + d.getSeconds();
		                     }},
		                   { "data": null,
		                	 "defaultContent": "<button class='btn btn-default'><span class='glyphicon glyphicon-trash'></span>",
		                	 },            
		               ]			 		
		            });
			})
		}
		// ====================================================================================================
		$('#mailTable>tbody').on('click','button:nth-child(1)',function(data) { //刪除
			var mailid = $(this).parents('tr').children('td:eq(0)').text();
			$.get('mailUpdate.controller',{"mailid":mailid,'ReadOrDelete':'delete'}, function(data) {
				loadMail(mid);
			});
		});		
		$('#mailTable>tbody').on('click','td:nth-child(3)',function(data) { //已讀
			var mailid = $(this).parents('tr').children('td:eq(0)').text();
			$(location).attr('href', contentPath+'/mail/mailUpdate.controller?mailid='+mailid+'&ReadOrDelete=read');
		});
	})
</script>
</div>
</body>
</html>