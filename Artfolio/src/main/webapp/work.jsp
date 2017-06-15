<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
<link href='css/bootstrap-theme.min.css'>
<link href='css/style.css' rel='stylesheet'>
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>

<jsp:include page="top/header.jsp"></jsp:include>

<div class="container" style="margin-top:100px;">
  <div class="row" style="position:absolute;">
	<div id="wk">
		<form role="form" action="work/upload.controller" method="post" enctype="multipart/form-data">
			<div style="position:relative;">
				<input type="file" name="files" accept="image/*" style="display: none" required multiple> <img style="width:50px; cursor:pointer;" src="img/icon-upload.png">
				<input class="btn btn-success" type="submit" value="確認">
				<hr>
			</div>
			<table class="table" style="float:left; width:350px; border:solid 2px silver; margin-right:15px;">
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
						<td><input type="text" name="wtitle" required></td>
					</tr>
					<tr>
						<td>內文</td>
						<td><textarea name="winfo"></textarea></td>
					</tr>
					<tr>
						<td>相簿</td>
						<td><select name="aid"></select><input type="hidden" name="aname"><input class="btn btn-primary btn-sm" style="float:right; margin-right:5px;" type="button"
							name="new" value="新增"></td>
					</tr>
					<tr>
						<td>開放留言</td>
						<td><input type="checkbox" name="iswmsg" value="true" checked></td>
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

</body>
<script>
	function listalbum(){
		$.get('album/get.controller',function(data){
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
	$(raw).hide();
	
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
			var clone = rawtable.cloneNode(true);
			var file = files[i];
			if (!/^image\//.test(file.type)) {
				continue;
			}
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
	$('#wk').on('click','input[name^=new]',function(){
		var t=$(this);
		var aname=t.prev('input[name^=aname]');
		var sl=aname.prev('select[name^=aid]');
		if(t.val()=='新增'){
			t.val('確認');
			aname.attr('type','text');
			sl.hide();
		}else if(t.val()=='確認'){
			if(aname.val().trim()!='')
			$.post('album/insert.controller',{aname:aname.val()},function(data){
				if(data){
					$('<option value="'+data.aid+'">'+data.aname+'</option>').appendTo($('select[name^=aid]','#wk'));
					t.val('新增');
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
</script>
</html>