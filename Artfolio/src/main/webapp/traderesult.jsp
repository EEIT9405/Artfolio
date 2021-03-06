<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${from=='exchange'}">
<meta http-equiv="refresh" content="3; url=/Artfolio/point/log.controller">
</c:if>
<title>donate result</title>
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<script src="/Artfolio/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="margin:20px;">
	<h4>${msg}</h4>
	<c:choose>
		<c:when test="${from=='exchange'}">
			<h5>3秒後自動跳轉回原畫面。如無跳轉，請點選一下連結。</h5>
			<a href="/Artfolio/point/log.controller">回點數頁面</a>
		</c:when>
		<c:when test="${from=='donate'}">
			<form>
				<input class="btn btn-info" type="button" value="close">
			</form>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
	</div>
	<script>
		var c=document.querySelector('input[value=close]')
		if(c){
			c.onclick=function(){
				window.close();
			}
		}
	</script>
</body>
</html>