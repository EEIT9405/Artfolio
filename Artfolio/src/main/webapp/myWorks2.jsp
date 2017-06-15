<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Space</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/workWindow.css">
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
</style>

</head>
<body>
<!-- Navigation -->
<jsp:include page="top/header.jsp"></jsp:include>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My folio
                    <small>my folio</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">我的作品</li>
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
    						<img style="width:150px;" src="/img/designer-512.png">
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
				  	<div style="margin-top:10px;">
				    	<a id="wupload" class="btn btn-primary">上傳</a>
				    	<a id="wedit" class="btn btn-default">編輯</a>
				    </div>
				  </div>
				</div>
            </div>
            
	<div id="photoContainer" class="col-md-10" style="overflow-y:auto; height:450px;">
         <!-- Projects Row -->
        <div class="row">
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
		          <div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
        </div>
        <!-- /.row -->
        
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
		          <div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>

	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
		          <div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
        </div>
        <!-- /.row -->
	</div>
	<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="EditModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <div id="sc">
		<form>
			<table>
				<tbody>
					<tr>
						<td><div id="modalimage"></div></td>
					</tr>
					<tr>
						<td>title</td>
						<td><input type="text" name="wtitle" required></td>
					</tr>
					<tr>
						<td>info</td>
						<td><textarea name="winfo"></textarea></td>
					</tr>
					<tr>
						<td>album</td>
						<td><select name="aid"></select><input type="hidden" name="aname"><input type="button"
							name="new" value="new"></td>
					</tr>
					<tr>
						<td>iswmsg</td>
						<td><input type="checkbox" name="iswmsg" value="true" checked></td>
					</tr>
				</tbody>
			</table>
			<table>
				<thead>
					<tr>
						<td>
							<input type="checkbox" name="isscore" value="false">
							isscore current version:
							<input type="hidden" name="scoreversion">
							<span></span>
						</td>
					</tr>
				</thead>
				<tbody class="hide">
					<tr>
						<td><input type="text" name="score_1"></td>
					</tr>
					<tr>
						<td><input type="text" name="score_2"></td>
					</tr>
					<tr>
						<td><input type="text" name="score_3"></td>
					</tr>
					<tr>
						<td><input type="text" name="score_4"></td>
					</tr>
					<tr>
						<td><input type="text" name="score_5"></td>
					</tr>
					<tr>
						<td style="text-align: center">
							<input type="button" value="submit">
						<td>
					</tr>
				</tbody>
			</table>
			<span></span> <input type="hidden" name="wid">
		</form>
		
	</div>
	<div style="height:100px" id="tag" class="row">
							<div class="col-md-10">
								<form>
									<ul style="height:60px;">
										<li class="tag"></li>
									</ul>

									<div id="addtag" class="itagh">
										<input type="text" name="tag" value="">
										<button class="btn btn-primary" type="button" name="add" value="add"><span class="glyphicon glyphicon-plus"></span></button>
										<button class="btn btn-danger" type="button" value="cancel"><span class="glyphicon glyphicon-remove"></span></button>
										<span></span>
									</div>
									<div id="edittag" class="itagh">
										<input type="hidden" name="targettag"> 
										<input type="button" name="lock" value="lock"> 
										<input type="button" name="delete" value="delete"> 
										<input type="button" value="cancel"> <span></span>
									</div>
								</form>
								</div>
								<div style="margin-top:50px;" class="col-md-2">
									<button style="margin-left:0;" class="btn btn-primary" type="button" value="addtag"
											><span style="font-size:15px;" class="glyphicon glyphicon-tag"></span></button>
								</div>
						</div>
	<div>
		<form id="stats">
			<select name="selectedversion"></select>
			<input type="button" name="switch" value="showstats">
			<table  class="hide">
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
    </div>
  </div>
</div>
	
        <hr>

        <!-- Footer -->
<!--         <footer> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <p>Copyright &copy; Your Website 2014</p> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </footer> -->

</div>

<jsp:include page="top/footer.jsp"></jsp:include>

<!-- /.container -->

