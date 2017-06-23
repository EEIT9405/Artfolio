<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${targetBean.name}'s folio</title>
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
<script src='/Artfolio/js/sweetalert.min.js'></script>
<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}
.img-box {
	overflow: hidden;
	width: 180px;
	height: 180px;
	margin:0 auto;
	margin-top: 12px;
	position: relative;
	box-shadow: 0px 15px 50px -15px;
	cursor: pointer;
}

.img-box img {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width: 160%;
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
	position: absolute;
	right: 0;
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

.title h3 {
	text-align: center;
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
.padding-0 {
	text-align:center;
}
.top-colleciton {
  background-image: url(/Artfolio/img/bg_index.jpg);
  background-size: 100%;
  padding-top: 60px;
}
#photoContainer {
	overflow-y:auto;
	height:800px;
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
		<h1 class="page-header">${targetBean.name}'s folio <small>作品集</small>
                </h1>
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
                    <li><a href="/Artfolio/index.jsp">Home</a>
                    </li>
                    <li class="active">${targetBean.name}的作品</li>
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
    						<img style="width:150px;" src="${targetBean.mphoto}">
    					</div>
    					<div id="followCount">人氣：<span></span></div>
    					<div id="workCount">作品：<span></span></div>
  					</div>
				</div>
				
				<div class="panel panel-default">
  					<div class="panel-body">
    					<div style="margin-top:10px; text-align:center;">
					    	<button id="follow" class="btn btn-default" value="follow" style="margin-bottom:5px;">追踪</button>
					    	<button id="block" class="btn btn-default" style="margin-bottom:5px;">封鎖</button>
					    	<button id="mail" class="btn btn-success">寄信</button>
					    	<button id="donate" class="btn btn-default">贊助</button>
				    	</div>
  					</div>
				</div>

				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">導航</h3>
				  </div>
				  <div class="panel-body" >
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
					    <li role="presentation" class="dropdown-header">依人氣：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likedown" tabindex="-1">遞減</a></li>
					  </ul>
					</div>
					<div style="margin-top:10px;">
				  		<a id="works" style="margin-bottom:5px;" class="btn btn-default">作品</a>
				  		<a id="album" style="margin-bottom:5px;" class="btn btn-info">相簿</a>
				    </div>
				  </div>
				</div>
            </div>
            
	<div id="photoContainer" class="col-md-10">
         <!-- Projects Row -->
        <div class="row">
	        
        </div>
        <!-- /.row -->
	</div>
	
	
        <hr>
</div>
</div>
<!-- /.container -->
	<div class="modal fade bs-example-modal-sm" id="mailmodal"
								tabindex="-1" role="dialog" aria-labelledby="mailmodalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header" style="text-align: left">
										<button type="button" class="close" id="closemail" aria-label="Close">
										<span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="mailmodalLabel">郵件</h4>
									</div>
									<div class="modal-body">
										<div class="row">
											<form id='mailForm'>
												<div class="form-group">
													<span>主旨：</span>
													<input type="text" name="mailtitle" value=""><br><br>
													<textarea class="form-control" rows="5"
														cols="30" name="mailcontent"></textarea>
														<input type="hidden" name="toId" value="${targetBean.mid}">
														<input type="hidden" name="mstatus" value="1">
													<div class="pull-right">
														<input type="button" class="btn btn-primary disabled"
															name="mailSubmit" value="送出" disabled> <input
															type="button" class="btn btn-default disabled"
															name="mailCancel" value="取消" disabled>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
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
	var mail = $('#mail');
	var donate = $('#donate');
	var closemail = $('#closemail');
	var mailcontent = $('textarea[name="mailcontent"]');
	var mailSubmit = $('input[name="mailSubmit"]');
	var mailCancel = $('input[name="mailCancel"]');
	var mailtitle = $('input[name="mailtitle"]');
	
	listWork(mid, "alphabet", "ascending");
	getFollowCount();
	check();
	//載入作者資訊
	
	
	mail.click(function(){
		$('#mailmodal').modal(
				{backdrop : 'static'}
		);
	});
	
	donate.click(function(){
		window.open('point/donate.controller?targetid='+mid,'donate','height=300,width=300');
	});
	
	closemail.click(function() {
		mailcontent.val('');
		mailtitle.val('');
		$('#mailmodal').modal('hide');
	});
	
	mailcontent.keyup(function() {
		changeBtnDisableMail();
	});

	mailcontent.mouseout(function() {
		changeBtnDisableMail();
	});
	
	mailSubmit.click(function() {
		if(mid != null){
			$.post('/Artfolio/sendToAuthorMail.controller', $('#mailForm').serialize(), function(data){
				$('#mailmodal').modal('hide');
				if(data == "已成功寄出"){
					swal('成功',data,'success');
				}
			});
		}else {
			swal('錯誤',"請登入後重試",'error');
		}
		mailtitle.val('');
		mailcontent.val('');
		$('#mailmodal').modal('hide');
	});

	mailCancel.click(function() {
		mailcontent.val('');
		mailtitle.val('');
		changeBtnDisableMail();
	});
	
	function changeBtnDisableMail() {
		if (mailcontent.val().length <= 0) {
			mailSubmit.addClass('disabled');
			mailSubmit.prop('disabled', true);
			mailCancel.addClass('disabled');
			mailCancel.prop('disabled', true);
		} else if (mailcontent.val().length > 0) {
			mailSubmit.removeClass('disabled');
			mailSubmit.prop('disabled', false);
			mailCancel.removeClass('disabled');
			mailCancel.prop('disabled', false);
		}
	}
	
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
				if(data == "追踪成功"){
					swal('成功',data,'success');
				}else {
					swal('錯誤',data,'error');
				}
				follow.val('unfollow');
				follow.removeClass('btn-default');
				follow.addClass('btn-info');
				getFollowCount();
			});
		}else {
			$.post('follow/delete.controller', {followid:mid}, function(){
				follow.val('follow');
				follow.removeClass('btn-info');
				follow.addClass('btn-default');
				getFollowCount();
			});	
		}
