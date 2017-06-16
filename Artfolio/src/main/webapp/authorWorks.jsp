<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="/Artfolio/css/style.css" rel="stylesheet"> -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<style type="text/css">
.img-box {
  overflow: hidden;
  width: 180px;
  height: 180px;
  margin-top: 12px;
  margin-bottom: 12px;
  position: relative;
  box-shadow: 0px 15px 50px -15px;
  cursor:pointer;
}
.img-box img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 160%;
}

.btn-circle.btn-lg {
  width: 50px;
  height: 50px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.33;
  border-radius: 25px;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
.footer {
  padding-top: 40px;
  padding-bottom: 10px;
  background-color: #222;
  color: #999;
  font-size: 10px;
  letter-spacing: 1px;
}
.footer hr {
  background-color: #222;
  opacity: 0.1;
}

.title h3{
	text-align:center;
}
</style>

</head>
<body>
<!-- Navigation -->
<jsp:include page="top/header.jsp"></jsp:include>
<c:if test="${!empty loginOK }">
		<jsp:include page="top/pushPage.jsp"></jsp:include>
	</c:if>
<div class="container" style="height:auto; min-height:500px; margin-bottom:30px;">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">${targetBean.name} folio
                    <small>my folio</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/Artfolio/index.jsp">Home</a>
                    </li>
                    <li class="active">${targetBean.name}的作品集</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-2">
            	<div class="panel panel-default">
  					<div class="panel-body">
    					<div>
    						<img style="width:150px;" src="/img/${targetBean.mphoto}">
    					</div>
    					<div id="followCount">人氣：</div>
    					<div id="workCount">作品：</div>
  					</div>
				</div>
				
				<div class="panel panel-default">
  					<div class="panel-body">
    					<div style="margin-top:10px;">
					    	<button id="follow" class="btn btn-default" value="follow">追踪</button>
					    	<button id="block" class="btn btn-default">黑名單</button>
				    	</div>
  					</div>
				</div>

				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">導航</h3>
				  </div>
				  <div class="panel-body">
				  	<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					 	  排序
					    <span class="caret"></span>
					  </button>
					  <ul id="sortList" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn" tabindex="-1">依相簿</a></li>
					    <li role="presentation" class="divider"></li>
					    <li role="presentation" class="dropdown-header">依時間：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn timeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn timedown" tabindex="-1">遞減</a></li>
					    <li role="presentation" class="divider"></li>
					    <li role="presentation" class="dropdown-header">依人氣：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likedown" tabindex="-1">遞減</a></li>
					  </ul>
					</div>
				  </div>
				</div>
            </div>
            
	<div id="photoContainer" class="col-md-10" style="overflow-y:auto; height:450px;">
         <!-- Projects Row -->
        <div class="row">
	        
        </div>
        <!-- /.row -->
	</div>
	
	
        <hr>
</div>
</div>
<!-- /.container -->
<jsp:include page="top/footer.jsp"></jsp:include>

<!-- JS -->
<script src="/Artfolio/js/jquery.formatDateTime.min.js"></script>
<script>
$(function(){
	var sortbtn = $('#sortList').children('li.sortbtn');
	var photoContainer = $('#photoContainer>div.row');
	var mid = "${targetBean.mid}";
	var follow = $('#follow');
	var block = $('#block');
	
	listWork(mid, "alphabet", "ascending");
	getFollowCount();
	check();
	//載入作者資訊
	
	
	function check(){
		$.get('follow/check2.controller', function(data){
			if(data == 1){
				follow.val('unfollow');
				follow.removeClass('btn-default');
				follow.addClass('btn-info');
			}else {
				follow.val('follow');
				follow.removeClass('btn-info');
				follow.addClass('btn-default');
			}
		});
		
		
	}
	
	follow.click(function(){
		if(follow.val() == "follow"){
			$.post('follow/create.controller',function(data){
				alert(data);
				follow.val('unfollow');
				follow.removeClass('btn-default');
				follow.addClass('btn-info');
			});
		}else {
			$.post('follow/delete.controller', {followid:mid}, function(){
				follow.val('follow');
				follow.removeClass('btn-info');
				follow.addClass('btn-default');
			});	
		}
	});
	
	block.click(function(){
		$.post('block.controller', {mid:mid}, function(data){
			$.post('follow/delete.controller', {followid:mid}, function(){
				follow.val('follow');
				follow.removeClass('btn-info');
				follow.addClass('btn-default');
			});	
			alert(data);
			window.location.href='/Artfolio/index.jsp';
		});
	});
	
	sortbtn.click(function(){
		var sort = $(this).children('a');
		if(sort.hasClass('timeup')){
			listWork(mid, "date", "ascending");	
		}
		if(sort.hasClass('timedown')){
			listWork(mid, "date", "descending");	
		}
		if(sort.hasClass('likeup')){
			listWork(mid, "like", "ascending");
		}
		if(sort.hasClass('likedown')){
			listWork(mid, "like", "descending");
		}
	});
	
	function listWork(mid, orderby, order){
			photoContainer.empty();
		$.getJSON('searchByMid.controller', {mid:mid, orderby:orderby, order:order}, function(data){

			var documentFrag = $(document.createDocumentFragment());
			$.each(data, function(index, value){
				var col = $('<div class="col-sm-12 col-md-3 padding-0">');
				var imgbox = $('<div class="img-box">');
				var img = $('<img>');
				var edit = $('<div class="editer">');
				var photowid = $('<input name="wid" type="hidden">').val(value.wid);
				var title = $('<div class="title">');
				var h3 = $('<h3>');
				if(orderby == "alphabet"){
					h3.append(value.wtitle);
				}
				if(orderby == "date"){
					h3.append($.formatDateTime('yy-mm-dd' ,(new Date(value.wstart))));
				}
				if(orderby == "like"){
					h3.append("人氣：" + value.wlike);
				}
				
				
				title.append(h3);
				img.attr('src', value.picurl);
				img.attr('title',value.wtitle);
				imgbox.append(img);
				imgbox.append(edit);
				imgbox.append(photowid);
				col.append(imgbox);
				col.append(title);
				documentFrag.append(col);
			});
			photoContainer.append(documentFrag);
		});
	}
	
	function getFollowCount() {
		$.get('follow/getFollowCount.controller', {mid:mid}, function(data){
			$('#followCount').append(data.followCount);
			$('#workCount').append(data.workCount);
		});
	}
	
	
});
</script>
</body>
</html>