<!-- JS -->
<script src="js/jquery.formatDateTime.min.js"></script>
<script>
$(function(){
	var wedit = $('#wedit');
	var wupload = $('#wupload');
	var sortbtn = $('#sortList').children('li.sortbtn');
	var photoContainer = $('#photoContainer');
	
	listWork(1, "alphabet", "ascending");	
	//開啟編輯功能
	wedit.click(function(){
		var a1 = $('<a title="remove" class="btn btn-circle btn-danger glyphicon glyphicon-remove">');
		var a2 = $('<a title="edit" class="btn btn-circle btn-primary glyphicon glyphicon-pencil">');
		var editer = $('#photoContainer div.editer');
		if(wedit.text() == "編輯"){
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
				editer.eq(i).append(a1.clone());
				editer.eq(i).append(a2.clone());
			}
			wedit.text('取消');
		}else {
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
			}
			wedit.text('編輯');
		}
	});
	//刪除或編輯

	$('#photoContainer').on('click', 'div.editer a', function(){
		var btn = $(this);
		if(btn.attr('title') == "remove"){
			console.log("remove");
		}
		if(btn.attr('title') == "edit"){
			var mb = $('#modalimage').empty();
			var div=$(this).parents('div.img-box');
			div.children('img').clone().attr("style","max-width:100%;max-height:500px").addClass(
			'img-fluid').appendTo(mb);
			showModal(div.children('input[name=wid]').val());
		}
	});
	
	//上傳
	wupload.click(function(){
		console.log("上傳");
	});
	
	sortbtn.click(function(){
		var sort = $(this).children('a');
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
			var row = $('<div class="row">');
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
				row.append(col);
			});
			photoContainer.append(row);
		});
	}
	
	var frm = $('form','#sc');
	var wid = frm.find('input[name=wid]');
	var check = frm.find('input[name=isscore]');
	var sctb = frm.find('tbody:last');
	var score = frm.find('input[type=text][name^=score]');
	var ms = frm.children('span').eq(0);
	var version = frm.find('input[name=scoreversion]');
	function setversion(v) {
		version.val(v);
		version.next('span').text(v);
	}
	check.on('change', function() {
		sctb.toggleClass('show hide');
		var b = check.prop('checked');
		check.val(b);
		$.post("record/update.controller", frm.serialize()
				+ "&lock=true", function(data) { //lock only,not insert
			if (data) {
				ms.text('done');
			} else
				ms.text('error');
		});
	});
	frm.find('input[value=submit]').on(
			'click',
			function() {
				$.post("record/update.controller", frm.serialize()
						+ "&lock=false", function(data) {
					if (data) {
						ms.text('done');
						setversion(version.val() * 1 + 1);
					} else if(data==="")
						ms.text('can only change up to 3 times in 24 hours');
					else
						ms.text('error');
				});
			});
	
	var statfrm=$('form#stats');
	var selectversion=statfrm.find('select[name=selectedversion]');
	var stattb=statfrm.find('table');
	var items=stattb.find('tbody>tr>td:first-child');
	statfrm.children('input[name=switch]').on('click',function(){
		stattb.toggleClass('show hide');
		if ($(this).val()=='showstats'){
			$(this).val('close');
		}	
		else{
			$(this).val('showstats');
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
	var datatb=frm.find('tbody:first');
	function showModal(i){
		wid.val(i);
		$.get("tag/get.controller", {
			wid : wid.val()
		},function(data){
			$('form>ul','#tag').empty();
			showTags(data); 
		});
		$.get("record/getw.controller", { //get work 
			wid : wid.val()
		}, function(work) {
			datatb.find('input[name=wtitle]').val(work.wtitle);
			datatb.find('textarea[name=winfo]').val(work.winfo);
			datatb.find('input[name=iswmsg]').prop('checked',work.iswmsg);
			$.get('album/get.controller',function(data){
				var target=$('select[name=aid]',datatb);
				target.empty();
				for(var i=0;i<data.length;i++){
					$('<option value="'+data[i].aid+'">'+data[i].aname+'</option>').appendTo(target);
				}
			});
			if (work.isscore) {
				check.prop("checked", true);
				check.val('true');
				sctb.removeClass().addClass('show');
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
		$('#EditModal').modal();
	}
	$('input[name=new]','#sc').click(function(){
		var t=$(this);
		var aname=t.prev('input[name=aname]');
		var sl=aname.prev('select[name=aid]');
		if(t.val()=='new'){
			t.val('submit');
			aname.attr('type','text');
			sl.hide();
		}else if(t.val()=='submit'){
			if(aname.val().trim()!='')
			$.post('album/insert.controller',{aname:aname.val()},function(data){
				if(data){
					$('<option value="'+data.aid+'">'+data.aname+'</option>').appendTo(sl);
					t.val('new');
					aname.attr('type','hidden');
					sl.show();
				}else if(data===''){
					alert('login');
				}else
					alert('failed')
			});
			else
				alert('blank')
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
				editmsg.text('');
				var tags = itag.val();
				if (/^[A-Za-z \u4E00-\u9FFF]+[A-Za-z ,\u4E00-\u9FFF]*[A-Za-z \u4E00-\u9FFF]+$/.test(tags) && tags.trim() != "") {
					var stag = tags.trim().split(",");
					for (var i=0;i<stag.length;i++){
						if(stag[i].length>20){
							addmsg.text("length of tag must be less than or equal to 20.");
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
		addmsg.text('');
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
		addmsg.text('');
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
		addmsg.text('');
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
				editmsg.text('failed to lock or unlock');
		});
		
	});
	deltagbutton.next('input[value=cancel]').click(function cancele(){
		addmsg.text('');
		divedit.toggleClass("itags itagh").find('span').text("");
	});
	function addtags() {
		editmsg.text('');
		divadd.toggleClass("itags itagh").find('span').text("");
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
});
</script>
</body>
</html>