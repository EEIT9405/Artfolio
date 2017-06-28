<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>
<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
<link href='css/bootstrap-theme.min.css'>
<link href='css/style.css' rel='stylesheet'>
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<script src='/Artfolio/js/sweetalert.min.js'></script>
<style>
*{
	font-family:monospace 微軟正黑體;
}
.img-style {
	overflow: hidden;
	width: 200px;
	height: 200px;
	margin-top: 12px;
	margin-bottom: 12px;
	position: relative;
}

.img-style img {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width: 100%;
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

	<jsp:include page="top/header.jsp"></jsp:include>

	<div class="container" style="margin-top: 100px; min-height:750px; height:auto;">
		<div class="row">
			<div id="wk">
				<form role="form" action="work/upload.controller" method="post"
					enctype="multipart/form-data">
					<div class="col-md-12" style="text-align:center;">
						<a style="position:absolute; left:5px; font-size:50px;" href="/Artfolio/myWorks.jsp"><i class="glyphicon glyphicon-arrow-left"></i></a>
						<input type="file" name="files" accept="image/*"
							style="display: none" required multiple> <img
							style="width: 50px; cursor: pointer;" src="img/icon-upload.png">
						<input class="btn btn-success" type="submit" value="確認">
						<hr>
					</div>
					<table class="table"
						style="float: left; width: 350px; border: solid 2px silver; margin-right: 15px;">
						<thead>
							<tr>
								<th colspan="2">圖片</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>檔案</td>
								<td></td>
							</tr>
							<tr>
								<td>檔名</td>
								<td><input type="text" name="filename" readonly></td>
							</tr>
							<tr>
								<td>標題</td>
								<td><input type="text" name="wtitle"></td>
							</tr>
							<tr>
								<td>內文</td>
								<td><textarea name="winfo"></textarea></td>
							</tr>
							<tr>
								<td>標籤</td>
								<td><input type="text" name="tags"></td>
							</tr>
							<tr>
								<td colspan="2">(以逗點分隔，限中英文與空白，且輸入兩字以上，最多10個，每個最多20字元)</td>
							</tr>
							<tr>
								<td>相簿</td>
								<td><select name="aid"></select><input type="hidden"
									name="aname"><input class="btn btn-primary btn-sm"
									style="float: right; margin-right: 5px;" type="button"
									name="new" value="新增"></td>
							</tr>
							<tr>
								<td>開放留言</td>
								<td><input type="checkbox" name="iswmsg" value="true"
									checked></td>
							</tr>
							<tr>
								<td>開放評分</td>
								<td><input type="checkbox" name="isscore" value="true"></td>
							</tr>
							<tr>
								<td>評分項目1：</td>
								<td><input type="text" name="score_1"></td>
							</tr>
							<tr>
								<td>評分項目2：</td>
								<td><input type="text" name="score_2"></td>
							</tr>
							<tr>
								<td>評分項目3：</td>
								<td><input type="text" name="score_3"></td>
							</tr>
							<tr>
								<td>評分項目4：</td>
								<td><input type="text" name="score_4"></td>
							</tr>
							<tr>
								<td>評分項目5：</td>
								<td><input type="text" name="score_5"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="top/footer.jsp"></jsp:include>
</body>
<script>
	function listalbum(){
		$.get('album/get.controller',{mid:'${loginOK.mid}'},function(data){
			var target=$('select[name^=aid]','#wk');
			target.empty();
			for(var i=0;i<data.length;i++){
				$('<option value="'+data[i].aid+'">'+data[i].aname+'</option>').appendTo(target);
			}
		});
	}
	var frm = document.querySelector('#wk>form');
	var f = document.querySelector('input[type=file]');
	var raw =document.querySelector('#wk table');
	var rawtable = raw.cloneNode(true);
	$(raw).remove();
	
	$('form>div>img', '#wk').click(function() {
		if (f)
			f.click();
	});
	f.onchange = function() {
		var files = f.files;
		var tables = frm.querySelectorAll('table');
		for (var i = 0; i < tables.length; i++) {
			frm.removeChild(tables[i]);
		}
		for (var i = 0; i < files.length; i++) {
			
			var file = files[i];
			if (!/^image\//.test(file.type)) {
				continue;
			}
					
			var clone = rawtable.cloneNode(true);
			
			var img = document.createElement("img");
			var div = document.createElement('div');
			div.className='img-style';
			var reader = new FileReader();
			reader.onload = (function(aImg) {
				return function(e) {
					aImg.src = e.target.result;
				};
			})(img);
			reader.readAsDataURL(file);
			
			
			var trs = $('tbody>tr', clone);
			div.appendChild(img);
			trs.eq(0).children('td:last-child').get(0).appendChild(div);
			trs.eq(1).find('td>input').val(file.name);
			var inputs = clone.querySelectorAll('*[name]');
			for (var j = 0; j < inputs.length; j++) {
				inputs[j].name = inputs[j].name + "_" + i;
			}
			frm.appendChild(clone);
		}
		listalbum();
	};
	$(frm).on('click','input[name^=new]',function(){
		var t=$(this);
		var aname=t.prev('input[name^=aname]');
		var sl=aname.prev('select[name^=aid]');
		if(t.val()=='新增'){
			t.val('確認');
			aname.attr('type','text').attr('placeholder','input here then click check');
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
							$('<option value="'+data.aid+'">'+data.aname+'</option>').appendTo($('select[name^=aid]','#wk'));
							t.val('新增');
							aname.attr('type','hidden').val('');
							sl.show();
						}else
							swal("失敗", 'Something went wrong!', "error");
					});
				}else
					swal('相簿已存在', '請輸入其他名稱', "warning");
			}
			else{
				swal('錯誤', '相簿名稱不得為空白', "warning");
				t.val('新增');
				aname.attr('type','hidden');
				sl.show();
			}		
		}
	});
	$('input[type=submit]').click(
		function(e){
			e.preventDefault();
			var c=[],t=[],tg=[],msg='';
			$('tbody','#wk').each(function(i){
				var filename=$(this).find('input[name^=filename]').val();
				var tags=$(this).find('input[name^=tags]').val().trim();
				if(tags!='' && !/^[A-Za-z \u4E00-\u9FFF]+[A-Za-z ,\u4E00-\u9FFF]*[A-Za-z \u4E00-\u9FFF]+$/
						.test(tags))
					tg.push(filename);
				else if(tags!=''){
					var stag = tags.trim().split(",");
					if(stag.length>10)
						tg.push(filename);
					else
					for (var i=0;i<stag.length;i++){
						if(stag[i].trim().length>20){
							tg.push(filename);
							break;
						}
					}
				}
				if($(this).find('input[name^=wtitle]').val().trim()=='')
					t.push(filename);
				
				var info=$(this).find('textarea[name^=winfo]');
				info.val(info.val().replace(/\r?\n/g, '<br />'));
		  		var check=$(this).find('input[name^=isscore]');
		  		if(check.prop('checked')){
		  			var f=true;
		  			$(this).find('input[name^=score]').each(function(i){
		  				if($(this).val().trim()!='')
		  					f=false;
		  			});
		  			if(f){
		  				check.prop('checked',false);
		  				c.push(filename);
		  			}
		  		}
		  	});
			if(f.files.length<=0){
				msg='選擇圖片\n';
			}
			if(tg.length>0){
				msg=msg+'tag格式錯誤:'+tg.toString()+'\n';
			}
			if(t.length>0){
				msg=msg+'須輸入標題:'+t.toString()+'\n';
			}
			if(c.length>0){
				msg=msg+'開放評分必須有項目，已強制關閉:'+c.toString();
			}
			if(msg!=''){
				swal('錯誤',msg,'error');
			}
			else
				frm.submit();
		}
	);
	
</script>
</html>