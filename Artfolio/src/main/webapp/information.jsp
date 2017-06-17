<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css">
<!-- <link href="css/modern-business.css" rel="stylesheet"> -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}
.img-responsive {
	width: 400px;
	height: 200px;
}


.tdmiddle{
 
   vertical-align:middle; 
   text-align:left;
}
</style>


</head>
<body>
<jsp:include page="top/header.jsp"></jsp:include>
<c:if test="${!empty loginOK }">
		<jsp:include page="top/pushPage.jsp"></jsp:include>
	</c:if>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->


		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					My information<small>個人資訊</small>
				</h1>

				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">個人資訊</li>
				</ol>

			</div>
		</div>
		<!-- /.row -->

		<!-- Project One -->
		<div class="tabbable">
			<!-- Only required for left/right tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab1" data-toggle="tab">個人資訊</a></li>
				<li><a href="#tab2" data-toggle="tab">黑名單</a></li>

			</ul>


			<div class="tab-content">

				<!-- 第一格 -->
				<div class="tab-pane active" id="tab1">
					<form class="well form-horizontal" action="MemberUpdate.jsp" method="post"
						id="contact_form">

						<fieldset>
							<legend>個人資訊</legend>
							<div class="row"></div>
							<div class="col-md-8">

								<div class="form-group">
									<label class="col-md-3 control-label">名稱：</label> <label
										class="col-md-5  control-label" style="text-align:left;">${loginOK.name}</label>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">信箱：</label> <label
										class="col-md-5  control-label" style="text-align:left;">${loginOK.email}</label>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">性別：</label> <label
										class="col-md-5  control-label" style="text-align:left;">
										
										<c:choose>
										<c:when test="${loginOK.gender}">
											男			
										</c:when>
										<c:otherwise>										
										女										
										</c:otherwise>
										</c:choose>
										
		
										</label>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">點數：</label> <label  
										class="col-md-5  control-label" style="text-align:left;">${loginOK.point}</label>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">自我介紹:</label> <label
										class="col-md-5  control-label" style="text-align:left;">${loginOK.info}</label>
								</div>
								

							</div>


							<div class="col-md-4">

								<div class="form-group">
									<a href=""> <img
										class="img-responsive img-hover img-circle" style="width:200px"
										src="${loginOK.mphoto}" alt="">
									</a>
								</div>
								
								

							</div>

							<div class="form-group">
								<label class="col-md-4 control-label"></label>
								<div class="col-md-2">
									<input type="submit" class="btn btn-default " name="submit"
										value="更改" />
								</div>

							</div>
						</fieldset>
					</form>
				</div>
				<!-- 黑名單 -->
				<div class="tab-pane " id="tab2">
					<form class="well form-horizontal" action=" " method="post" id="contact_form">
						<fieldset>
							<legend>黑名單</legend>
							<div class="row">
							<div class="col-md-12">
							<table id="blockTable" class="table" style="width:100%">
								<thead>
									<tr>
										<th></th>										
										<th>姓名</th>
										<th>封鎖日期</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							</div>
						</fieldset>
					</form>
				</div>

			</div>

		</div>





		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p align="center">歡來到Artfolio</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

<script src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
<script src="js/jquery.formatDateTime.min.js"></script>
<script type="text/javascript">

$(function(){
	var blockTable = $('#blockTable');
	showBlock();
	function showBlock(){
		$.getJSON('listBlock.controller', function(data){
				blockTable.DataTable({
					"data":data,
					"columnDefs": [
					    {"width": "10%", "targets": 3}
					  ],
					"aoColumns":[
						{"data":"targetBean.mphoto",
						    "render": function(mphoto, type, row) {
						        return '<img src="'+mphoto+'" class="img-rounded" style="width:35px; box-shadow: 3px 3px 5px 3px gray;" />';
						    }},
					    {"data":"targetBean.name"},
						{"data":"blockdate", "type":"date", "render":function(data){
							return $.formatDateTime('yy-mm-dd hh:ii',new Date(data));
						}},
						{"data":null,"defaultContent":"<input class='btn btn-danger' name='unBlock' type='button' value='解除'>"},
						{"data":"targetBean.mid", "class":"hidden"}
					]
				});
		});
	}
	
	blockTable.on('click', 'input[name="unBlock"]', function(){
		var mid = $(this).parent('td').parent('tr').children('td:last').text();
		$.get('unBlock.controller', {mid:mid}, function(data){
			alert(data);
		});
			$(this).parent('td').parent('tr').remove();
	});
	
});
</script>
</body>
</html>