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
<link rel="stylesheet" href="/Artfolio/css/workWindow.css">
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/jquery-ui.min.js"></script>
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
		<h1 class="page-header">My folio <small>作品集</small></h1>
     </div>   
     <div class="col-md-1"></div>        
   </div>             
</div>
<br/> 
<div class="container" style="height:auto; min-height:800px; margin-bottom:30px;">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="/Artfolio/index.jsp">Home</a></li>
                    <li class="active">我的作品</li>
                    <li><a href="/Artfolio/likelist.jsp">喜愛作品</a></li>
                    <li><a href="/Artfolio/followlist.jsp">追踪作家</a></li>
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
					    <li role="presentation" class="dropdown-header">依人氣：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likedown" tabindex="-1">遞減</a></li>
					     <li role="presentation" class="divider"></li>
					    <li role="presentation" class="dropdown-header">依標題：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn abup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn abdown" tabindex="-1">遞減</a></li>
					  </ul>
					</div>
				  	<div style="margin-top:10px;">
				  		<a id="works" style="margin-bottom:5px;" class="btn btn-default">作品</a>
				  		<a id="album" style="margin-bottom:5px;" class="btn btn-info">相簿</a>
				    	<a id="wupload" href="/Artfolio/work.jsp" class="btn btn-primary">上傳</a>
				    	<a id="wedit" class="btn btn-default">編輯</a>
				    </div>
				  </div>
				</div>
            </div>
            
		 <div id="photoContainer" class="col-md-10" >
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

<div class="modal fade " id="EditModal" tabindex="-1" role="dialog"
	aria-labelledby="EditModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" id="closeModal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="EditModalLabel">編輯作品</h4>
			</div>
			<div class="modal-body">
				<div class="row">
				<div id="dt" class="col-md-4" style="border:solid 1px silver; margin-bottom:5px; margin-right:10px; padding-bottom:5px; color:siver;">
					<form>
						<table>
							<thead>
								<tr>
									<th colspan="2">編輯</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2"><div id="modalimage"></div></td>
								</tr>
								<tr>
									<td>標題</td>
									<td><input type="text" name="wtitle" required></td>
								</tr>
								<tr>
									<td>內文</td>
									<td><textarea name="winfo"></textarea></td>
								</tr>
								<tr>
									<td>相簿</td>
									<td><select name="aid"></select><input type="hidden"
										name="aname"><input class="btn btn-xs btn-primary" type="button" name="new"
										value="新增"></td>
								</tr>
								<tr>
									<td>開放留言</td>
									<td><input type="checkbox" name="iswmsg" value="true"
										checked></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center"><input class="btn btn-sm btn-success" type="button" value="submit"></td>
								</tr>
							</tbody>
						</table>
						<span></span>
					</form>
				</div>
				<div id="sc" class="col-md-4" style="border:solid 1px silver; margin-bottom:5px; margin-right:10px; padding-bottom:5px; color:siver; max-width:215px;">
					<form>
						<table>
							<thead>
								<tr>
									<td><input type="checkbox" name="isscore" value="true">
										開放評分，現有版本： <input type="hidden"
										name="scoreversion"> <span></span></td>
								</tr>
							</thead>
							<tbody class="hide">
								<tr>
									<td>一<input type="text" name="score_1"></td>
								</tr>
								<tr>
									<td>二<input type="text" name="score_2"></td>
								</tr>
								<tr>
									<td>三<input type="text" name="score_3"></td>
								</tr>
								<tr>
									<td>四<input type="text" name="score_4"></td>
								</tr>
								<tr>
									<td>五<input type="text" name="score_5"></td>
								</tr>
								<tr>
									<td style="text-align: center; margin-top:5px;"><input class="btn btn-sm btn-success" type="button"
										value="submit">
									<td>
								</tr>
							</tbody>
						</table>
						<span></span> <input type="hidden" name="wid">
					</form>

				</div>
				
				<div class="col-md-4">
					<form id="stats">
						版本：<select name="selectedversion" style="width:50px; margin-right:10px;"></select> 看評分：<button type="button" class="btn btn-primary btn-sm"
							name="switch" value="showstats"><i class="glyphicon glyphicon-info-sign"></i></button>
						<table class="hide table table-border">
							<thead>
								<tr>
									<th>item</th>
									<th>max</th>
									<th>min</th>
									<th>ave</th>
									<th>dev</th>
									<th>sum</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				</div>
				<div style="height: 100px" id="tag" class="row">
					<div class="col-md-10">
						<div class="row">
						<form>
							<ul style="height: 110px;" class="col-md-4">
								<li class="tag"></li>
							</ul>


							<div id="edittag" class="itagh col-md-4">
								<input type="hidden" name="targettag">
								
								<input class="btn btn-default btn-lg" type="button" name="lock" value="lock">
								<input class="btn btn-default btn-lg" type="button" name="delete" value="delete">
								<button style="float:right;" class="btn btn-default btn-lg" type="button" value="cancel">結束</button> <span></span>
							</div>
							<div id="addtag" class="itagh col-md-4" style="float:right;">
								<input type="text" name="tag" value="" style="width:15em">
								<button class="btn btn-primary" type="button" name="add"
									value="add">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
								<button class="btn btn-danger" type="button" value="cancel">
									<span class="glyphicon glyphicon-remove"></span>
								</button>
								<span></span>
							</div>
						</form>
						</div>
					</div>
					<div style="margin-top: 50px;" class="col-md-2">
						<button style="margin-left: 0;" class="btn btn-primary"
							type="button" value="addtag">
							<span style="font-size: 15px;" class="glyphicon glyphicon-tag"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- JS -->
