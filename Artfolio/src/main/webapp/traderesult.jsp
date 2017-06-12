<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>${msg}</p>
	<c:choose>
		<c:when test="${from=='exchange'}">
			<a href="point/log.controller">back to point page</a>
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