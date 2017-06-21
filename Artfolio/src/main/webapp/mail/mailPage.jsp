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
	
	
	<!-- Custom Fonts -->
	<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
		type="text/css">
	<link rel="stylesheet" type="text/css" media="screen"
		href="/Artfolio/css/bootstrap-datetimepicker.min.css">
	<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
	<link href="../css/fileinput.min.css" rel="stylesheet">
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
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
.fileUpload {
    position: relative;
    overflow: hidden;
    margin: 10px;
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.text {
	font-size: 12px;
	color: #A4A4A4;
	text-decoration: underline;
}

.textOver {
	font-size: 12px;
	color: #5858FA;
	text-decoration: underline;
}

.textout {
	font-size: 12px;
	color: #A4A4A4;
	text-decoration: underline;
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
    <div class="container" style="height:auto; min-height:800px; margin-bottom:30px; margin-top:50px;">

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
           		<div class="">
			<div class="">				
			</div>
					<div id="mailcontent">
						<h3>${mailBean.mailtitle}</h3>
					</div>			
						<br>
						<c:forEach var="re" items="${replyList}">
							<c:url var="link" value="FileDownServlet">
								<c:param name="attachId"
									value="${re.mattach.substring(re.mattach.lastIndexOf('/')+1)}"></c:param>
							</c:url>
							
							<div class="well well-lg" style="width:850px;">
								<table>
									<tr>
										<td>寄件者:${re.memberBean.name} (${re.memberBean.email}):<br>${re.maildate}</td>
									</tr>
									<tr>
										<td><br>${re.mailcontent}</td>
									</tr>
									<c:if test="${not empty re.mattach}">
										<tr>
											<td class="mailDownLoad"><a href="${link}">附件下載</a></td>
										</tr>
										<!--mailAttach -->
									</c:if>
								</table>
								
							</div>
						</c:forEach>
					

					<div id="replyBox" class="panel panel-default" style="width:850px;">
  						<div class="panel-body">按這裡即可<label id="reply">回覆</label>或<label id="forward">轉寄</label>郵件</div>
					</div>
					
					<div id="sendBox" class="form-group" >
						<form action="mail.controller" method="post"
							enctype="multipart/form-data" id="form">
						<label for="email">收件者:</label>
						<input type="text" class="form-control" id="recipientmail" name="recipientmail" value="${mailBean.memberBean.email}" />	
						<input type="hidden" class="form-control" id="recipient" name="recipient" value="${mailBean.memberBean.mid}" /> <!--取得要回覆者的ID -->
						<label for="email">主旨:</label>					
						<input type="text" class="form-control" name="title" value="Re:${mailBean.mailtitle}" />			
						<br>
						<textarea class="form-control"  rows="10" name="content"></textarea>	
						<input type="hidden" name="reply" value="${mailBean.reid}" />
						<input type="hidden" name="mailid" value="${mailBean.mailid}" /> <!-- 取得要回覆的mailId -->
						<input type="hidden" name="replystate" value="true">
						<br>
						<input id="file" name="file" type="file" class="file" multiple data-show-upload="false">
						<button type="submit" class="fileUpload btn btn-primary">傳送</button>		
						</form>
						<div>${err.alert}</div>
					</div>
				</div>     
            </div>
        </div>
        <!-- /.row -->

        <!-- Footer -->
    </div>
    <!-- /.container -->
<jsp:include page="../top/footer.jsp"></jsp:include>
   <!-- jQuery -->

	<script type="text/javascript" src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
	<script src="../js/fileinput.min.js"></script>

<script>
	$(document).ready(function() {
		var mid = "${loginOK.mid}"
			var contentPath = "${pageContext.request.contextPath}"	
				
			$('#reply').addClass('text').mouseover(function() {
				$(this).removeClass().addClass('textOver');
			}).mouseout(function() {
				$(this).removeClass().addClass('textout');
			})
			
			$('#forward').addClass('text').mouseover(function() {
				$(this).removeClass().addClass('textOver');
			}).mouseout(function() {
				$(this).removeClass().addClass('textout');
			})
			
			
			//=====按鈕動作===========================================================================	
				
			$('#write').click(function () {	
	 			$(location).attr('href', contentPath+'/mail/mailUploadList.controller?mailClass=general')	
			});
			
			$('#mailbox').click(function () {			
				$(location).attr('href', '<c:url value="/mail/mailIndex.jsp"/>')				
			});
			
			$('#junk').click(function () {			
				$(location).attr('href', '<c:url value="/mail/junkemail.jsp"/>')			
			});
			
			$('#read').click(function () {			
				$(location).attr('href', '<c:url value="/mail/readmail.jsp"/>')			
			});	
			
			
			$('#sendBox').hide();
			$('#reply').click(function(data) {
				$('#replyBox').hide();
				$('#sendBox').show();
			});
			
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"undelete"},function(datas) {
				 $('#mailbox').html("<a id='mailbox' class='competition__btn-enter btn btn-block btn-default'><span>收件匣 ("+datas.length+")</span></a>")		
			})
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"read"},function(datas) {
				$('#read').html("<a id='read' class='competition__btn-enter btn btn-block btn-default'><span>已讀 ("+datas.length+")</span></a>")			
			})
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"delete"},function(datas) {
				$('#junk').html("<a id='junk' class='competition__btn-enter btn btn-block btn-default'><span>垃圾桶 ("+datas.length+")</span></a>")			
			})		
	})
</script>
</body>

</html>
