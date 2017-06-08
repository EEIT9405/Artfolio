<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Test Bootstrap</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<style type="text/css">
	* {
		font-family:微軟正黑體;
		border:solid 1px;
	}
	h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
		font-weight:900;
	}
	header.jumbotron {
		text-align:center;
		background-image:url(https://www.twtainan.net/Utility/DisplayImage?id=19481);
 		background-size:cover;
 		background-pisition:center center;
  		padding:170px;
	}
	section {
		text-align:center;
		padding:80px 0px;
	}
	section .section-heading {
		font-size:36px;
		margin-top:0px;
	}
	section .section-subheading {
		font-size:16px;
	}
	
	.col-sea {
		padding:90px;
	}
	.col-sea img {
		width: 100%;
		border-radius: 50%;
	}
	
	section.story{
		background-color:#eee;
	}
	
	section.story .col-md-6 {
		padding: 20px;
	}
	
	section.story .icon-sea {
		width:80px;
		margin-bottom:20px;
	}
	seciton.pictures{
		padding:0px;
	}
	seciton.pictures p{
		opacity: 0.6;
	}
	section.pictures .col-md-6{
		padding:150px;
		color:white;
		hover
	}
	
	.pic1 {
		background-image:url(http://static.boredpanda.com/blog/wp-content/uploads/2015/06/deep-sea-creatures-new-species-okeanos-explorer-fb__700.jpg);
		background-size:cover;
	} 
	.pic2 {
		background-image:url(http://deepseacreatures.org/images/stories/cute-animals/cute-sea-animals-8.jpg);
		background-size:cover;
	}

</style>
</head>
<body>
	<header class="jumbotron">
		<div class="container">
		<h3>城市向海的一隅</h3>
		<h1>餘光，啟航</h1>
		</div>
	</header>
	<section class="intro">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="section-heading">最後一次看見海是什麼時候呢?</h2>
					<h3 class="section-subheading text-muted">上一次看見的海，仍藍的深邃</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sea">
					<img src="https://static1.squarespace.com/static/576da6e3414fb5ee34116cd4/t/5785816a20099e1db588a530/1467950897417/photo-1441829266145-6d4bfbd38eb4.jpeg?format=1500w">
					<h4>一望無際的海</h4>
					<h6>就像沒有邊際的人生</h6>
				</div>
				<div class="col-md-4 col-sea">
					<img src="https://static1.squarespace.com/static/576da6e3414fb5ee34116cd4/t/5785816a20099e1db588a530/1467950897417/photo-1441829266145-6d4bfbd38eb4.jpeg?format=1500w">
					<h4>一望無際的海</h4>
					<h6>就像沒有邊際的人生</h6>
				</div>
				<div class="col-md-4 col-sea">
					<img src="https://static1.squarespace.com/static/576da6e3414fb5ee34116cd4/t/5785816a20099e1db588a530/1467950897417/photo-1441829266145-6d4bfbd38eb4.jpeg?format=1500w">
					<h4>一望無際的海</h4>
					<h6>就像沒有邊際的人生</h6>
				</div>
			</div>
		</div>
	</section>
	<section class="story">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<img class="icon-sea" src="http://www.iconarchive.com/download/i91899/icons8/windows-8/Travel-Sea-Waves.ico">
					<h2>海洋的故事</h2>
					<h3>要成為海，定義上其實滿不容易的</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="h2">3.5525億平方公里</p>
					<p class="content">海洋即「海」和「洋」的總稱。一般人們將大陸邊緣的水域被稱為「海」，把遠離陸地的水域稱為「洋」。</p>
				</div>
				<div class="col-md-6">
					<p class="h2">3.5%</p>
					<p class="content">海水所含的鹽分各處不同，平均約為3.5%。這些溶解在海水中的無機鹽，最常見的是氯化鈉，即日用的食鹽。
有些鹽來自海底的火山，但大部分來自地殼的岩石。岩石受風化而崩解，釋出鹽類，再由河水帶到海裡去。在海水氣化後再凝結成水的循環過程中，海水蒸發後，鹽留下來，逐漸積聚到現有的濃度。</p>
				</div>
			</div>
		</div>
	</section>
	<section class="pictures">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 pic1">
					<div class="text-panel">
						<h1>深海的生物們</h1>
						<p>目前科學家探索的深海面貌不到1%</p>
					</div>
				</div>
				<div class="col-md-6 pic2">
					<div class="text-panel">
						<h1>人造物的侵襲</h1>
						<p>每年有數萬噸的人造物沉入黑暗的海域</p>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- JS -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>