<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

	   <!-- Bootstrap Core CSS -->
	<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="/Artfolio/css/modern-business.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
		type="text/css">
	<link rel="stylesheet" type="text/css" media="screen"
		href="/Artfolio/css/bootstrap-datetimepicker.min.css">
	<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />

<style type="text/css">
.classes{
	margin-top:10px;
	margin-bottom:10px
}
.competition__keyBg {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 0;
	width: 100%;
	height: 250px;
	overflow: hidden
}

.competition__keyBg img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(1.15);
	transform-origin: center;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.MotionBlur(strength=50), progid:DXImageTransform.Microsoft.BasicImage(mirror=1)";
	/* 	filter: blur(50px) */
}
</style>



</head>

<body background="/Artfolio/webbackground/vintage-leaves.png">

	<jsp:include page="../top/header.jsp"></jsp:include>
	<header class="head-inner">
		<div class="competition__keyBg">
<!-- 			<img src="/Artfolio/webbackground/23.jpg" style="width: 100%;"> -->
			<div class="competition__keyBg__mask"></div>
		</div>
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<h1 class="page-title text-center">Left Sidebar</h1> -->
<!-- 				<h2 class="page-lead text-center">Sample page featuring default header with background image on top</h2> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</header>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin-top:80px">會員信箱
                    <small>收件匣</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
            <div class="col-md-3">
               <div class="official-button col-xs-12">
					<div id="write" class="classes">
						<a id="write"
							class="competition__btn-enter btn btn-block btn-primary"><span
							class='glyphicon glyphicon-pencil'style="padding-top:3px;padding-bottom:4px">撰寫</span></a>
					</div>
					<div id="mailbox" class="classes">
						<a id="mailbox"
							class="competition__btn-enter btn btn-block btn-default"><span>收件匣</span></a>
					</div>
					<div id="mailcopy" class="classes">
						<a id="mailcopy"
							class="competition__btn-enter btn btn-block btn-default"><span>寄件備份</span></a>
					</div>
					<div id="draft" class="classes">
						<a id="draft"
							class="competition__btn-enter btn btn-block btn-default"><span>草稿</span></a>
					</div>
					<div id="read" class="classes">
						<a id="read"
							class="competition__btn-enter btn btn-block btn-default"><span>已讀</span></a>
					</div>
					<div id="junk" class="classes" >
						<a id="junk"
							class="competition__btn-enter btn btn-block btn-default"><span>垃圾桶</span></a>
					</div>	
				</div>
            </div>
            <!-- Content Column -->
            
            
            <div class="col-md-9">
<!--                 <h2>Section Heading</h2> -->
<!--                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.</p> -->
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
        <!-- /.row -->

        <!-- Footer -->
    </div>
    <!-- /.container -->

   <!-- jQuery -->
	<script src="../js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>


<script>
$(document).ready(function() {
	var mid = "${loginOK.mid}"
		var contentPath = "${pageContext.request.contextPath}"
		loadMail(mid)
			
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
			
	function loadMail(mid) {
		$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"delete"},function(datas) {
			$('#junk').html("<a id='junk' class='competition__btn-enter btn btn-block btn-default'><span>垃圾桶 ("+datas.length+")</span></a>")			
		})
		$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"undelete"},function(datas) {
			 $('#mailbox').html("<a id='mailbox' class='competition__btn-enter btn btn-block btn-default'><span>收件匣 ("+datas.length+")</span></a>")			
		})
    	$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"read"},function(datas) {
			$('#read').html("<a id='read' class='competition__btn-enter btn btn-block btn-default'><span>已讀 ("+datas.length+")</span></a>")			
			$('#mailTable').DataTable({		 
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
			            "infoEmpty": "「垃圾桶」中沒有信件",
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
	                	 "defaultContent": "<button class='btn btn-default' value=''>標示為未讀</button>",
	                	 },       
	               ]			 		
	            });	
	})
}
		
	$('#mailTable>tbody').on('click','button:nth-child(1)',function(data) { //未讀
		var mailid = $(this).parents('tr').children('td:eq(0)').text();
		$(location).attr('href', contentPath+'/mail/mailUpdate.controller?mailid='+mailid+'&ReadOrDelete=unread');
		
	});
	
})
	
	
</script>
</body>

</html>
