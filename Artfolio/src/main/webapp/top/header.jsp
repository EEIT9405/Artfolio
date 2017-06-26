<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="/Artfolio/css/bootstrap-select.min.css">
<style type="text/css">
.userimg {
  overflow: hidden;
  width: 45px;
  height: 45px;
  padding-bottom: 100%;
  margin-top: 3px;
  margin-bottom: 3px;
  position: relative;
  border-radius:100%;
}
.userimg img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 140%; 
}
.search-box {
  overflow: hidden;
  width: 100%;
  margin-bottom: 20px;
  box-shadow: 0px 15px 50px -15px;
}
.search-box img {
  width: 100%;
}

</style>
</head>
<header class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <div class="navbar-header"><a style="font-weight:700; letter-spacing:2px;" class="navbar-brand" href="/Artfolio/index.jsp">ARTFOLIO</a></div>
      <div class="navbar-right">
<!--         <ul class="nav navbar-nav"> -->
		<c:choose>
			<c:when test="${!empty loginOK}">
		         <a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		         	<div class="userimg"><img src="${loginOK.mphoto }"></div>
		         </a>
	         </c:when>
	         <c:otherwise>
	         	 <a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		         	<div class="userimg"><img style="-webkit-filter:invert(1); width:100%;" src="/Artfolio/img/designer-512.png"></div>
		         </a>
	         </c:otherwise>
         </c:choose>
            <ul class="dropdown-menu">
	            <c:choose>
	              <c:when test="${!empty loginOK}">
		              <li><a href="/Artfolio/myWorks.jsp">我的作品</a></li>
		              <li><a href="/Artfolio/bounty/bountyDisplay.jsp">邀稿區</a></li>
		              <li><a href="/Artfolio/point/log.controller">點數區</a></li>
		              <li><a href="/Artfolio/mail/mailIndex.jsp">站內信<label style="float:right; background-color:red;color:white; width:20px; text-align:center; border-radius:100%;" id="mailCount"></label></a></li>
		              <li><a href="/Artfolio/information.jsp">個人資料</a></li>
		              <li><a href="/Artfolio/secure/logout.jsp">登出</a></li>
	              </c:when>
	              <c:otherwise>
		              <li><a href="/Artfolio/secure/login.jsp">登入</a></li>
		              <li><a href="/Artfolio/Member.jsp">註冊</a></li>
	              </c:otherwise>
	            </c:choose>
            </ul>
<!--         </ul> -->
      </div>
      <div class="col-md-5 navbar-right" style="margin:8px 10px 0 10px;">
		<form id="searceBar">
		<div class="input-group">
			<select class="selectpicker">
				<option value="title">標題</option>
				<option value="tag">標籤</option>
				<option value="advanced">進階</option>
			</select>
			<input name="searchContent" type="text" class="form-control" style="width:270px;">
			<span id="searchButton" class="input-group-btn" style="float:left;">
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

<div class="modal fade bs-example-modal-sm" id="searchmodal"
								tabindex="-1" role="dialog" aria-labelledby="searchmodalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header" style="text-align: left">
				<button type="button" class="close" id="closesearch" aria-label="Close">
				<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="searchmodalLabel">進階搜尋</h4>
			</div>
			<div class="modal-body">
				<div id="search" class="row">
					<form>
						<table class="table">
							<tbody style="font-size:16px;">
								<tr>
									<td>類別</td>
									<td>
										<select name="type">
											<option value="title">標題</option>
											<option value="content">標題+內文</option>
											<option value="tag">標籤</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>包含</td>
									<td><input type="text" name="and"></td>
								</tr>
								<tr>
									<td>或含</td>
									<td><input type="text" name="or"></td>
								</tr>
								<tr>
									<td>不含</td>
									<td><input type="text" name="not"></td>
								</tr>
								<tr>
									<td>排序</td>
									<td>
										<select name="orderby">
											<option value="like" selected>人氣</option>
											<option value="date">日期</option>
											<option value="alphabet">字順</option>
										</select>
										<select name="order">
											<option value="descending" selected>遞減</option>
											<option value="ascending">遞增</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>期間</td>
									<td>
										<select name="period">
											<option value="day">過去一天</option>
											<option value="week">過去一週</option>
											<option value="month">過去一月</option>
											<option value="year" selected>過去一年</option>
										</select>
									</td>
								</tr>
								<tr style="text-align:center;"><td colspan="2"><button class="btn btn-success" type="button" value="submit">搜尋</button></td></tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/Artfolio/js/bootstrap-select.min.js"></script>
