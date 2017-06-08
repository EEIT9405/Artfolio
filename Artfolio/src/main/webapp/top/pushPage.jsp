<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
<c:when test="${!empty loginOK }">
<div class="container-fluid" style="position:fixed; margin-top:80px; top:0; right:0; width:200px; height:500px;">
	<div><img class="img-thumbnail" src="/img/1495356333957IMG_4113.JPG"></div>
</div>
</c:when>
</c:choose>