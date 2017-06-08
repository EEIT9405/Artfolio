<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<h3><a href="index.jsp">ARTFOLIO</a></h3>
			</div>
			<div class="dropdown navbar-right">
				<img class="img-circle btn btn-link dropdown-toggle account" data-toggle="dropdown" aria-expanded="ture" src="/img/designer-512.png">
				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					<c:choose>
					<c:when test="${empty loginOK}">
					<a class="btn btn-link" role="presentation">登入</a><br>
					<li class="btn btn-link" role="presentation">註冊</li><br>
					</c:when>
					<c:otherwise>
					<li class="btn btn-link" role="presentation">我的作品</li><br>
					<li class="btn btn-link" role="presentation">FOLLOW</li><br>
					<li class="btn btn-link" role="presentation">LIKE</li><br>
					<li class="btn btn-link" role="presentation">MAIL</li><br>
					<li class="btn btn-link" role="presentation">POINT</li><br>
					<li class="btn btn-link" role="presentation">邀稿區</li><br>
					<li class="btn btn-link" role="presentation">黑名單</li><br>
					<li class="btn btn-link" role="presentation">個人資料</li><br>
					<li class="btn btn-link" role="presentation">登出</li><br>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="input-group navbar-right">
				<input type="text" class="form-control" placeholder="search">
			</div>
		</div>
	</nav>
</header>