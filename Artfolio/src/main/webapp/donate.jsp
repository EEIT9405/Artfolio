<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${notarget || empty targetname || empty targetid}">
			<h1>error</h1>
		</c:when>
		<c:otherwise>
			<form action="donate.controller" method="post">
				<table>
					<thead>
						<tr>
							<th colspan="2">donate</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>current point</td>
							<td>${point}</td>
						</tr>
						<tr>
							<td>target</td>
							<td>${targetname}(id=${targetid})<input type="hidden" name="targetid" value="${targetid}"></td>
						</tr>
						<tr>
							<td>point</td>
							<td><input name="point" type="number" min="10" max="${point}"
								step="10" required value="${param.point}"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="submit"><input
								type="reset" value="reset"><span></span></td>
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