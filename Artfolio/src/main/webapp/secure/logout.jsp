<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3;url=/Artfolio/index.jsp">
<title>登出畫面</title>

</head>
<body>
<c:set var="memberName" value="${ loginOK.name }" />
<c:remove var="loginOK" scope="session" />
<font color='blue' ><BR>
訪客${ memberName }，感謝您使用本系統。<BR>
您已經登出 3秒後將為您轉入首頁<BR>
<!-- <script> window.setInterval("location='${pageContext.request.contextPath}/bountyIndex.jsp'",3000); </script> -->
</font>
</body>
</html>