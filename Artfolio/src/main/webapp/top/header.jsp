<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="/Artfolio/css/bootstrap-select.min.css">
<script src="/Artfolio/js/bootstrap-select.min.js"></script>
</head>
<header class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <div class="navbar-header"><a style="font-weight:700; letter-spacing:2px;" class="navbar-brand" href="/Artfolio/index.jsp">ARTFOLIO</a></div>
      <div class="navbar-right">
        <ul class="nav navbar-nav">
         <a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img style="width:40px; margin:5px; margin-left:100px;" src="/img/designer-512.png"></a>
            <ul class="dropdown-menu">
	            <c:choose>
	              <c:when test="${!empty loginOK}">
		              <li><a href="/Artfolio/myWorks.jsp">我的作品</a></li>
		              <li><a href="#">邀稿區</a></li>
		              <li><a href="/Artfolio/point/log.controller">點數區</a></li>
		              <li><a href="#">站內信</a></li>
		              <li><a href="/Artfolio/information.jsp">個人資料</a></li>
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
		<form id="searceBar">
		<div class="input-group">
			<select class="selectpicker">
				<option value="title">標題</option>
				<option value="tag">標籤</option>
			</select>
			<input name="searchContent" type="text" class="form-control">
			<span id="searchButton" class="input-group-btn">
			<a class="btn btn-default"><i class="glyphicon glyphicon-search"></i></a>
			</span>
		</div><!-- /input-group -->
		</form>
	  </div><!-- /.col-lg-6 -->  
      <div class="col-md-1"></div>
    </div>
  </div>
  <div id="testA">
  <a  href="#showWorksArea" onclick=""></a>
  </div>
</header>
<script>
	$(function(){
		var searchButton = $('#searchButton');
		var searceBar = $('#searceBar');
		var searchResult = $('#searchResult');
		
		searchButton.click(function(){
			var searchContent = $('input[name="searchContent"]').val();
			var searchType = searceBar.find('select').find(':selected').val();
			searchResult.empty();
			$.get('search.controller',{type:searchType,and:searchContent}, function(data){
				var docFrag = $(document.createDocumentFragment()); 
				$.each(data, function(index, value){
					var div = $('<div class="col-sm-12 col-md-3 padding-0">');
					var imgbox = $('<div style="cursor:pointer;" class="img-box">');
					var img = $('<img>').attr('src', value.picurl);
					var widHidden = $('<input type="hidden" name="wid">').val(value.wid);
					imgbox.append(img);
					imgbox.append(widHidden);
					div.append(imgbox);
					docFrag.append(div);
				});
				searchResult.append(docFrag);
			});
			$('#testA>a')[0].click();
			$('input[name="searchContent"]').val('');
		});
	});
</script>