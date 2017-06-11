<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <div class="navbar-header"><a class="navbar-brand" href="#">ARTFOLIO</a></div>
      <div class="navbar-right">
        <ul class="nav navbar-nav">
         <a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img style="width:40px; margin:5px; margin-left:100px;" src="/img/designer-512.png"></a>
            <ul class="dropdown-menu">
	            <c:choose>
	              <c:when test="${!empty loginOK}">
		              <li><a href="#">我的作品</a></li>
		              <li><a href="#">FOLLOW</a></li>
		              <li><a href="#">LIKE</a></li>
		              <li><a href="#">MAIL</a></li>
		              <li><a href="#">POINT</a></li>
		              <li><a href="#">邀稿區</a></li>
		              <li><a href="#">黑名單</a></li>
		              <li><a href="#">個人資料</a></li>
		              <li><a href="#">登出</a></li>
	              </c:when>
	              <c:otherwise>
		              <li><a href="#">登入</a></li>
		              <li><a href="#">註冊</a></li>
	              </c:otherwise>
	            </c:choose>
            </ul>
        </ul>
      </div>
      <div class="col-md-3 navbar-right" style="margin:8px 10px 0 10px;">
		<div class="input-group">
			<input type="text" class="form-control">
			<span class="input-group-btn">
			<a class="btn btn-default"><i class="glyphicon glyphicon-search"></i></a>
			</span>
		</div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->  
      <div class="col-md-1"></div>
    </div>
  </div>
</header>