<script src='/Artfolio/js/masonry.pkgd.min.js'></script>
<script src='/Artfolio/js/imagesloaded.pkgd.min.js'></script>
<script src='/Artfolio/js/jquery.lazyload.min.js'></script>
<script>

	$(document).ajaxStart(function(){
		timestart=window.setTimeout(function(){
			if(!document.getElementById('loading'))
			$('<div id="loading" style="text-align:center;position: fixed; top: 0;right: 0;bottom: 0;left: 0'+
			';z-index: 2000;"><img style="border-radius:10%; width:300px; opacity:0.8; margin-top:100px;" src="/Artfolio/img/01-progress.gif"></div>').appendTo($('body'));
		},1000);
		
	});

	$(document).ajaxStop(function(){
		 window.clearTimeout(timestart);
		$('#loading').remove();
		
		
		$("img.lazy").lazyload({
		    effect : "fadeIn",
		    load:f_masonry
		});
		
		var searchResult = $('#searchResult');
		searchResult.masonry('destroy');
		function f_masonry() {
			searchResult.imagesLoaded(function(){
				searchResult.masonry({        
		            itemSelector: 'div.item',
		            percentPosition: true,
		            isFitWidth: false,
 		            isAnimated: true
		        });
				
			});
		}
	});
	
	$(function(){
		var searchTitle = $('#showWorksArea').find('h1');
		var searchButton = $('#searchButton');
		var searceBar = $('#searceBar');
		var searchResult = $('#searchResult');
		var closesearch = $('#closesearch');
		
		searceBar.find('select').change(function(){
			if(searceBar.find('select').find(':selected').val() == "advanced"){
				$('#searchmodal').modal(
						{backdrop : 'static'}
				);
			}	
		});
		
		closesearch.click(function(){
			$('#searchmodal').modal('hide');
			searceBar.find('select').children('option[value="title"]').prop('selected', true);
			searceBar.find('button').attr('title', '標題');
			searceBar.find('button span.filter-option').text('標題');
		});
		
		$('button[value=submit]','#search').click(function(){
			searchResult.empty();
			var queryString=$('form','#search').serialize();
			if(!document.getElementById('searchResult')){
				window.open('/Artfolio/index.jsp?'+queryString.replace('&and=','&andCondition=')
						.replace('&or=','&orCondition=').replace('&not=','&notCondition='),'_self')	
			}
			
			$.get('search.controller',queryString,function(data){
				var docFrag = $(document.createDocumentFragment()); 
				searchTitle.text('Search results: ' + data.length + ' items.');
				$.each(data, function(index, value){
					var div = $('<div class="col-sm-12 col-md-3 padding-0 item" style="margin-bottom:12px;">');
					var imgbox = $('<div style="cursor:pointer;" class="search-box">');
					var img = $('<img class="lazy">').attr('data-original', value.picurl);
					var widHidden = $('<input type="hidden" name="wid">').val(value.wid);
					imgbox.append(img);
					imgbox.append(widHidden);
					div.append(imgbox);
					docFrag.append(div);
				});
				searchResult.append(docFrag);
				
			})
			$('#searchmodal').modal('hide');
			var search = $('#search');
			search.find('input[name="and"]').val('');
			search.find('input[name="or"]').val('');
			search.find('input[name="not"]').val('');
			searceBar.find('select').children('option[value="title"]').prop('selected', true);
			searceBar.find('button').attr('title', '標題');
			searceBar.find('button span.filter-option').text('標題');
			$('#testA>a')[0].click();
		});
		
		searchButton.click(function(){
			var searchContent = $('input[name="searchContent"]').val();
			var searchType = searceBar.find('select').find(':selected').val();
			if(!document.getElementById('searchResult')){
				window.open('/Artfolio/index.jsp?type='+searchType.trim()+'&andCondition='+encodeURIComponent(searchContent.trim()),'_self')	
			}
			
			searchResult.removeAttr('style');
			searchResult.empty();
			$.getJSON('search.controller',{type:searchType,and:searchContent,period:'year'}, function(data){
				var docFrag = $(document.createDocumentFragment()); 
				searchTitle.text('Search '+searchContent+': ' + data.length + ' items.');
				$.each(data, function(index, value){
					var div = $('<div class="col-sm-12 col-md-3 padding-0 item" style="margin-bottom:12px;">');
					
					var imgbox = $('<div style="cursor:pointer;" class="search-box">');
					var img = $('<img class="lazy">').attr('data-original', value.picurl);
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
		
		$('input[name="searchContent"]').keydown(function(e){
			if(e.keyCode==13){
			e.preventDefault();
			searchButton.get(0).click();
			}
		});
		
		var mailmid = '${mid}';
		var mailCount = $('#mailCount');
		$.get('/Artfolio/mail/mailDisplay.controller',{targetId:mailmid,ShowReadOrDelete:"unread"},function(data){
			mailCount.empty();
			var d = JSON.parse(data);
			if(d.length > 0){
				mailCount.text(d.length);
			}
		});
		
	});
</script>