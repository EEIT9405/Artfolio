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
	}
	
	h1, h2, h3, h4, h5, h6 {
		font-weight:bold;
	}
	
	.block {
		border-left: solid 1px #aaa;
		border-right: solid 1px #aaa;
	}
	
	.border {
		border: solid 1px #aaa;
	}
</style>
</head>
<body>
<div class="jumbotron">
	<div class="container">
		<h1>bootstrap格線系統</h1>
		<p>xxxxxxxxxxxxxxxxxx</p>
		<div class="row">
			<div class="col-xs-12 visible-lg"><h3>LG(大螢幕>1200px)</h3></div>
			<div class="col-xs-12 visible-md"><h3>MD(中螢幕>992px)</h3></div>
			<div class="col-xs-12 visible-sm"><h3>SM(小螢幕>768px)</h3></div>
			<div class="col-xs-12 visible-xs"><h3>XS(超小螢幕 <768px)</h3></div>
		</div>
		<a class="btn btn-primary" href="https://kkbruce.tw/bs3/" target="_blank">中文說明手冊</a>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="block col-xs-1">1</div>
		<div class="block col-xs-1">2</div>
		<div class="block col-xs-1">3</div>
		<div class="block col-xs-1">4</div>
		<div class="block col-xs-1">5</div>
		<div class="block col-xs-1">6</div>
		<div class="block col-xs-1">7</div>
		<div class="block col-xs-1">8</div>
		<div class="block col-xs-1">9</div>
		<div class="block col-xs-1">10</div>
		<div class="block col-xs-1">11</div>
		<div class="block col-xs-1">12</div>
	</div>
	<div class="row">
		<div class="border col-sm-8 col-sm-offset-2"><h3>偏移的區塊</h3></div>
	</div>
	<div class="row">
		<div class="border col-lg-6 col-md-7 col-sm-4">
			<h3>大區塊</h3>
			<p>xxxxxxxxxxxxxx</p>
			<p class="well">yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy</p>
		</div>
		<div class="border col-lg-6 col-md-5 col-sm-8">
			<h3>大區塊</h3>
			<p>xxxxxxxxxxxxxx</p>
			<ul class="list-group">
				<li class="list-group-item">項目1</li>
				<li class="list-group-item">項目2</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="border col-sm-4 hidden-md"><h3>標題文字</h3></div>
		<div class="border col-sm-4 visible-lg"><h3>標題文字</h3></div>
		<div class="border col-sm-4"><h3>標題文字</h3></div>
	</div>
</div>


<!-- JS -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>