<script src="/Artfolio/js/jquery.formatDateTime.min.js"></script>
<script>
$(function(){
	var wedit = $('#wedit');
	var sortbtn = $('#sortList').children('li.sortbtn');
	var photoContainer = $('#photoContainer>div.row');
	var mid = "${loginOK.mid}";
	
	listWork(mid, "alphabet", "ascending");
	getFollowCount();
	//開啟編輯功能
	wedit.click(function(){
		var a1 = $('<a title="remove" class="btn btn-circle btn-danger glyphicon glyphicon-remove">');
		var a2 = $('<a title="edit" class="btn btn-circle btn-primary glyphicon glyphicon-pencil">');
		var editer = $('#photoContainer div.editer');
		var imgbox = photoContainer.find('div.img-box');
		a1.click(doDelete);
		a2.click(doEdit);
		
		if(wedit.text() == "編輯"){
			for(var i=0; i<editer.length; i++){
				var current=editer.eq(i);
				current.empty();
				if(current.next('input[name=aid]').length && current.prev('img').attr('title')=='default')
					;
				else{
					current.append(a1.clone(true));
					current.append(a2.clone(true));
				}
			}
			imgbox.addClass('wave');
			photoContainer.sortable({stop: function(event, ui) {
			    result = photoContainer.sortable("toArray");
			}});
			wedit.text('完成');
		}else {
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
			}
			wedit.text('編輯');
			imgbox.removeClass('wave');
			photoContainer.sortable('destroy');
			if(result[0].trim().length != 0){
				console.log(result);
				jQuery.ajaxSettings.traditional = true;
				$.post('album/sortAlbum.controller', {albumSort:result}, function(data){
					console.log(data);
				});
			}
		}
	});
	//刪除或編輯
	
	//	photoContainer.on('click', 'div.editer a',doEdit );
	
	function doDelete(e){
		e.stopPropagation();
		var btn = $(this);
		var div=$(this).parents('div.img-box');
		var aid=div.children('input[name=aid]').val();
		if(aid){
			swal({
				  title: "真的要刪除此相簿嗎？",
				  text: "刪除後將無法復原",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, delete it!",
				  closeOnConfirm: false
				},function(isConfirm){
					if(isConfirm){
						$.post('album/delete.controller',{aid:aid},function(data){
							if(data){
								div.parent().remove();
								swal('成功','刪除成功','success');
							}
							else
								swal('失敗','刪除失敗','error');
						});
					}
				});
		}
		else{
			var wid=div.children('input[name=wid]').val();
			swal({
				  title: "真的要刪除此作品嗎？",
				  text: "刪除後將無法復原",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, delete it!",
				  closeOnConfirm: false
				},function(isConfirm){
					if(isConfirm){
						$.post('work/delete.controller',{wid:wid},function(data){
							if(data){
								div.parent().remove();
								swal('成功','刪除成功','success');
							}
							else
								swal('失敗','刪除失敗','error');
						});
					}
				});
		}
	}
	function doEdit(e){
			e.stopPropagation();
			var btn = $(this);
			var div=$(this).parents('div.img-box');
			var aid=div.children('input[name=aid]').val();
			if(aid){
				swal({
					  title: "請輸入",
					  text: "請在下方輸入新名稱:",
					  type: "input",
					  showCancelButton: true,
					  closeOnConfirm: false,
					  animation: "slide-from-top",
					  inputValue: div.parent().find('h3').text()
					},
					function(newname){
						if(newname===null)
							;
						else{
							if(newname===false){
								return;
							}
							newname=newname.trim();
							if(newname!=='' && newname!=='default'){
								$.post('album/update.controller',{aid:aid,aname:newname},function(data){
									if(data){
										div.children('img').attr('title',newname);
										div.next('.title').children('h3').text(newname);
										swal('成功','相簿名稱修改完成','success');
									}else
										swal('失敗','相簿名稱修改失敗','error');
								});
							}else if(newname=='')
								swal('警告','相簿名稱不得為空白','warning');
							else if(newname=='default')
								swal('警告','不得使用預設名稱『default』','warning');
							else
								swal('錯誤','不知名的錯誤','error');
						}
					});
			}
			else{
				var mb = $('#modalimage').empty();
				div.children('img').clone().attr("style","max-width:100%;max-height:500px")
					.appendTo(mb);
				showModal(div.children('input[name=wid]').val());
			}
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
		$('#album').click(function(){
			album(mid);
			wedit.text('編輯');
			photoContainer.sortable('destroy');
		});
		
		$('#works').click(function(){
			listWork(mid, "alphabet", "ascending");
			wedit.text('編輯');
			photoContainer.sortable('destroy');
		});
		
		sortbtn.click(function() {
			var sort = $(this).children('a');
			if (sort.hasClass('timeup')) {
				listWork(mid, "date", "ascending");
			}
			if (sort.hasClass('timedown')) {
				listWork(mid, "date", "descending");
			}
			if (sort.hasClass('likeup')) {
				listWork(mid, "like", "ascending");
			}
			if (sort.hasClass('likedown')) {
				listWork(mid, "like", "descending");
			}
			if (sort.hasClass('abup')) {
				listWork(mid, "alphabet", "ascending");
			}
			if (sort.hasClass('abdown')) {
				listWork(mid, "alphabet", "descending");
			}
			wedit.text('編輯');
			photoContainer.sortable('destroy');
		});

		function listWork(mid, orderby, order) {
			photoContainer.empty();
			$.getJSON('searchByMid.controller', {
				mid : mid,
				orderby : orderby,
				order : order
			}, function(data) {
				var documentFrag = $(document.createDocumentFragment());
				$.each(data, function(index, value) {
					var col = $('<div class="col-sm-12 col-md-3 padding-0">');
					var imgbox = $('<div class="img-box img-thumbnail">');
					var img = $('<img>');
					var edit = $('<div class="editer">');
					var photowid = $('<input name="wid" type="hidden">').val(
							value.wid);
					var title = $('<div class="title">');
					var h3 = $('<h3>');
					if (orderby == "alphabet") {
						h3.append(value.wtitle);
					}
					if (orderby == "date") {
						h3.append($.formatDateTime('yy-mm-dd', (new Date(
								value.wstart))));
					}
					if (orderby == "like") {
						h3.append("人氣：" + value.wlike);
					}
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

		function getFollowCount() {
			$.get('follow/getFollowCount.controller', {
				mid : mid
			}, function(data) {
				$('#followCount').append(data.followCount);
				$('#workCount').append(data.workCount);
			});
		}

		var frm = $('form', '#sc');
		var wid = frm.find('input[name=wid]');
		var check = frm.find('input[name=isscore]');
		var sctb = frm.find('tbody');
		var score = frm.find('input[type=text][name^=score]');
		var ms = frm.children('span').eq(0);
		var version = frm.find('input[name=scoreversion]');
		function setversion(v) {
			version.val(v);
			version.next('span').text(v);
		}
		check.on('change', function() {
			sctb.toggleClass('show hide');
			updateScore(true);
		});
		frm.find('input[value=submit]').on('click', function() {
			updateScore(false);
		});
		function updateScore(lock) {
			var valid = false;
			if (check.prop('checked'))
				score.each(function() {
					if ($(this).val().trim() != '')
						valid = true;
				});
			else
				valid = true;
			if (valid)
				$.post("record/update.controller", frm.serialize() + "&lock="
						+ lock, function(data) {
					if (data) {
						swal('成功','評分切換','success');//？
						if (!lock)
							setversion(version.val() * 1 + 1);
					} else if (data === "")
						swal('警告','24小時之內只能修改三次','warning');
					else
						swal('錯誤','error','error');
				});
			else
				swal('開啟評分須有項目','請選填至少一欄評分項目','warning');
		}
		var statfrm = $('form#stats');
		var selectversion = statfrm.find('select[name=selectedversion]');
		var stattb = statfrm.find('table');
		var items = stattb.find('tbody>tr>td:first-child');
		statfrm.children('button[name=switch]').on('click', function() {
			stattb.toggleClass('show hide');
			if ($(this).val() == 'showstats') {
				$(this).val('close');
				$(this).empty();
				$(this).append('<i class="glyphicon glyphicon-remove">');
			} else {
				$(this).val('showstats');
				$(this).empty();
				$(this).append('<i class="glyphicon glyphicon-info-sign">');
			}
		}).on('click', function() {
			var ver = selectversion.val();
			if (ver == version.val()) {
				setCurrent();
			} else {
				setScore(ver);
			}
			setStat(ver);
		});

		selectversion.on('change', function() {
			var ver = $(this).val();
			if (ver != version.val()) { //get scores from tb_score
				setScore(ver);
			} else {
				setCurrent();
			}
			setStat(ver);
		});
		function setCurrent() { //get scores from tb_work
			$.get("record/getw.controller", {
				wid : wid.val()
			}, setItem);
		}
		function setScore(ver) {
			$.get('record/gets.controller', {
				wid : wid.val(),
				scoreversion : ver
			}, setItem);
		}
		function setItem(data) {
			items.each(function(i) {
				var item = data['score_' + (i + 1)];
				if (item != null && item.trim() != "") {
					$(this).parent('tr').show();
					$(this).text(item);
				} else {
					$(this).parent('tr').hide();
				}
			});
		}
		function setStat(ver) { //getstats and set to table
			$.get('record/getst.controller', {
				wid : wid.val(),
				scoreversion : ver
			}, function(data) {
				for (var i = 0; i < 5; i++) { //max,min,avg...
					for (var j = 0; j < items.length; j++) { //record1-5
						var str='';
						if(data)
							str=data[i]['record_' + (j + 1)];
						stattb.find('tbody>tr>td:nth-child(' + (i + 2) + ')')
							.eq(j).text(str);	
					}
				}
			});
		}
		var datatb = $('tbody', '#dt');
		var title = datatb.find('input[name=wtitle]');
		var info = datatb.find('textarea[name=winfo]');
		var wmsg = datatb.find('input[name=iswmsg]');
		var sl = datatb.find('select[name=aid]');
		var datamsg = $('form>span', '#dt');
		$('input[value=submit]', datatb).click(
				function() {
					if (title.val().trim() != ''){
						info.val(info.val().replace(/\r?\n/g, '<br />'));
						$.post('work/update.controller', $('form', '#dt')
								.serialize()
								+ '&wid=' + wid.val(), function(data) {
							if (data){
								var targets=$('input[name=wid]','#photoContainer');
								for(var i=0;i<targets.length;i++){
									var current=targets.eq(i);
									if(current.val()==wid.val()){
										var div=current.parent('div.img-box');	
										div.children('img').attr('title',title.val());
										div.next('.title').children('h3').text(title.val());
										break;
									}	
								}
								info.val(info.val().replace(/<br \/>/g,'\n'));
								swal('成功','編輯完成','success');
							}
							else
								swal('失敗','編輯失敗','error');
						});
					}
					else
						swal('警告',"標題未輸入",'warning');
				});
		function showModal(i) {
			wid.val(i);
			clearMsg();
			$.get("tag/get.controller", {
				wid : wid.val()
			}, function(data) {
				$('form>ul', '#tag').empty();
				showTags(data);
			});
			$.get("record/getw.controller", { //get work 
				wid : wid.val()
			}, function(work) {
				$.get('album/get.controller', {
					mid : mid
				},
						function(data) {
							var target = $('select[name=aid]', datatb);
							target.empty();
							for (var i = 0; i < data.length; i++) {
								if (work.albumBean
										&& work.albumBean.aid == data[i].aid)
									$(
											'<option value="'+data[i].aid+'" selected>'
													+ data[i].aname
													+ '</option>').appendTo(
											target);
								else
									$(
											'<option value="'+data[i].aid+'">'
													+ data[i].aname
													+ '</option>').appendTo(
											target);
							}
						});
				title.val(work.wtitle);
				info.val(work.winfo.replace(/<br \/>/g,'\n'));
				wmsg.prop('checked', work.iswmsg);
				if (work.isscore) {
					check.prop("checked", true);
					sctb.removeClass().addClass('show');
				} else {
					check.prop("checked", false);
					sctb.removeClass().addClass('hide');
				}
				for (var i = 0; i < score.length; i++) {
					score.eq(i).val(work['score_' + (i + 1)]);
				}
				setversion(work.scoreversion);
			});
			$.get('record/getsv.controller', {
				wid : wid.val()
			}, function(data) {
				selectversion.empty();
				for (var i = 1; i <= data; i++) {
					if (i == data)
						$('<option value="'+i+'"selected>' + i + '</option>')
								.prependTo(selectversion);
					else
						$('<option value="'+i+'">' + i + '</option>')
								.prependTo(selectversion);
				}
			});
			$('#EditModal').modal();
		}
		$('input[name=new]', datatb).click(
				function() {
					var t = $(this);
					var aname = t.prev('input[name=aname]');

					if (t.val() == '新增') {
						t.val('確認');
						aname.attr('type', 'text');
						sl.hide();
					} else if (t.val() == '確認') {
						if (aname.val().trim() != '') {
							var nex = true;
							sl.children('option').each(function() {
								if ($(this).text() == aname.val().trim())
									nex = false;
							});
							if (nex) {
								$.post('album/insert.controller', {
									aname : aname.val()
								}, function(data) {
									if (data) {
										$(
												'<option value="'+data.aid+'">'
														+ data.aname
														+ '</option>')
												.appendTo(sl);
										t.val('新增');
										aname.attr('type', 'hidden').val('');
										sl.show();
										swal('成功','新增相簿成功','success');
									} else
										swal('失敗','新增相簿失敗','error');
								});
							} else
								swal('錯誤','相簿已存在','error');
						} else {
							swal('成功','相簿已刪除','success');
							t.val('新增');
							aname.attr('type', 'hidden');
							sl.show();
						}
					}
				});
		var divadd = $('#addtag');
		var divedit = $('#edittag');
		var deltagbutton = divedit.find('input[name=delete]');
		var locktagbutton = divedit.find('input[name=lock]');
		var itag = divadd.find('input[name=tag]');
		var addtagbutton = divadd.find('button[name=add]');
		var addmsg = divadd.children('span');
		var editmsg = divedit.children('span');
		var targettag = divedit.find('input[name=targettag]');

		divadd.find('button[value=cancel]').click(addtags);
		$('button[value=addtag]', '#tag').click(addtags);
		addtagbutton
				.on(
						'click',
						function() {
							clearMsg();
							var tags = itag.val();
							if (/^[A-Za-z \u4E00-\u9FFF]+[A-Za-z ,\u4E00-\u9FFF]*[A-Za-z \u4E00-\u9FFF]+$/
									.test(tags)
									&& tags.trim() != "") {
								var stag = tags.trim().split(",");
								for (var i = 0; i < stag.length; i++) {
									if (stag[i].length > 20) {
										swal('錯誤',"標籤必須在20字以下",'error');
										return;
									}
								}
								var message = "";
								var current = $('form>ul>li>a', '#tag');
								current.each(function() {
									var ctag = $(this).text();
									for (var i = 0; i < stag.length; i++) {
										if (stag[i] == ctag) {
											message = message
													+ stag.splice(i, 1)[0]
													+ " ";
											i = i - 1;
										}
									}
								});
								if (stag.length == 0) {
									swal('標籤重複',"全部重複",'error');
								} else if (current.length + stag.length <= 20) {
									$
											.post(
													"tag/add.controller",
													{
														wid : wid.val(),
														tags : stag
													},
													function(data) {
														if (data) {
															showTags(data);
															if (message != "")
																swal('標籤重複',"標籤已存在: "+message,'warning');
															else
																swal("成功",'新增標籤成功','success');
															itag.val("");
														} else
															swal('錯誤',"error",'error');
													});
								} else
									swal('警告',"標籤不能超過10個",'warning');
							} else
								swal('格式錯誤',"以逗點分隔，限中英文與空白，且輸入兩字以上，最多10個，每個最多20字元",'error');
						});

		$('form>ul', '#tag').on('click', 'li>a', function(e) {
			e.preventDefault();
			clearMsg();
			var s = $(this).text();
			var i = s.indexOf('*');
			var ls;
			if (i >= 0) {
				s = s.substring(0, i);
				deltagbutton.prop("disabled", true);
				ls = "unlock " + s;
			} else {
				deltagbutton.prop("disabled", false);
				ls = "lock " + s;
			}
			targettag.val(s);
			var ds = "delete " + s;
			if (divedit.hasClass("itagh")) {
				divedit.toggleClass("itags itagh").find('span').text("");
				deltagbutton.val(ds);
				locktagbutton.val(ls);
			} else if (deltagbutton.val() != ds || locktagbutton.val() != ls) {
				deltagbutton.val(ds);
				locktagbutton.val(ls);
			} else
				divedit.toggleClass("itags itagh").find('span').text("");

		});
		deltagbutton.on('click', function() {
			clearMsg();
			var tag = deltagbutton.val().substr(7);
			$.ajax({
				url : "tag/del.controller",
				data : {
					wid : wid.val(),
					tag : tag
				}
			}).done(
					function(data) {
						if (data) {
							$('form>ul>li>a:contains("' + tag + '")', '#tag')
									.parent('li').remove();
							divedit.toggleClass("itags itagh").find('span')
									.text("");
							deltagbutton.val("delete");
							locktagbutton.val("lock");
							addtagbutton.prop("disabled", false);
						} else
							editmsg.text("failed to delete");
					});

		});
		locktagbutton.on('click', function() {
			clearMsg();
			var rtag = locktagbutton.val();
			var tag = rtag.substring(rtag.indexOf("lock") + 5);
			var target = $('form>ul>li>a:contains("' + tag + '")', '#tag');
			var islock = deltagbutton.prop("disabled");
			$.get('tag/lock.controller', {
				wid : wid.val(),
				tag : tag,
				islock : islock
			}, function(data) {
				if (data) {
					deltagbutton.prop("disabled", !islock);
					if (islock) {
						locktagbutton.val("lock " + tag);
						target.text(tag);
						editmsg.text('unlocked');
					} else {
						locktagbutton.val("unlock " + tag);
						target.text(tag + "*");
						editmsg.text('locked');
					}
				} else
					editmsg.text('failed');
			});

		});
		deltagbutton.next('button[value=cancel]').click(function cancele() {
			clearMsg();
			divedit.toggleClass("itags itagh");
		});
		function addtags() {
			clearMsg();
			divadd.toggleClass("itags itagh");
			itag.val("");
		}
		function showTags(data) {
			var target = $('form>ul', '#tag');
			for (var i = 0; i < data.length; i++) {
				if (data[i].lock)
					data[i].tag += "*";
				$(
						'<li class="tag"><a class="label label-default" href="" target="_blank">'
								+ data[i].tag + '</a></li>').appendTo(target);
			}
			if ($('li>a', '#tag').length == 10)
				addtagbutton.prop("disabled", true);
		}
		function clearMsg() {
			editmsg.text('');
			addmsg.text('');
			datamsg.text('');
			ms.text('');
		}
		$('#closeModal').click(function(){
			$('#EditModal').modal('hide');
			stattb.removeClass().addClass('hide table table-border');
			var s=statfrm.children('button[name=switch]');
			s.val('showstats');
			s.empty();
			s.append('<i class="glyphicon glyphicon-info-sign">');
		});
	});
</script>
<jsp:include page="top/modal.jsp"></jsp:include>
</body>
</html>