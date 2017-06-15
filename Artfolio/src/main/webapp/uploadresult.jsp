<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty uploadmsg}">done successfully</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th>errors</th>
				</tr>
				<c:forEach items="${uploadmsg}" var="item">
					<tr><th>${item.filename}</th></tr>
					<c:forEach items="${item}" var="entry">
						<c:choose>
							<c:when test="${entry.key=='filename'}">
							</c:when>
							<c:otherwise>
								<tr>
									<td>${entry.value}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>