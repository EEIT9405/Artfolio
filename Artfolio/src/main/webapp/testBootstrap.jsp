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
		font-weight:900;
	}
</style>
</head>
<body>
<div class="jumbotron">
	<div class="container">
		<h1>hello bootstrap</h1>
		<p>xxxxxxxxx</p>
		<a class="btn btn-primary" href="https://kkbruce.tw/bs3" target="_blank">了解更多</a>
	</div>
</div>
<div class="container">

 	<h3 class="page-header">表格練習</h3>
 	<table class="table table-bordered">
 		<thead>
 			<tr>
 				<th>項目1</th>
 				<th>項目2</th>
 				<th>項目3</th>
 			</tr>
 		</thead>
 		<tr> 
 			<td>一</td>
 			<td>二</td>
 			<td>三</td>
 		</tr>
 		<tr>
 			<td>一</td> 
 			<td>二</td>
 			<td>三</td> 
 		</tr>
 		<tr>
 			<td>一</td>
 			<td>二</td>
 			<td>三</td>
 		</tr>
 	</table>
 	
	<h3 class="page-header">請單練習</h3>
	<ul class="list-group">
		<li class="list-group-item">list-group 清單
			<span class="badge">14</span>
		</li>
		<li class="list-group-item active">btn btn-default 按鈕</li>
		<li class="list-group-item disabled">breadcrumb 麵包屑尋覽列</li>
	</ul>
	

	<h3 class="page-header">麵包屑導覽列</h3>
	<ul class="breadcrumb">
		<li><a>動態網頁課程</a></li>
		<li>bootsrap介紹</li>
		<li>第一個範例</li>
	</ul>
	
	<h3 class="page-header">按鈕大小與調整</h3>
	<p>
	<div class="btn btn-default btn-danger">危險!!</div>
	<br>
	<br>
	<div class="btn-group">
		<div class="btn btn-default">設定</div>
		<div class="btn btn-default">帳號</div>
		<div class="btn btn-default">課程</div>
		<div class="btn btn-default">購買資訊</div>
	</div>
	<h3 class="page-header">如果可以寫完Html就刻完網頁的設計哲學</h3>
	<p>yyyyyyyyyyyyyyyyyyyyyyyy</p>
	<img class="img-responsive" alt="" src="https://site2img-api.herokuapp.com/parse/files/MqX4RIjBpnVgUg9lRrxmWRsDVmqR5SCOaYmnSpnx/2ba43291aa42c2e1e11e268e780a5e96_img.png">
</div>
<!-- JS -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>