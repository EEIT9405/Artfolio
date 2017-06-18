<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Space</title>
<link href="/Artfolio/css/jquery.ui.css" rel="stylesheet">
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/jquery-ui.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}
.img-box {
  overflow: hidden;
  width: 180px;
  height: 180px;
  margin-top: 12px;
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
.editer {
	position:absolute;
	right:0;
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
.authorimg {
  overflow: hidden;
  width: 100%;
  height: 0;
  padding-bottom: 100%;
  margin-top: 12px;
  margin-bottom: 12px;
  position: relative;
}
.authorimg img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 160%;
}
.active{
	font-size:16px;
}
.wave {
	animation: wave 0.2s infinite;
}

@keyframes wave {
  0% {
    -webkit-transform: rotateZ(1deg);
            transform: rotateZ(1deg);
  }
  50% {
    -webkit-transform: rotateZ(-1deg);
            transform: rotateZ(-1deg);
  }
  100% {
    -webkit-transform: rotateZ(1deg);
            transform: rotateZ(1deg);
  }
}
.padding-0 {
	text-align:center;
}
.top-colleciton {
  background-image: url(https://livedemo00.template-help.com/magento_52963/skin/frontend/default/theme323k/images/bg_index.jpg);
  background-size: 100%;
  padding-top: 60px;
}
</style>

</head>
<body>
<!-- Navigation -->
<jsp:include page="top/header.jsp"></jsp:include>
<c:if test="${!empty loginOK }">
		<jsp:include page="top/pushPage.jsp"></jsp:include>
	</c:if>
	
<div class="container-fluid top-colleciton">
   <div class="row">
   	 <div class="col-md-1"></div>
   	 <div class="col-md-10">
		<h1 class="page-header">My folio <small>關注集</small></h1>
     </div>   
     <div class="col-md-1"></div>        
   </div>             
</div>
<br/>
<div class="container" style="height:auto; min-height:500px; margin-bottom:30px;">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="myWorks.jsp">我的作品</a></li>
                    <li><a href="likelist.jsp">喜愛作品</a></li>
                    <li class="active">追踪作家</li>

                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-2">
            	<div class="panel panel-default">
  						<div style="font-size:18px;" class="panel-body">
    					<div class="authorimg">
    						<img style="width:150px;" src="${loginOK.mphoto }">
    					</div>
    						<div id="followCount">人氣：</div>
    						<div id="workCount">作品：</div>
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
					    <li role="presentation" class="dropdown-header">依時間：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn timeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn timedown" tabindex="-1">遞減</a></li>
					    <li role="presentation" class="divider"></li>
					    <li role="presentation" class="dropdown-header">依名稱：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn nameup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn namedown" tabindex="-1">遞減</a></li>
					    <li role="presentation" class="divider"></li>
					  </ul>
					</div>
				  	<div style="margin-top:10px;">

				    	<a id="wedit" class="btn btn-default">編輯</a>
				    </div>
				  </div>
				</div>
            </div>
            
	 <div id="photoContainer" class="col-md-10" style="overflow-y:auto; height:500px;">
        <!-- Projects Row -->
        <div class="row">   
        </div>
        <!-- /.row -->
	</div>
    <hr>
 </div>
</div>
<jsp:include page="top/footer.jsp"></jsp:include>
<!-- /.container -->

<!-- JS -->
<script src="js/jquery.formatDateTime.min.js"></script>
<script>
$(function(){
	var wedit = $('#wedit');
	var sortbtn = $('#sortList').children('li.sortbtn');
	var photoContainer = $('#photoContainer>div.row');
	var mid = "${loginOK.mid}";
	
	list("date" ,"descending");	
	
	getFollowCount();
	
	function getFollowCount() {
		$.get('follow/getFollowCount.controller', {mid:mid}, function(data){
			$('#followCount').append(data.followCount);
			$('#workCount').append(data.workCount);
		});
	}
	//開啟編輯功能
	wedit.click(function(){
		var a1 = $('<a title="remove" class="btn btn-circle btn-danger glyphicon glyphicon-remove">');
		var editer = $('#photoContainer div.editer');
		var imgbox = photoContainer.find('div.img-box');
		
		if(wedit.text() == "編輯"){
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
				editer.eq(i).append(a1.clone());
			}
			imgbox.addClass('wave');
			wedit.text('取消');
		}else {
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
			}
			imgbox.removeClass('wave');
			wedit.text('編輯');
		}
	});
	//刪除或編輯

	$('#photoContainer').on('click', 'div.editer a', function(){
		var btn = $(this);
		if(btn.attr('title') == "remove"){
			var div=$(this).parents('div.img-box');
			$.post('follow/delete.controller',{followid:div.children('input[name=mid]').val()},function(data){
				if(data!='' && !data.followed)
					div.parent().remove();
				else
					alert('error');
			});
		}
	});
	

	
	sortbtn.click(function(){
		var sort = $(this).children('a');
		if(sort.hasClass('timeup')){
			list("date", "ascending");	
		}
		if(sort.hasClass('timedown')){
			list("date", "descending");	
		}
		if(sort.hasClass('nameup')){
			list("alphabet", "ascending");
		}
		if(sort.hasClass('namedown')){
			list("alphabet", "descending");
		}
	});
	
	function list(orderby, order){
			photoContainer.empty();
		$.getJSON('follow/get.controller', {orderby:orderby, order:order}, function(data){
			var documentFrag = $(document.createDocumentFragment());
			$.each(data, function(index, value){
					var col = $('<div class="col-sm-12 col-md-3 padding-0">');
					var imgbox = $('<div class="img-box img-thumbnail">');
					var edit = $('<div class="editer">');
					var photomid = $('<input name="mid" type="hidden">').val(value.mid);
					var title = $('<div class="title">');
					var img = $('<img>');
				$.getJSON('work/getNewDate.controller', {mid:value.mid}, function(newDate){
					img.attr('title','最後更新日: '+ $.formatDateTime('yy-mm-dd' ,new Date(newDate)));
					if((new Date() - newDate) < 604800000){
						imgbox.append($('<img style="width:25%; top:20px; left:20px; background-color:white; border-radius:100%;">').attr('src', '/Artfolio/img/new.svg'));
					}
				});	
					title.append($('<h3>').append($('<a>').text(value.name).attr('href','/Artfolio/getAuthor.controller?targetId='+value.mid)));
					img.attr('src', value.mphoto);
					imgbox.append(img);
					imgbox.append(edit);
					imgbox.append(photomid);
					col.append(imgbox);
					col.append(title);
					documentFrag.append(col);
			});
			photoContainer.append(documentFrag);
		});
	}
});
</script>
</body>
</html>