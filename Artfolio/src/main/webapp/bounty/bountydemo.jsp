<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artfolio活動徵稿</title>

<!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="/Artfolio/css/bootstrap-datetimepicker.min.css">
<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">
<link href="/Artfolio/css/sweetalert.css" rel="stylesheet">

<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/Artfolio/js/bootstrap.min.js"></script>
<script src="/Artfolio/js/sweetalert.min.js"></script>
<style type="text/css">
#bd {
	margin: 0;
	font-family: "微軟正黑體", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 20px;
	height:auto;
	min-height:500px;
	margin-bottom:30px;
	margin-top:50px;
}
#bd .img-responsive {
	width: 300px;
}
#bd .t1 {
	border-style: solid;
	border-width: 3px;
	border-radius: 10px;
}
#bd .row{
	margin-top:10px;
	margin-left: 0px;
	margin-right: 0px;
	padding:0;
}
#bd .btn{
 	margin-bottom:10px;
}
#header {
	padding-top:50px;
	margin:0;
    max-width:100%;
    max-height:auto;
/*     border-bottom:1px solid black */
}
#bd .navbar {
	margin-bottom:0;
}
#bd .breadcrumb {
margin-bottom:0;
background-color:#E6E6E6;
/* border-bottom:1px solid black; */
color:#F3F781;
font-weight:bolder;
text-align:center;
}
#bd h2{
padding-top:60px;
}
#bd .col-md-2{
	text-align:right;
	height:183px;
	padding:0;
	padding-right:30px;
}
#bd .col-md-4{
	padding:0;
}
#bd .col-md-6{
	padding:0;
	height:183px;
	padding-left:10px;
}
#bd .div panel-heading{
	background-color:#F3F781
}
#bd p{
	margin:0
}
#bd .competition__keyBg {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 0;
	width: 100%;
	height: 200px;
	overflow: hidden
}

#bd .competition__keyBg img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(1.15);
	transform-origin: center;
 	-ms-filter: 
	"progid:DXImageTransform.Microsoft.MotionBlur(strength=50), progid:DXImageTransform.Microsoft.BasicImage(mirror=1)"; 
   	filter: blur(0px)   
}

#bd .competition__keyBg__mask {
	position: absolute;
	top: 0;
	width: 0;
	background-color: rgba(0, 0, 0, .2);
	background-image: linear-gradient(180deg, transparent 0, rgba(0, 0, 0, .45));
	width: 100%;
	height: 100%
}

#bd .col-md-4 h1 {
	max-width: calc(100% - 120px);
	color: #fff;
	margin-left:150px;
	margin-bottom:10px;
	margin-top:10px;
}


#bd .btn-primary.raised {
	box-shadow: 0 3px 0 0 #007299;
}


#bd .btn-primary.raised:active, .btn-primary.raised.active {
	background: #33a6cc;
	box-shadow: none;
	margin-bottom: -3px;
	margin-top: 3px;
}

.lab1{
font-size: 18px;

}



</style>
</head>

<body background="/Artfolio/webbackground/vintage-leaves.png">
		<jsp:include page="../top/header.jsp"></jsp:include>
		<div id="bd">
		<header>
				
			<ol class="breadcrumb">
				<li class="active"><a
					href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a></li>
			</ol>
		
		</header>

	

	<!-- /.container -->
	<!-- Page Content -->	
	
	
	
	<div class="container">

		<!-- /.row -->

		<!-- Project One -->
		<div class="row">
			<div class="sidebar col-md-4" style="position: relative; z-index: 1; background-color:#FAFAFA ;border:1px solid #D8D8D8; padding:5px; box-shadow: 5px 5px 5px #E6E6E6;">
								
								
								<aside class="card card-default">
								
							<!--活動圖片 -->
								<div class="competition__cover text-center">   
									<img class="img-responsive img-hover img-thumbnail" style="width: 100%;" src="${member.mphoto}" alt="">
								</div>
								
								<hr>
								<div align="center"><label class="lab1">名稱：</label><label>${member.name}</label></div>
							<br>
							<div align="center"><label class="lab1">信箱：</label><label>${member.email}</label></div>
								
							<div align="center"><input class="btn btn-primary" type ="button" onclick="history.back()" value="回到上一頁"></input></div>	
								
								
								</aside>
								
								
						
								
							</div>



				<div id="bountyTable" class="col-md-8">
                 <c:forEach var="midp" items="${midPersonal}">
					<div id="row0" class="row"
					
						style="border: 1px solid #D8D8D8; border-radius: 20px; overflow: hidden; background-color: #fff; box-shadow: 5px 5px 5px #E6E6E6;">
						<div class="col-md-4">
							<a href="/Artfolio/bounty/bountyPage.controller?id=1"><img
								style="border-radius: 10px" class="img-responsive"
								alt="Cinque Terre" src="/bountyImgs/${midp.bounty.b_attach_pic.substring(midp.bounty.b_attach_pic.lastIndexOf("/")+1)}"></a>
						
						
						</div>
						<div class="col-md-6">
							<h3>
								<a href="/Artfolio/bounty/bountyPage.controller?id=${midp.bounty.b_id}">${midp.bounty.b_title}</a>
							</h3>
							<div>總獎金 TWD$ :${midp.bounty.b_bonus_total}</div>
							<div style="margin-bottom: 20px">截止收件 : ${midp.bounty.b_enddate}</div>
							<div style="font-size: 12px" class="btn btn-default" id="soon0">即將截止</div>
							<div style="font-size: 12px" class="btn btn-info" id="ing0">進行中</div>
							<div style="font-size: 12px" class="btn btn-default" id="end0">已結束</div>
							<div style="font-size: 12px" class="btn btn-default" id="ann0">獲選公布</div>
							<br>
					
						</div>
						<div class="col-md-2">
							<br>
							<p>
								<i style="padding-right: 5px"
									class="glyphicon glyphicon-eye-open"></i>${midp.bounty.b_click}
							</p>
							<p>
								<i style="padding-right: 5px"
									class="glyphicon glyphicon-comment"></i>${midp.msg}
							</p>
							<p style="margin-bottom: 61px">
								<i style="padding-right: 5px"
									class="glyphicon glyphicon-heart-empty"></i>${midp.track}
							</p>
							<a class="btn btn-mini btn-primary" style="font-size: 12px"><span
								class="glyphicon glyphicon-heart"></span> 追蹤</a>
						</div>
					</div>
					
					</c:forEach>
				</div>
			</div>
		
		
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- jQuery -->

	</div>
	
<jsp:include page="../top/footer.jsp"></jsp:include>	
	<script type="text/javascript">
	
	
	
	
	</script>

</body>

</html>
