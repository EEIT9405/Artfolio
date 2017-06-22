<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet prefetch' href='/Artfolio/css/bootstrap.min.css'>
<link rel='/Artfolio/css/bootstrap-theme.min.css'>
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<style>
*{
	font-family:monospace 微軟正黑體;
	font-size:18px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty ermsg || empty targetname || empty targetid}">
			<h1>${ermsg}</h1>
		</c:when>
		<c:otherwise>
			<form action="/Artfolio/point/donate.controller" method="post">
				<table class="table table-">
					<thead>
						<tr>
							<th colspan="2">贊助作家</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>持有點數：</td>
							<td>${point}</td>
						</tr>
						<tr>
							<td>對象：</td>
							<td>${targetname}<input type="hidden" name="targetid" value="${targetid}"></td>
						</tr>
						<tr>
							<td>點數：</td>
							<td><input name="point" type="number" min="10" max="${point}"
								step="10" required value="${param.point}"></td>
						</tr>
						<tr style="text-align:center;">
							<td colspan="2"><input style="margin-right:5px;" class="btn btn-primary" type="submit" value="送出"><input
								class="btn btn-danger" type="reset" value="取消"><span></span></td>
						</tr>
					</tbody>
				</table>
			</form>
 		</c:otherwise>
	</c:choose>
</body>
<script>
var tb=$('tbody');
var currentpoint=$('tr:first-child>td:last-child',tb).text();
var point=$('input[name=point]',tb);
var submit=$('input[type=submit]',tb);
point.change(function(e){
	if($(this).val()*1>currentpoint*1){
		submit.prop('disabled',true);
		$(this).next('span').text('not enough');
	}else{
		submit.prop('disabled',false);
		$(this).next('span').text('');
	}
});
</script>
</html>