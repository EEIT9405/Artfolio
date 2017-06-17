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
<link rel="stylesheet" href="/Artfolio/css/workWindow.css">
<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}
.img-box {
	overflow: hidden;
	width: 180px;
	height: 180px;
	margin-top: 12px;
	margin-bottom: 12px;
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
                <h1 class="page-header">My folio
                    <small>我的作品集</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/Artfolio/index.jsp">Home</a>
                    </li>
                    <li><a href="/Artfolio/myWorks.jsp">我的作品</a></li>
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
				  	<div style="margin-top:10px;">
				    	<a id="wupload" href="/Artfolio/work.jsp" class="btn btn-primary">上傳</a>
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

<div class="modal fade " id="EditModal" tabindex="-1" role="dialog"
	aria-labelledby="EditModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
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
						<table class="hide table table-bordered">
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
		
		if(wedit.text() == "編輯"){
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
				editer.eq(i).append(a1.clone());
				editer.eq(i).append(a2.clone());
			}
			imgbox.addClass('wave');
			photoContainer.sortable({stop: function(event, ui) {
			    result = photoContainer.sortable("toArray");
			}});
			wedit.text('取消');
		}else {
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
			}
			wedit.text('編輯');
			imgbox.removeClass('wave');
			photoContainer.sortable('destroy');
			console.log(result);
		}
	});
	//刪除或編輯

	photoContainer.on('click', 'div.editer a', function(){
		var btn = $(this);
		if(btn.attr('title') == "remove"){
			var div=$(this).parents('div.img-box');
			var wid=div.children('input[name=wid]').val();
			if(window.confirm("真的要刪除此作品嗎？"))
			$.post('work/delete.controller',{wid:wid},function(data){
				if(data){
					div.parent().remove();
					alert('刪除成功');
				}
				else
					alert('刪除失敗');
			});
		}
		if(btn.attr('title') == "edit"){
			var mb = $('#modalimage').empty();
			var div=$(this).parents('div.img-box');
			div.children('img').clone().attr("style","max-width:100%;max-height:500px").addClass(
			'img-fluid').appendTo(mb);
			showModal(div.children('input[name=wid]').val());
		}
	});
	
	sortbtn.click(function(){
		var sort = $(this).children('a');
		if(sort.hasClass('album')){
			listWork(1, "date", "ascending");	
		}
		if(sort.hasClass('timeup')){
			listWork(1, "date", "ascending");	
		}
		if(sort.hasClass('timedown')){
			listWork(1, "date", "descending");	
		}
		if(sort.hasClass('likeup')){
			listWork(1, "like", "ascending");
		}
		if(sort.hasClass('likedown')){
			listWork(1, "like", "descending");
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
	
	var frm = $('form','#sc');
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
	frm.find('input[value=submit]').on(
			'click',function(){
				updateScore(false);
			}
			);
	function  updateScore(lock) {
		var valid=false;
		if(check.prop('checked'))
			score.each(function(){
				if($(this).val().trim()!='')
					valid=true;
			});
		else
			valid=true;
		if(valid)
			$.post("record/update.controller", frm.serialize()
					+ "&lock="+lock, function(data) {
				if (data) {
					ms.text('done');
					if(!lock)
					setversion(version.val() * 1 + 1);
				} else if(data==="")
					alert('24小時之內只能修改三次');
				else
					alert('error');
			});
		else
			alert('開啟評分須有項目');
	}
	var statfrm=$('form#stats');
	var selectversion=statfrm.find('select[name=selectedversion]');
	var stattb=statfrm.find('table');
	var items=stattb.find('tbody>tr>td:first-child');
	statfrm.children('button[name=switch]').on('click',function(){
		stattb.toggleClass('show hide');
		if ($(this).val()=='showstats'){
			$(this).val('close');
			$(this).empty();
			$(this).append('<i class="glyphicon glyphicon-remove">');
		}	
		else{
			$(this).val('showstats');
			$(this).empty();
			$(this).append('<i class="glyphicon glyphicon-info-sign">');
		}
	}).one('click',function(){
		var ver=selectversion.val();
		if(ver==version.val()){
			setCurrent();
		}else{
			setScore(ver);
		}
		setStat(ver);
	});
	
	selectversion.on('change',function(){
		var ver=$(this).val();
		if(ver!=version.val()){ //get scores from tb_score
			setScore(ver);
		}else{
			setCurrent();
		}
		setStat(ver);
	});
	function setCurrent(){ //get scores from tb_work
		$.get("record/getw.controller", {
			wid : wid.val()
		}, setItem);
	}
	function setScore(ver){
		$.get('record/gets.controller',{wid:wid.val(),scoreversion:ver},setItem);
	}
	function setItem(data){
		items.each(function(i){
			var item=data['score_'+(i+1)];
			if (item!=null && item.trim()!=""){
				$(this).parent('tr').show();
				$(this).text(item);
			}else{
				$(this).parent('tr').hide();
			}
		});
	}
	function setStat(ver){ //getstats and set to table
		$.get('record/getst.controller',{wid:wid.val(),scoreversion:ver},function(data){
			for(var i=0;i<data.length;i++){ //max,min,avg
				for(var j=0;j<items.length;j++){ //record1-5
					stattb.find('tbody>tr>td:nth-child('+(i+2)+')').eq(j).text(data[i]['record_'+(j+1)]);
				}
			}
		});
	}
	var datatb=$('tbody','#dt');
	var title=datatb.find('input[name=wtitle]');
	var info=datatb.find('textarea[name=winfo]');
	var wmsg=datatb.find('input[name=iswmsg]');
	var sl=datatb.find('select[name=aid]');
	var datamsg=$('form>span','#dt');
	$('input[value=submit]',datatb).click(function(){
		if(title.val().trim()!='')
			$.post('work/update.controller',$('form','#dt').serialize()+'&wid='+wid.val(),function(data){
				if(data)
					datamsg.text('done');
				else
					datamsg.text('failed');
			});
		else
			datamsg.text("where's your fucking title?");
	});
	function showModal(i){
		wid.val(i);
		clearMsg();
		$.get("tag/get.controller", {
			wid : wid.val()
		},function(data){
			$('form>ul','#tag').empty();
			showTags(data); 
		});
		$.get("record/getw.controller", { //get work 
			wid : wid.val()
		}, function(work) {
			title.val(work.wtitle);
			info.val(work.winfo);
			wmsg.prop('checked',work.iswmsg);
			$.get('album/get.controller',function(data){
				var target=$('select[name=aid]',datatb);
				target.empty();
				for(var i=0;i<data.length;i++){
					$('<option value="'+data[i].aid+'">'+data[i].aname+'</option>').appendTo(target);
				}
			});
			if (work.isscore) {
				check.prop("checked", true);
				sctb.removeClass().addClass('show');
			}else{
				check.prop("checked", false);
				sctb.removeClass().addClass('hide');
			}
			for (var i = 0; i < score.length; i++) {
				score.eq(i).val(work['score_'+(i+1)]);
			}
			setversion(work.scoreversion);
		});
		$.get('record/getsv.controller',{wid:wid.val()},function(data){
			selectversion.empty();
			for(var i=1;i<=data;i++){
				if(i==data)
				$('<option value="'+i+'"selected>'+i+'</option>').prependTo(selectversion);
				else
				$('<option value="'+i+'">'+i+'</option>').prependTo(selectversion);
			}
		});
		$.get('album/get.controller',function(data){
			var target=$('select[name=aid]','#dt');
			target.empty();
			for(var i=0;i<data.length;i++){
				$('<option value="'+data[i].aid+'">'+data[i].aname+'</option>').appendTo(target);
			}
		});
		$('#EditModal').modal();
	}
	$('input[name=new]',datatb).click(function(){
		var t=$(this);
		var aname=t.prev('input[name=aname]');
		
		if(t.val()=='新增'){
			t.val('確認');
			aname.attr('type','text');
			sl.hide();
		}else if(t.val()=='確認'){
			if(aname.val().trim()!=''){
				var nex=true;
				sl.children('option').each(function(){
					if($(this).text()==aname.val().trim())
						nex=false;
				});
				if(nex){
					$.post('album/insert.controller',{aname:aname.val()},function(data){
						if(data){
							$('<option value="'+data.aid+'">'+data.aname+'</option>').appendTo(sl);
							t.val('新增');
							aname.attr('type','hidden').val('');
							sl.show();
							alert('新增相簿成功');
						}else if(data===''){
							alert('請登入');
						}else
							alert('新增相簿失敗')
					});
				}else
					alert('相簿已存在')
			}
			else{
				alert('相簿已刪除')
				t.val('新增');
				aname.attr('type','hidden');
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
	var targettag=divedit.find('input[name=targettag]');
	
	divadd.find('button[value=cancel]').click(addtags);
	$('button[value=addtag]','#tag').click(addtags);
	addtagbutton.on(
			'click',
			function() {
				clearMsg();
				var tags = itag.val();
				if (/^[A-Za-z \u4E00-\u9FFF]+[A-Za-z ,\u4E00-\u9FFF]*[A-Za-z \u4E00-\u9FFF]+$/.test(tags) && tags.trim() != "") {
					var stag = tags.trim().split(",");
					for (var i=0;i<stag.length;i++){
						if(stag[i].length>20){
							alert("標籤必須在20字以下");
							return;
						}
					}
					var message="";
					var current=$('form>ul>li>a','#tag');
					current.each(function(){
						var ctag=$(this).text();
						for(var i=0;i<stag.length;i++){
							if(stag[i]==ctag){
								message=message+stag.splice(i,1)[0]+" ";
								i=i-1;
							}
						}	
					});
					if(stag.length==0){
						addmsg.text("absorb since all existed");
					}
					else
					if(current.length+stag.length<=20){
						$.post("tag/add.controller", {
							wid : wid.val(),
							tags : stag
						}, function(data){
							if(data){
								showTags(data);
								if(message!="")
									addmsg.text("ignored following tags:"+message+"since existed");
								else
									addmsg.text("done");
								itag.val("");
							}else
								addmsg.text("error");
						});
					}else
						addmsg.text("number of tags is limited to 10");
				} else
					addmsg.text("format error,must begin and end with letters "+ 
							"and contain only letters,space and comma,at least two letters.");
			});
	
	
	
	$('form>ul','#tag').on('click', 'li>a', function(e) {
		e.preventDefault();
		clearMsg();
		var s = $(this).text();
		var i=s.indexOf('*');
		var ls;
		if(i>=0){
			s=s.substring(0,i);
			deltagbutton.prop("disabled",true);
			ls = "unlock "+s;
		}else{
			deltagbutton.prop("disabled",false);
			ls = "lock "+s;
		}
		targettag.val(s);
		var ds = "delete " +s;
		if (divedit.hasClass("itagh")) {
			divedit.toggleClass("itags itagh").find('span').text("");
			deltagbutton.val(ds);
			locktagbutton.val(ls);
		} else if (deltagbutton.val() != ds || locktagbutton.val()!=ls) {
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
		}).done(function(data) {				
			if (data) {
				$('form>ul>li>a:contains("' + tag + '")','#tag').parent('li').remove();
				divedit.toggleClass("itags itagh").find('span').text("");
				deltagbutton.val("delete");
				locktagbutton.val("lock");
				addtagbutton.prop("disabled",false);
			} else
				editmsg.text("failed to delete");
		});

	});
	locktagbutton.on('click',function(){
		clearMsg();
		var rtag = locktagbutton.val();
		var tag = rtag.substring(rtag.indexOf("lock")+5);
		var target = $('form>ul>li>a:contains("'+tag+'")','#tag');
		var islock = deltagbutton.prop("disabled");
		$.get('tag/lock.controller',{wid:wid.val(),tag:tag,islock:islock},function(data){
			if(data){
				deltagbutton.prop("disabled",!islock);
				if(islock){
					locktagbutton.val("lock "+tag);
					target.text(tag);
					editmsg.text('unlocked');
				}
				else{
					locktagbutton.val("unlock "+tag);
					target.text(tag+"*");
					editmsg.text('locked');
				}
			}else
				editmsg.text('failed');
		});
		
	});
	deltagbutton.next('button[value=cancel]').click(function cancele(){
		clearMsg();
		divedit.toggleClass("itags itagh");
	});
	function addtags() {
		clearMsg();
		divadd.toggleClass("itags itagh");
		itag.val("");
	}
	function showTags(data) {
		var target = $('form>ul','#tag');
		for (var i = 0; i < data.length; i++) {
			if (data[i].lock)
				data[i].tag+="*";
			$('<li class="tag"><a class="label label-default" href="" target="_blank">' + data[i].tag+ '</a></li>').appendTo(target);
		}
		if ($('li>a','#tag').length==10)
			addtagbutton.prop("disabled",true);
	}
	function clearMsg(){
		editmsg.text('');
		addmsg.text('');
		datamsg.text('');
		ms.text('');
	}
});
</script>
</body>
</html>