<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='css/bootstrap-theme.min.css'>
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	border: 1px solid black
}
</style>
</head>
<body>
	<div id="wk">
		<form action="work/upload.controller" method="post" enctype="multipart/form-data">
			<input type="file" name="files" accept="image/*" style="display: none" required multiple> <img src="img/a.jpg">
			<table>
				<thead>
					<tr>
						<th colspan="2">work</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>file</td>
						<td></td>
					</tr>
					<tr>
						<td>filename</td>
						<td><input type="text" name="filename" readonly></td>
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
						<td><select name="aid"></select><input type="button"
							value="new"></td>
					</tr>
					<tr>
						<td>iswmsg</td>
						<td><input type="checkbox" name="iswmsg" value="true" checked></td>
					</tr>
					<tr>
						<td>isscore</td>
						<td><input type="checkbox" name="isscore" value="true"></td>
					</tr>
					<tr>
						<td>score_1</td>
						<td><input type="text" name="score_1"></td>
					</tr>
					<tr>
						<td>score_2</td>
						<td><input type="text" name="score_2"></td>
					</tr>
					<tr>
						<td>score_3</td>
						<td><input type="text" name="score_3"></td>
					</tr>
					<tr>
						<td>score_4</td>
						<td><input type="text" name="score_4"></td>
					</tr>
					<tr>
						<td>score_5</td>
						<td><input type="text" name="score_5"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="submit">
		</form>
	</div>
</body>
<script>
	var frm = document.querySelector('#wk>form');
	var f = document.querySelector('input[type=file]');
	var rawtable = document.querySelector('#wk table').cloneNode(true);
	$('form>img', '#wk').click(function() {
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
			img.style = "max-width:200px";
			var reader = new FileReader();
			reader.onload = (function(aImg) {
				return function(e) {
					aImg.src = e.target.result;
				};
			})(img);
			reader.readAsDataURL(file);
			var trs = $('tbody>tr', clone);
			trs.eq(0).children('td:last-child').get(0).appendChild(img);
			trs.eq(1).find('td>input').val(file.name);
			var inputs = clone.querySelectorAll('*[name]');
			for (var j = 0; j < inputs.length; j++) {
				inputs[j].name = inputs[j].name + "_" + i;
			}
			frm.appendChild(clone);
		}
	};
</script>
</html>