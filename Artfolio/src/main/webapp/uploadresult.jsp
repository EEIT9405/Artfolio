<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3; url=/Artfolio/work.jsp">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty uploadmsg}">
			<h5>上傳成功。3秒後自動跳轉回原畫面。如無跳轉，請點選一下連結。</h5>
			<a href="/Artfolio/work.jsp">回上傳頁面</a>
		</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th>errors</th>
				</tr>
				<c:forEach items="${uploadmsg}" var="item">
					<c:forEach items="${item}" var="entry">
						<tr>
							<td>${entry}</td>
						</tr>

					</c:forEach>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>