<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/owl.carousel.css" />
	<link rel="stylesheet" href="css/magnific-popup.css" />
	<link rel="stylesheet" href="css/font-awesome.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/responsive.css" />
<style type="text/css">
	* {
 		font-family:微軟正黑體;
 		border:solid 1px;
	}
	h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
		font-weight:900;
	}
	
	body {
		background-color:#FCFCFC;
	}
	.dropdown .account {
		width:65px; 
		webkit-filter:invert;
	}
	
	header .dropdown{
		padding: 0px;
	}
	
	.pictures img {
		width:300px;
		overflow:hidden;
	}
	
	.pictures .container {
	
	}
	
	header h3 {
		margin-top:15px;
	}
	header h3 a{
		color:white;
	}
	
	header .input-group{
		margin-top:10px;
		margin-right:50px
	}
	
	.jumbotron {
		margin-top:20px;
	}
	
	.jumbotron .container {
		padding:5px;
	}
	
	.jumbotron .top1 img{
		width:500px; 
	}
	.jumbotron .top1 {
		width:500px;
		height: 500px;
		overflow:hidden;
	}
	.jumbotron .top1 img{
		width:200px; 
	}
	.jumbotron .top2{
		width:200px;
		height:200px;
		overflow:hidden;
	}
	
	
	
	
	
</style>
</head>
<body>

	<jsp:include page="top/header.jsp"></jsp:include>
	<section class="jumbotron">
		<div class="container">
		<h3>TOP</h3>
		</div>
		<div class="container">
			<div class="top1"><img src="/img/1495356657546IMG_4565.JPG"></div>
			<div class="top2"><img src="/img/1495356333957IMG_4113.JPG"></div>
			<div class="top3"></div>
			<div class="top4"></div>
			<div class="top5"></div>
			<div class="top6"></div>
			<div class="top7"></div>
			<div class="top8"></div>
			<div class="top9"></div>
			<div class="top10"></div>
			<div class="top11"></div>
		</div>
	</section>
<jsp:include page="top/pushPage.jsp"></jsp:include>
<!-- 	<div class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix" role="complementary"> -->
<!-- 		<div class="nav bs-docs-sidenav"><img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG"></div> -->
<!-- 	</div> -->
	
	<section class="pictures">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356657546IMG_4565.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-3">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-3">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-2">
					<img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG">
				</div>
				<div class="col-md-3">
				</div>
			</div>
			
	</section>
<!-- JS -->
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script><!-- jQuery -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script><!-- Bootstrap -->
<!-- 	<script type="text/javascript" src="js/jquery.parallax.js"></script>Parallax -->
<!-- 	<script type="text/javascript" src="js/smoothscroll.js"></script>Smooth Scroll -->
<!-- 	<script type="text/javascript" src="js/masonry.pkgd.min.js"></script>masonry -->
<!-- 	<script type="text/javascript" src="js/jquery.fitvids.js"></script>fitvids -->
<!-- 	<script type="text/javascript" src="js/owl.carousel.min.js"></script>Owl-Carousel -->
<!-- 	<script type="text/javascript" src="js/jquery.counterup.min.js"></script>CounterUp -->
<!-- 	<script type="text/javascript" src="js/waypoints.min.js"></script>CounterUp -->
<!-- 	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>isotope -->
<!-- 	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>magnific-popup -->
<!-- 	<script type="text/javascript" src="js/scripts.js"></script>Scripts -->
</body>
</html>