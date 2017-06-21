<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Point</title>
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/Artfolio/css/pushBar.css" rel="stylesheet">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<script src='/Artfolio/js/sweetalert.min.js'></script>
<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}
.paging-nav {
  text-align: right;
  padding-top: 2px;
}

.paging-nav a {
  margin: auto 1px;
  text-decoration: none;
  display: inline-block;
  padding: 1px 7px;
  background: #91b9e6;
  color: white;
  border-radius: 3px;
}

.paging-nav .selected-page {
  background: #187ed5;
  font-weight: bold;
}

.paging-nav,
#tableData {
  width: 400px;
  margin: 0 auto;
  font-family: Arial, sans-serif;
}

.authorimg {
  overflow: hidden;
  width: 100%;
  height: 0;
  padding-bottom: 100%;
  margin-top: 12px;
  margin-bottom: 12px;
  position: relative;
}
.authorimg img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 160%;
}
.top-colleciton {
  background-image: url(/Artfolio/img/bg_index.jpg);
  background-size: 100%;
  padding-top: 60px;
}
.footer {
	padding-top: 40px;
	padding-bottom: 10px;
	background-color: #222;
	color: #999;
	font-size: 10px;
	letter-spacing: 1px;
}

.footer hr {
	background-color: #222;
	opacity: 0.1;
}

.title h3 {
	text-align: center;
}
.active{
	font-size:16px;
}
</style>
</head>
<body>
<!-- Navigation -->
<jsp:include page="/top/header.jsp"></jsp:include>
	<c:if test="${!empty loginOK }">
		<jsp:include page="/top/pushPage.jsp"></jsp:include>
	</c:if>
	
<div class="container-fluid top-colleciton">
   <div class="row">
   	 <div class="col-md-1"></div>
   	 <div class="col-md-10">
		<h1 class="page-header">My point <small>點數區</small></h1>
     </div>   
     <div class="col-md-1"></div>        
   </div>             
</div>
<br/> 
<div class="container" style="height:auto; min-height:660px; margin-bottom:30px;">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="/Artfolio/index.jsp">Home</a>
                    </li>
                    <li class="active">點數交易</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
		     <!-- /.row -->
	<div class="row">
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="authorimg">
					<img style="width:150px;" src="${loginOK.mphoto}">
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10">
		<div style="height:340px;">
		<div id="point" >
			<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#exchange"
				aria-controls="exchange" role="tab" data-toggle="tab">點數兌換</a></li>
			<li role="presentation"><a href="#log" aria-controls="log"
				role="tab" data-toggle="tab">兌換記錄</a></li>
			<li role="presentation"><a href="#log2" aria-controls="log2"
				role="tab" data-toggle="tab">贊助記錄</a></li>
			<li role="presentation"><a href="#log3" aria-controls="log3"
				role="tab" data-toggle="tab">受贈記錄</a></li>
		</ul>
		<div class="tab-content">
			<div id="exchange" role="tabpanel" class="tab-pane active">
				<form action="point/exchange.controller" method="post">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
								<th colspan="2">交易</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>
								<td>現有點數</td>
								<td>${main.point}</td>
							</tr>
							<tr>
							<td>
								<td>交易形式</td>
								<td>
									<select name="type" required>
										<option value="buy">購點</option>
										<option value="sell">兌現</option>
									</select>
								</td>
							</tr>
							<tr>
							<td>
								<td>選擇點數</td>
								<td><input name="point" style="width:5em" type="number" min="10" max="10000" step="10" required value="${param.point}"><span>${msg}</span></td>
							</tr>
							<tr>
							<td>
								<td colspan="2"><input style="margin-right:10px;" class="btn btn-primary" type="submit" value="submit"><input class="btn btn-danger" type="reset" value="reset"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div id="log" role="tabpanel" class="tab-pane">
				<c:choose>
					<c:when test="${not empty exchangelog}">
						<table id="exchageTable" class="table table-striped">
							<thead>
								<tr>
									<th>
									<th>點數</th>
									<th>交易形式</th>
									<th>日期</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${exchangelog}" var="item">
									<tr>
										<td>
										<td>${item.point}</td>
										<td><c:choose>
												<c:when test="${item.ptype}">購點</c:when>
												<c:otherwise>兌現</c:otherwise>
											</c:choose></td>
										<td>${item.expointdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="log2" role="tabpanel" class="tab-pane">
				<c:choose>
					<c:when test="${not empty donatelog}">
						<table id="giftTable" class="table table-striped">
							<thead>
								<tr>
									<th>
									<th>icon</th>
<!-- 									<th>id</th> -->
									<th>對象</th>
									<th>點數</th>
									<th>日期</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${donatelog}" var="item">
									<tr>
										<td>
										<td><img src="${item.mphoto}"></td>
<%-- 										<td>${item.mid}</td> --%>
										<td>${item.name}</td>
										<td>${item.point}</td>
										<td>${item.date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="log3" role="tabpanel" class="tab-pane">
				<c:choose>
					<c:when test="${not empty donatedlog}">
						<table id="giftedTable" class="table table-striped">
							<thead>
								<tr>
									<th>
									<th>icon</th>
<!-- 									<th>id</th> -->
									<th>對象</th>
									<th>點數</th>
									<th>日期</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${donatedlog}" var="item">
									<tr>
										<td>
										<td><img src="${item.mphoto}"></td>
<%-- 										<td>${item.mid}</td> --%>
										<td>${item.name}</td>
										<td>${item.point}</td>
										<td>${item.date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	 </div>
	</div>
   </div>
 </div>
        <hr>

</div>

<jsp:include page="/top/footer.jsp"></jsp:include>
<!-- /.container -->

<!-- JS -->
<script src="/Artfolio/js/jquery-ui.min.js"></script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script> -->
<script src="/Artfolio/js/paging.js"></script>
<script>
	$('table','#point').addClass('table');
	var etb=$('tbody','#exchange');
	var type=$('select[name=type]',etb);
	var currentpoint=$('tr:first-child>td:last-child',etb).text();
	var point=$('input[name=point]',etb);
	var submit=$('input[type=submit]',etb);
	point.change(function(e){
		if(type.val()=='sell' && $(this).val()*1>currentpoint*1){
			submit.prop('disabled',true);
			$(this).next('span').text('not enough');
		}else{
			submit.prop('disabled',false);
			$(this).next('span').text('');
		}
	});
	type.change(function(){
		if(type.val()=='sell'){
			point.attr('max',currentpoint);
			point.val('');
		}else{
			point.attr('max','10000');
			point.val('');
		}
	});

	$(function(){
		$('#exchageTable').paging({limit:5});
		$('#giftTable').paging({limit:5});
		$('#giftedTable').paging({limit:5});
	});
</script>
</body>
</html>