<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<link href="/Artfolio/css/style.css" rel="stylesheet">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/top/header.jsp"></jsp:include>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My folio
                    <small>my folio</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">我的作品</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
	<div class="row">
	<div class="col-md-12">
	<div id="point" >
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#exchange"
				aria-controls="exchange" role="tab" data-toggle="tab">exchange</a></li>
			<li role="presentation"><a href="#log" aria-controls="log"
				role="tab" data-toggle="tab">log</a></li>
			<li role="presentation"><a href="#log2" aria-controls="log2"
				role="tab" data-toggle="tab">log2</a></li>
			<li role="presentation"><a href="#log3" aria-controls="log3"
				role="tab" data-toggle="tab">log3</a></li>
		</ul>
		<div class="tab-content">
			<div id="exchange" role="tabpanel" class="tab-pane active">
				<form action="exchange.controller" method="post">
					<table>
						<thead>
							<tr>
								<th colspan="2">exchange</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>current point</td>
								<td>${main.point}</td>
							</tr>
							<tr>
								<td>type</td>
								<td>
									<select name="type" required>
										<option value="buy">buy</option>
										<option value="sell">sell</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>point</td>
								<td><input name="point" style="width:5em" type="number" min="10" max="10000" step="10" required value="${param.point}"><span>${msg}</span></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="submit"><input type="reset" value="reset"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div id="log" role="tabpanel" class="tab-pane">
				<c:choose>
					<c:when test="${not empty exchangelog}">
						<table>
							<thead>
								<tr>
									<th>point</th>
									<th>type</th>
									<th>date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${exchangelog}" var="item">
									<tr>
										<td>${item.point}</td>
										<td><c:choose>
												<c:when test="${item.ptype}">1</c:when>
												<c:otherwise>0</c:otherwise>
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
						<table>
							<thead>
								<tr>
									<th>icon</th>
									<th>id</th>
									<th>name</th>
									<th>point</th>
									<th>date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${donatelog}" var="item">
									<tr>
										<td><img src="${item.mphoto}"></td>
										<td>${item.mid}</td>
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
						<table>
							<thead>
								<tr>
									<th>icon</th>
									<th>id</th>
									<th>name</th>
									<th>point</th>
									<th>date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${donatedlog}" var="item">
									<tr>
										<td><img src="${item.mphoto}"></td>
										<td>${item.mid}</td>
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
<!-- container -->

<jsp:include page="/top/footer.jsp"></jsp:include>

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
</script>
</body>
</html>