// 		followCount.empty();
// 		workCount.empty();
		
	});
	
	block.click(function(){
		$.post('block.controller', {mid:mid}, function(data){
			$.post('follow/delete.controller', {followid:mid}, function(){
				follow.val('follow');
				follow.removeClass('btn-info');
				follow.addClass('btn-default');
			});	
			if(data == '錯誤'){
				swal('錯誤','error','error');
			}else{
				window.location.href='/Artfolio/index.jsp';
			}
		});
		getFollowCount();
	});
	
	function album(mid) {
		photoContainer.empty();
		$.get('album/get.controller', {
			mid : mid
		}, function(data) {
			var documentFrag = $(document.createDocumentFragment());
			$.each(data, function(index, value) {
				var col = $('<div class="col-sm-12 col-md-3 padding-0">');
				var imgbox = $('<div class="img-box img-thumbnail">');
				var img = $('<img>');
				var imgbox2 = $('<div style="position:absolute; top:-7px; left:24px; z-index:-1;" class="img-box img-thumbnail">');
				var img2 = $('<img>').attr('src','/Artfolio/img/white2.jpg');
				var imgbox3 = $('<div style="position:absolute; top:-17px; left:18px; z-index:-2;" class="img-box img-thumbnail">');
				var img3 = $('<img>').attr('src','/Artfolio/img/gray.jpg');
				var edit = $('<div class="editer">');
				var photowid = $('<input name="aid" type="hidden">').val(
						value.aid);
				var title = $('<div class="title">');
				var h3 = $('<h3>');
				h3.append(value.aname);
				title.append(h3);
				$.get('record/getw.controller', {
					wid : value.wid
				}, function(data) {
					img.attr('src', data.picurl);
				});
				imgbox2.append(img2);
				imgbox3.append(img3);
				img.attr('title', value.aname);
				imgbox.append(img);
				imgbox.append(edit);
				imgbox.append(photowid);
				imgbox.click(function() {
					listWorkByAid(value.aid);
				});
				col.append(imgbox);
				col.append(imgbox2);
				col.append(imgbox3);
				col.append(title);
				documentFrag.append(col);
			});
			photoContainer.append(documentFrag);
		});
	}

	function listWorkByAid(aid) {
		photoContainer.empty();
		$.getJSON('searchByAid.controller', {
			aid : aid
		}, function(data) {
			var documentFrag = $(document.createDocumentFragment());
			$.each(data, function(index, value) {
				var col = $('<div id="'+value.wid+'" class="col-sm-12 col-md-3 padding-0">');
				var imgbox = $('<div class="img-box img-thumbnail">');
				var img = $('<img>');
				var edit = $('<div class="editer">');
				var photowid = $('<input name="wid" type="hidden">').val(
						value.wid);
				var title = $('<div class="title">');
				var h3 = $('<h3>');
				h3.append(value.wtitle);
				title.append(h3);
				img.attr('src', value.picurl);
				img.attr('title', value.wtitle);
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
	
	$('#album').click(function(){
		album(mid);
	});
	
	$('#works').click(function(){
		listWork(mid, "alphabet", "ascending");
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
				var imgbox = $('<div class="img-box img-thumbnail">');
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
	
	var followCount = $('#followCount>span');
	var workCount = $('#workCount>span');
	
	function getFollowCount() {
		$.get('follow/getFollowCount.controller', {mid:mid}, function(data){
			followCount.text(data.followCount);
			workCount.text(data.workCount);
		});
	}
	
	
});
</script>
<jsp:include page="top/modal.jsp"></jsp:include>
</body>
</html>