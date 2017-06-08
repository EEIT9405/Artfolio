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
	}
	h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
		font-weight:900;
	}
	
	body {
		background-color:#FCFCFC;
	}
	.dropdown .account {
		width:65px; 
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
	
	header .input-group{
		margin-top:10px;
		margin-right:50px
	}
	
	div.account-img img {
		width:200px;
	}
	
</style>
</head>
<body>
<c:if test="${empty loginOK}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<jsp:include page="top/header.jsp"></jsp:include>
	
<jsp:include page="top/pushPage.jsp"></jsp:include>
	<div></div>
	<div class="account-img" style="position:fixed; margin-top:50px; top:0; left:0; width:200px; height:500px;">
		<div>
			<h3>我的作品集</h3>
			<img class="img-thumbnail" src="/img/20130722140709881.jpg">
			<span>蛇熊</span><br>
			<div class="btn btn-default">上傳</div>
			<div class="btn btn-default">編輯</div><br>
			分類顯示<select>
				<option>依時間</option>
				<option>依標籤</option>
				<option>依相簿</option>
				<option>依人氣</option>
			</select>
		</div>
	</div>
	<section class="pictures" style="margin-top:80px;">
			<div class="row">
				<div class="col-md-2">
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
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
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
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
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
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
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
				<div class="col-md-2">
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