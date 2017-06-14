<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3; url=point/log.controller">
<title>Insert title here</title>
</head>
<body>
	<h4>${msg}</h4>
	<c:choose>
		<c:when test="${from=='exchange'}">
			<h5>3秒後自動跳轉回原畫面。如無跳轉，請點選一下連結。</h5>
			<a href="point/log.controller">回點數頁面</a>
		</c:when>
		<c:when test="${from=='donate'}">
			<form>
				<input type="button" value="close">
			</form>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
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